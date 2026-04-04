#pragma once

#include <level_data.h>
#include <utils.h>

namespace bsp {
    class MapRenderer {
    public:
        MapRenderer(LevelData& level_data);
        MapRenderer(const MapRenderer&) = default;
        MapRenderer(MapRenderer&&) = default;
        MapRenderer& operator=(MapRenderer&&) = default;
        MapRenderer& operator=(const MapRenderer&) = default;
        ~MapRenderer() = default;

        void render();

        std::vector<glm::vec2> remap_vectors(const std::vector<glm::vec2>& vectors) const;

        glm::vec2 remap_vec2(const glm::vec2& vec) const;

    private:
        glm::int32_t remap_x(const glm::int32_t& x, const glm::int32_t& out_min=MAP_OFFSET, const glm::int32_t& out_max=MAP_WIDTH) const;
        glm::int32_t remap_y(const glm::int32_t& y, const glm::int32_t& out_min=MAP_OFFSET, const glm::int32_t& out_max=MAP_HEIGHT) const;

        LevelData& level_data;
        glm::vec2 min;
        glm::vec2 max;
    };
}