#pragma once

#include <limits>
#include <raylib.h>
#include <bsp/level_data.h>
#include <bsp/tree_builder.h>
#include <bsp/tree_traverser.h>
#include <bsp/utils.h>


namespace engine {
    class MapRenderer {
    public:
    MapRenderer() = default;
    MapRenderer(const MapRenderer&) = default;
    MapRenderer(MapRenderer&&) = default;
    MapRenderer& operator=(MapRenderer&&) = default;
    MapRenderer& operator=(const MapRenderer&) = default;
    ~MapRenderer() = default;

    void render(const std::vector<glm::int32_t>& segment_ids, const glm::vec2& camera_position, const glm::vec2& camera_forward);

    void load_level_data(const std::vector<Segment>& segments,  const std::vector<Segment>& tree_segments, const glm::vec2& window_size);

    void enable_render();
    void disable_render();

    bool is_enabled() const;
    void toggle();

    private:
    void draw_player(const glm::vec2& camera_position, const glm::vec2& camera_forward);
    void draw_segments();
    void draw_tree_segments(const std::vector<glm::int32_t>& segment_ids, const glm::vec2& camera_position);
    void draw_normals();

    std::vector<Segment> get_normalized_segments() const;
    std::vector<Segment> remap_segments(const std::vector<Segment>& segments) const;
    glm::vec2 remap_vec2(const glm::vec2& vec) const;
    glm::float32_t remap_x(const glm::float32_t& x, const glm::float32_t& out_min=MAP_OFFSET, const glm::float32_t& out_max=MAP_WIDTH) const;
    glm::float32_t remap_y(const glm::float32_t& y, const glm::float32_t& out_min=MAP_OFFSET, const glm::float32_t& out_max=MAP_HEIGHT) const;

    std::vector<Segment> segments;
    std::vector<Segment> tree_segments;
    glm::vec2 min;
    glm::vec2 max;
    float animation_timer = 0.0f;
    size_t current_draw_count = 0;
    float render_delay = 0.1f; // Seconds to wait between drawing each segment
    glm::vec2 last_camera_pos = glm::vec2(-999.0f, -999.0f); // Used to detect movement
    bool enabled = false;
    };
}
