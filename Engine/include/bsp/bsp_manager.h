#pragma once

#include <bsp/tree_builder.h>
#include <bsp/tree_traverser.h>
#include <bsp/data_types.h>
#include <raylib.h>

namespace engine
{
    class BspManager
    {
    public:
        BspManager();
        ~BspManager();

        void update(const glm::vec2 &camera_position);
        void load_level(const std::vector<Sector> &input_sectors);

        // Return actual Sector objects for the physics engine
        std::vector<Sector> get_nearby_sectors(const glm::vec2 &pos, const glm::float32_t &radius) const;

        const std::vector<glm::int32_t> &get_segment_ids_to_render() const;
        const std::vector<Segment> &get_segments() const;

    private:
        TreeBuilder tree_builder;
        TreeTraverser tree_traverser;

        // Fast lookup table for sectors
        std::unordered_map<glm::int32_t, Sector> sector_cache;
    };
}
