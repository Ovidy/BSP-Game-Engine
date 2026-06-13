#include <bsp/tree_traverser.h>

namespace engine
{
    TreeTraverser::TreeTraverser() : root_node(nullptr) {}

    void TreeTraverser::set_root(const std::shared_ptr<Node> &root)
    {
        root_node = root;
    }

    void TreeTraverser::traverse(const std::shared_ptr<Node> &node, const glm::vec2 &camera_position)
    {
        if (!node)
            return;

        bool on_front = is_on_front(camera_position - node->get_splitter().get_start(), node->get_splitter().get_direction());

        if (on_front)
        {
            traverse(node->get_front(), camera_position);
            segment_ids_to_render.push_back(node->get_segment_id());
            traverse(node->get_back(), camera_position);
        }
        else
        {
            traverse(node->get_back(), camera_position);
            // segment_ids_to_render.push_back(node->get_segment_id());  --- We dont need to render the back segment, since it's the same as the front one, just reversed. ---
            traverse(node->get_front(), camera_position);
        }
    }

    void TreeTraverser::get_collision_candidates(const std::shared_ptr<Node> &node, const glm::vec2 &pos, const glm::float32_t &radius, std::unordered_set<glm::int32_t> &out_sector_ids) const
    {
        if (!node)
            return;

        const Segment &splitter = node->get_splitter();

        // 1. Ask your engine exactly which side of the line we are on
        bool on_front = is_on_front(pos - splitter.get_start(), splitter.get_direction());

        // 2. Calculate purely the ABSOLUTE distance to the line
        glm::vec2 dir = glm::normalize(splitter.get_direction());
        float abs_distance = std::abs(cross(pos - splitter.get_start(), dir));

        // 3. We visited this wall, so its sector is nearby. Add it!
        out_sector_ids.insert(splitter.get_sector_id());

        // 4. Traverse safely
        if (abs_distance <= radius)
        {
            // The player's fat cylinder is touching the splitting line!
            // We MUST check both rooms to prevent clipping through doorways.
            get_collision_candidates(node->get_front(), pos, radius, out_sector_ids);
            get_collision_candidates(node->get_back(), pos, radius, out_sector_ids);
        }
        else if (on_front)
        {
            // Player is safely, completely in front of the line
            get_collision_candidates(node->get_front(), pos, radius, out_sector_ids);
        }
        else
        {
            // Player is safely, completely behind the line
            get_collision_candidates(node->get_back(), pos, radius, out_sector_ids);
        }
    }

    void TreeTraverser::update(const glm::vec2 &camera_position)
    {
        segment_ids_to_render.clear();
        traverse(root_node, camera_position);
    }

    const std::vector<glm::int32_t> &TreeTraverser::get_segment_ids_to_render() const
    {
        return segment_ids_to_render;
    }
}
