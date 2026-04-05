#include <bsp/tree_traverser.h>

namespace bsp {
    TreeTraverser::TreeTraverser() : root_node(nullptr), camera_position(4.0f, 7.0f) {}

    void TreeTraverser::set_root(const std::shared_ptr<Node>& root) {
        root_node = root;
    }

    void TreeTraverser::traverse(const std::shared_ptr<Node>& node) {
        if (!node) return;

        bool on_front = glm::dot(camera_position - node->get_splitter().get_start(), glm::vec2(-node->get_splitter().get_direction().y, node->get_splitter().get_direction().x)) >= 0;

        if (on_front) {
            traverse(node->get_front());
            segment_ids_to_render.push_back(node->get_segment_id());
            segments.push_back(node->get_splitter());
            traverse(node->get_back());
        } else {
            traverse(node->get_back());
            segment_ids_to_render.push_back(node->get_segment_id());
            segments.push_back(node->get_splitter());
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