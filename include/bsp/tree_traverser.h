#pragma once

#include <bsp/utils.h>
#include <bsp/data_types.h>

namespace bsp {
    class TreeTraverser {
    public:
        TreeTraverser();
        ~TreeTraverser() = default;

        void set_root(const std::shared_ptr<Node>& root);

        void traverse(const std::shared_ptr<Node>& node, const glm::vec2& camera_position);

        void update(const glm::vec2& camera_position);

        const std::vector<glm::int32_t>& get_segment_ids_to_render() const;

    private:
        std::shared_ptr<Node> root_node;
        std::vector<Segment> segments;
        std::vector<glm::int32_t> segment_ids_to_render;
    };
}
