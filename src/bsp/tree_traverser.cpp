#include <bsp/tree_traverser.h>

namespace bsp {
    TreeTraverser::TreeTraverser() : root_node(nullptr) {}

    void TreeTraverser::set_root(const std::shared_ptr<Node>& root) {
        root_node = root;
    }

    void TreeTraverser::traverse(const std::shared_ptr<Node>& node, const glm::vec2& camera_position) {
        if (!node) return;

        bool on_front = is_on_front(camera_position - node->get_splitter().get_start(), node->get_splitter().get_direction());
        
        if (on_front) {
            traverse(node->get_front(), camera_position);
            segment_ids_to_render.push_back(node->get_segment_id());
            traverse(node->get_back(), camera_position);
        } else {
            traverse(node->get_back(), camera_position);
            // segment_ids_to_render.push_back(node->get_segment_id());  --- We dont need to render the back segment, since it's the same as the front one, just reversed. ---
            traverse(node->get_front(), camera_position);
        }
    }

    void TreeTraverser::get_collision_candidates(const std::shared_ptr<Node>& node, const glm::vec2& pos, const glm::float32_t& radius, std::unordered_set<glm::int32_t>& out_sector_ids) const {
        if (!node) return;

        const Segment& splitter = node->get_splitter();
        glm::vec2 start = splitter.get_start();
        
        // We MUST normalize the direction to get true Euclidean distance
        glm::vec2 dir = glm::normalize(splitter.get_direction());
        
        // Calculate signed perpendicular distance from the player to the line
        float distance = bsp::cross(pos - start, dir);

        // Add the sector of this node to our candidates list. 
        // Because we use a std::unordered_set, duplicate IDs are automatically ignored!
        out_sector_ids.insert(splitter.get_sector_id());

        // Check where the collision circle sits relative to the line
        if (distance > radius) {
            // Circle is completely on one side
            get_collision_candidates(node->get_front(), pos, radius, out_sector_ids);
        } 
        else if (distance < -radius) {
            // Circle is completely on the other side
            get_collision_candidates(node->get_back(), pos, radius, out_sector_ids);
        } 
        else {
            // The distance is SMALLER than the radius! We are touching the line.
            // We must traverse BOTH spaces to ensure we don't clip through walls.
            get_collision_candidates(node->get_front(), pos, radius, out_sector_ids);
            get_collision_candidates(node->get_back(), pos, radius, out_sector_ids);
        }
    }

    void TreeTraverser::update(const glm::vec2& camera_position) {
        segment_ids_to_render.clear();
        traverse(root_node, camera_position);
    }

    const std::vector<glm::int32_t>& TreeTraverser::get_segment_ids_to_render() const {
        return segment_ids_to_render;
    }
}
