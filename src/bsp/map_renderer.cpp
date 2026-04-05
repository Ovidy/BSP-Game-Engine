#include <bsp/map_renderer.h>

namespace bsp {
    void MapRenderer::load_level_data(const LevelData& level_data) {
        // Initialize min and max based on the level data
        min = glm::vec2(std::numeric_limits<float>::max());
        max = glm::vec2(std::numeric_limits<float>::lowest());

        for (const auto& segment : level_data.segments) {
            min = glm::min(min, segment.get_start());
            min = glm::min(min, segment.get_end());
            max = glm::max(max, segment.get_start());
            max = glm::max(max, segment.get_end());
        }

        segments = remap_segments(level_data.segments);
    }

    void MapRenderer::render() {
        draw_segments();
        draw_normals();
    }

    void MapRenderer::draw_segments() {
        for (const auto& segment : segments) {
            // Draw the line segment
            DrawLineV(Vector2({segment.get_start().x, segment.get_start().y}), Vector2({segment.get_end().x, segment.get_end().y}), ORANGE);
            
            // Draw circles at the start and end points of the segment
            DrawCircleV(Vector2({segment.get_start().x, segment.get_start().y}), 5, RED);
            DrawCircleV(Vector2({segment.get_end().x, segment.get_end().y}), 5, RED);
        }
    }

    void MapRenderer::draw_normals() {
        std::vector<Segment> normalized_segments = get_normalized_segments();

        for (const auto& segment : normalized_segments) {
            // Draw the normal vector as a line segment
            DrawLineV(Vector2({segment.get_start().x, segment.get_start().y}), Vector2({segment.get_end().x, segment.get_end().y}), BLUE);
            
            // Draw an arrowhead at the end of the normal vector
            glm::vec2 direction = segment.get_end() - segment.get_start();
            glm::vec2 perpendicular = glm::normalize(glm::vec2(-direction.y, direction.x)) * 10.0f; // Scale for arrowhead size
            DrawLineV(Vector2({segment.get_end().x, segment.get_end().y}), Vector2({segment.get_end().x + perpendicular.x, segment.get_end().y + perpendicular.y}), BLUE);
            DrawLineV(Vector2({segment.get_end().x, segment.get_end().y}), Vector2({segment.get_end().x - perpendicular.x, segment.get_end().y - perpendicular.y}), BLUE);
        }
    }

    std::vector<Segment> MapRenderer::get_normalized_segments() const {
        std::vector<Segment> normalized_segments;
        normalized_segments.reserve(segments.size());

        // Calculate the normal vector for each segment and 
        // create a new segment representing the normal at the middle of the original segment
        for (const auto& segment : segments) {
            glm::vec2 direction = segment.get_end() - segment.get_start();
            glm::vec2 normal = glm::normalize(glm::vec2(-direction.y, direction.x)) * 20.0f; // Scale for normal length
            glm::vec2 midpoint = (segment.get_start() + segment.get_end()) * 0.5f;
            normalized_segments.push_back({midpoint, midpoint + normal});
        }

        return normalized_segments;
    }

    std::vector<Segment> MapRenderer::remap_segments(const std::vector<Segment>& segments) const {
        std::vector<Segment> remapped_segments;
        remapped_segments.reserve(segments.size());

        for (const auto& segment : segments) {
            remapped_segments.push_back({remap_vec2(segment.get_start()), remap_vec2(segment.get_end())});
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
