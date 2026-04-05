#include <bsp/tree_builder.h>

namespace bsp {
    void TreeBuilder::build(const std::vector<Segment>& segments) {
        root_node = build_tree(segments);
    }

    void TreeBuilder::build(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments) {
        std::vector<Segment> segment_objects;
        segment_objects.reserve(segments.size());

        for (const auto& pair : segments) {
            segment_objects.emplace_back(pair.first, pair.second);
        }

        root_node = build_tree(segment_objects);
    }

    std::shared_ptr<Node> TreeBuilder::get_root() const {
        return root_node;
    }

    std::shared_ptr<Node> TreeBuilder::split_space(const std::vector<Segment>& segments) {
        // This function should implement the logic to split the space based on the segments
        // For simplicity, we will just create a node with the first segment as the partition
        if (segments.empty()) {
            return nullptr;
        }

        auto node = std::make_shared<Node>();
        node->partition = segments[0];

        // In a complete implementation, you would recursively split the remaining segments
        // into front and back lists and call split_space on them

        return node;
    }

    std::shared_ptr<Node> TreeBuilder::build_tree(const std::vector<Segment>& segments) {
        if (segments.empty()) {
            return nullptr;
        }

        // Split the space using the first segment as the partition
        auto node = split_space(segments);

        // In a complete implementation, you would recursively build the front and back subtrees
        // using the remaining segments

        return node;
    }
}