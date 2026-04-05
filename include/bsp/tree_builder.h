#pragma once

#include <glm/glm.hpp>
#include <bsp/data_types.h>
#include <memory>

namespace bsp {
    class TreeBuilder {
    public:
        TreeBuilder();
        ~TreeBuilder() = default;

        void build(const std::vector<Segment>& segments);
        void build(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments);

        std::shared_ptr<Node> get_root() const;

    private:
        std::pair<std::shared_ptr<Node>, std::shared_ptr<Node>> split_space(std::shared_ptr<Node> node, const std::vector<Segment>& segments);
        void build_tree(std::shared_ptr<Node> node, const std::vector<Segment>& segments);

        std::shared_ptr<Node> root_node;
    };
}
