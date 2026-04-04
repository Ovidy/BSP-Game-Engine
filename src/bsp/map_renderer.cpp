#include <bsp/map_renderer.h>

namespace bsp {
    void MapRenderer::load_level_data(const LevelData& level_data) {
        // Initialize min and max based on the level data
        min = glm::vec2(std::numeric_limits<float>::max());
        max = glm::vec2(std::numeric_limits<float>::lowest());

        for (const auto& segment : level_data.segments) {
            min = glm::min(min, segment.start);
            min = glm::min(min, segment.end);
            max = glm::max(max, segment.start);
            max = glm::max(max, segment.end);
        }

        segments = remap_segments(level_data.segments);
    }

    void MapRenderer::render() {
        draw_segments();
    }

    void MapRenderer::draw_segments() {
        for (const auto& segment : segments) {
            // Draw the line segment
            DrawLineV(Vector2({segment.start.x, segment.start.y}), Vector2({segment.end.x, segment.end.y}), ORANGE);
            
            // Draw circles at the start and end points of the segment
            DrawCircleV(Vector2({segment.start.x, segment.start.y}), 5, RED);
            DrawCircleV(Vector2({segment.end.x, segment.end.y}), 5, RED);
        }
    }

    std::vector<Segment> MapRenderer::remap_segments(const std::vector<Segment>& segments) const {
        std::vector<Segment> remapped_segments;
        remapped_segments.reserve(segments.size());

        for (const auto& segment : segments) {
            remapped_segments.push_back({remap_vec2(segment.start), remap_vec2(segment.end)});
        }

        return remapped_segments;
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
