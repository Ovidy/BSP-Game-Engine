#include <bsp/map_renderer.h>
#include <limits>

namespace bsp {
    MapRenderer::MapRenderer(LevelData& level_data) : level_data(level_data) {
        // Initialize min and max based on the level data
        min = glm::vec2(std::numeric_limits<float>::max());
        max = glm::vec2(std::numeric_limits<float>::lowest());

        for (const auto& segment : level_data.segments) {
            min = glm::min(min, segment.start);
            min = glm::min(min, segment.end);
            max = glm::max(max, segment.start);
            max = glm::max(max, segment.end);
        }
    }

    void MapRenderer::render() {
    }

    std::vector<glm::vec2> MapRenderer::remap_vectors(const std::vector<glm::vec2>& vectors) const {
        std::vector<glm::vec2> remapped;
        remapped.reserve(vectors.size());
        for (const auto& vec : vectors) {
            remapped.push_back(remap_vec2(vec));
        }
        return remapped;
    }

    glm::vec2 MapRenderer::remap_vec2(const glm::vec2& vec) const {
        return glm::vec2(remap_x(static_cast<glm::int32_t>(vec.x)), remap_y(static_cast<glm::int32_t>(vec.y)));
    }

    glm::int32_t MapRenderer::remap_x(const glm::int32_t& x, const glm::int32_t& out_min, const glm::int32_t& out_max) const {
        return static_cast<glm::int32_t>((x - min.x) / (max.x - min.x) * (out_max - out_min) + out_min);
    }

    glm::int32_t MapRenderer::remap_y(const glm::int32_t& y, const glm::int32_t& out_min, const glm::int32_t& out_max) const {
        return static_cast<glm::int32_t>((y - min.y) / (max.y - min.y) * (out_max - out_min) + out_min);
    }
}
