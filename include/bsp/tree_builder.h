#pragma once

#include <memory>
#include <glm/glm.hpp>

#include <bsp/utils.h>
#include <bsp/data_types.h>

namespace bsp {
    class TreeBuilder {
    public:
        TreeBuilder();
        ~TreeBuilder() = default;

        void load_segments(const std::vector<Segment>& segments);
        void load_segments(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments);

        std::shared_ptr<Node> get_root() const;
        const std::vector<Segment>& get_segments() const;

    private:
        void add_segment_to_node(std::shared_ptr<Node> node, const Segment& segment);
        std::pair<std::vector<Segment>, std::vector<Segment>> split_space(std::shared_ptr<Node> node, const std::vector<Segment>& segments);
        void build_tree(std::shared_ptr<Node> node, const std::vector<Segment>& segments);
        void print_number_of_segments() const;

        std::shared_ptr<Node> root_node;
        std::vector<Segment> segments;
        glm::int32_t segment_id;
        glm::int32_t num_front_segments;
        glm::int32_t num_back_segments;
        glm::int32_t num_split_segments;
    };
}
