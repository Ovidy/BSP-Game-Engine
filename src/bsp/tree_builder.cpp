#include <bsp/tree_builder.h>

namespace bsp {
    TreeBuilder::TreeBuilder() : root_node(std::make_shared<Node>()) {}

    void TreeBuilder::build(const std::vector<Segment>& segments) {
        build_tree(root_node, segments);
    }

    void TreeBuilder::build(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments) {
        std::vector<Segment> segment_objects;
        segment_objects.reserve(segments.size());

        for (const auto& pair : segments) {
            segment_objects.emplace_back(pair.first, pair.second);
        }

        build_tree(root_node, segment_objects);
    }

    std::shared_ptr<Node> TreeBuilder::get_root() const {
        return root_node;
    }

    std::pair<std::shared_ptr<Node>, std::shared_ptr<Node>> TreeBuilder::split_space(std::shared_ptr<Node> node, const std::vector<Segment>& segments) {
        const Segment& splitter = segments[0]; // For simplicity, we use the first segment as the partitioning plane

        node->set_splitter(splitter);
    }

    void TreeBuilder::build_tree(std::shared_ptr<Node> node, const std::vector<Segment>& segments) {
        if (segments.empty()) {
            return; // Base case: no segments to partition
        }

        auto partition_segments = split_space(node, segments);

        if (partition_segments.first) {
            build_tree(partition_segments.first, segments); // Recursively build the front node
        }

        if (partition_segments.second) {
            build_tree(partition_segments.second, segments); // Recursively build the back node
        }
    }
}