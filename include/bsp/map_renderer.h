#pragma once

#include <limits>
#include <raylib.h>
#include <bsp/level_data.h>
#include <bsp/utils.h>

namespace bsp {
    class MapRenderer {
    public:
        MapRenderer() = default;
        MapRenderer(const MapRenderer&) = default;
        MapRenderer(MapRenderer&&) = default;
        MapRenderer& operator=(MapRenderer&&) = default;
        MapRenderer& operator=(const MapRenderer&) = default;
        ~MapRenderer() = default;

        void render();

        void load_level_data(const LevelData& level_data);

    private:
        void draw_segments();
        void draw_normals();

        std::vector<Segment> get_normalized_segments() const;
        std::vector<Segment> remap_segments(const std::vector<Segment>& segments) const;
        glm::vec2 remap_vec2(const glm::vec2& vec) const;
        glm::int32_t remap_x(const glm::int32_t& x, const glm::int32_t& out_min=MAP_OFFSET, const glm::int32_t& out_max=MAP_WIDTH) const;
        glm::int32_t remap_y(const glm::int32_t& y, const glm::int32_t& out_min=MAP_OFFSET, const glm::int32_t& out_max=MAP_HEIGHT) const;

        std::vector<Segment> segments;
        glm::vec2 min;
        glm::vec2 max;
    };
}
