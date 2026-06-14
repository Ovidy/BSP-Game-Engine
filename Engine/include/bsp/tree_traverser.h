#pragma once

#include <bsp/utils.h>
#include <bsp/data_types.h>
#include <unordered_set>

namespace engine
{
    class TreeTraverser
    {
    public:
        TreeTraverser();
        ~TreeTraverser() = default;

        void set_root(const std::shared_ptr<Node> &root);

        void traverse(const std::shared_ptr<Node> &node, const glm::vec2 &camera_position);

        // Get the IDs of sectors the player's radius is overlapping
        void get_collision_candidates(
            const std::shared_ptr<Node> &node,
            const glm::vec2 &pos,
            const glm::float32_t &radius,
            std::unordered_set<glm::int32_t> &out_sector_ids) const;

        void update(const glm::vec2 &camera_position);

        const std::vector<glm::int32_t> &get_segment_ids_to_render() const;

    private:
        std::shared_ptr<Node> root_node;
        std::vector<Segment> segments;
        std::vector<glm::int32_t> segment_ids_to_render;
    };
}
