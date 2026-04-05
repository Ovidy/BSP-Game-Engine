#pragma once

#include <glm/glm.hpp>

namespace bsp {
    class Node;
    class Segment;

    class TreeBuilder {
    public:
        TreeBuilder() = default;
        ~TreeBuilder() = default;

        std::shared_ptr<Node> build_tree(const std::vector<Segment>& segments);
    };
}
