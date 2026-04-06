#include <render/map_renderer.h>

using namespace bsp;

namespace render {
    void MapRenderer::load_level_data(const std::vector<Segment>& input_segments, const std::vector<Segment>& input_tree_segments) {
        // Initialize min and max based on the level data
        min = glm::vec2(std::numeric_limits<float>::max());
        max = glm::vec2(std::numeric_limits<float>::lowest());

        for (const auto& segment : segments) {
            min = glm::min(min, segment.get_start());
            min = glm::min(min, segment.get_end());
            max = glm::max(max, segment.get_start());
            max = glm::max(max, segment.get_end());
        }

        segments = remap_segments(input_segments);
        tree_segments = remap_segments(input_tree_segments);
    }

    void MapRenderer::render(const std::vector<glm::int32_t>& segment_ids, const glm::vec2& camera_position) {
        if (is_enabled()) {
            draw_segments();
            draw_tree_segments(segment_ids, camera_position);
            draw_normals();
            draw_player(camera_position);
        }
    }

    void MapRenderer::enable_render() {
        enabled = true;
    }

    void MapRenderer::disable_render() {
        enabled = false;
    }

    bool MapRenderer::is_enabled() const {
        return enabled;
    }

    void MapRenderer::draw_player(const glm::vec2& camera_position) {
        std::cout << "Drawing player at camera position: (" << camera_position.x << ", " << camera_position.y << ")\n";
        glm::vec2 player_pos = remap_vec2(camera_position);
        DrawCircleV(Vector2({player_pos.x, player_pos.y}), 10, GREEN);
    }

    void MapRenderer::draw_segments() {
        for (const auto& segment : segments) {
            // Draw the line segment
            DrawLineV(Vector2({segment.get_start().x, segment.get_start().y}), Vector2({segment.get_end().x, segment.get_end().y}), DARKBROWN);
            
            // Draw circles at the start and end points of the segment
            DrawCircleV(Vector2({segment.get_start().x, segment.get_start().y}), 5, DARKGRAY);
            DrawCircleV(Vector2({segment.get_end().x, segment.get_end().y}), 5, DARKGRAY);
        }
    }

    void MapRenderer::draw_tree_segments(const std::vector<glm::int32_t>& segment_ids, const glm::vec2& camera_position) {
        glm::vec2 current_camera_pos = camera_position;

        // 1. Reset the animation if the camera moves to demonstrate the new calculation
        if (current_camera_pos != last_camera_pos) {
            current_draw_count = 0;
            animation_timer = 0.0f;
            last_camera_pos = current_camera_pos;
        }

        // 2. Accumulate delta time
        animation_timer += GetFrameTime(); // Raylib function for time between frames

        // 3. Advance the draw count if the delay has passed
        if (animation_timer >= render_delay) {
            animation_timer = 0.0f; // Reset timer
            if (current_draw_count < segment_ids.size()) {
                current_draw_count++; // Allow one more segment to be drawn
            }
        }

        // 4. Render only up to the current allowed count
        for (size_t i = 0; i < current_draw_count && i < segment_ids.size(); ++i) {
            glm::int32_t id = segment_ids[i];
            if (id >= 0 && id < tree_segments.size()) {
                const auto& segment = tree_segments[id];
                
                // Tip: Using DrawLineEx to make the active BSP lines a bit thicker (3.0f) 
                // so they stand out clearly against the underlying map segments
                DrawLineEx(
                    Vector2({segment.get_start().x, segment.get_start().y}), 
                    Vector2({segment.get_end().x, segment.get_end().y}), 
                    3.0f, RED
                );
            }
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

    std::vector<Segment> MapRenderer::remap_segments(const std::vector<Segment>& segments_) const {
        std::vector<Segment> remapped_segments;
        remapped_segments.reserve(segments_.size());
        
        if (segments_.empty()) {
            return remapped_segments;
        }

        for (const auto& segment : segments_) {
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
