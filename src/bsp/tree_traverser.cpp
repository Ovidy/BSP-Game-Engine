#include <bsp/tree_traverser.h>

namespace bsp {
    TreeTraverser::TreeTraverser() : root_node(nullptr), camera_position(6.0f, 7.0f) {}

    void TreeTraverser::set_root(const std::shared_ptr<Node>& root) {
        root_node = root;
    }

    void TreeTraverser::traverse(const std::shared_ptr<Node>& node) {
        if (!node) return;

        bool on_front = is_on_front(camera_position - node->get_splitter().get_start(), node->get_splitter().get_end() - node->get_splitter().get_start());
        
        if (on_front) {
            traverse(node->get_front());
            segment_ids_to_render.push_back(node->get_segment_id());
            traverse(node->get_back());
        } else {
            traverse(node->get_back());
            segment_ids_to_render.push_back(node->get_segment_id());
            traverse(node->get_front());
        }
    }

    void TreeTraverser::update() {
        segment_ids_to_render.clear();
        traverse(root_node);
    }

    const glm::vec2 TreeTraverser::get_camera_position() const {
        return camera_position;
    }

    std::vector<glm::int32_t> TreeTraverser::get_segment_ids_to_render() const {
        return segment_ids_to_render;
    }
}