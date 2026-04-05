#pragma once

#include <glm/glm.hpp>

namespace bsp {
    class Node;
    class Segment;

    class TreeBuilder {
    public:
        TreeBuilder() = default;
        ~TreeBuilder() = default;

        void build(const std::vector<Segment>& segments);
        void build(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments);

        std::shared_ptr<Node> get_root() const;

    private:
        std::shared_ptr<Node> split_space(const std::vector<Segment>& segments);
        std::shared_ptr<Node> build_tree(const std::vector<Segment>& segments);

        std::shared_ptr<Node> root_node;
    };
}
