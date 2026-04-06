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

    void TreeTraverser::update(const glm::vec2& camera_position) {
        segment_ids_to_render.clear();
        traverse(root_node, camera_position);
    }

    std::vector<glm::int32_t> TreeTraverser::get_segment_ids_to_render() const {
        return segment_ids_to_render;
    }
}