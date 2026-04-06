#pragma once

#include <limits>
#include <raylib.h>
#include <bsp/level_data.h>
#include <bsp/tree_builder.h>
#include <bsp/tree_traverser.h>
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

        void render(const TreeTraverser& tree_traverser, const glm::vec2& camera_position);

        void load_level_data(const LevelData& level_data, const TreeBuilder& tree_builder);

        void enable_render();
        void disable_render();

        bool is_enabled() const;

    private:
        void draw_player(const glm::vec2& camera_position);
        void draw_segments();
        void draw_tree_segments(const TreeTraverser& tree_traverser, const glm::vec2& camera_position);
        void draw_normals();

        std::vector<Segment> get_normalized_segments() const;
        std::vector<Segment> remap_segments(const std::vector<Segment>& segments) const;
        glm::vec2 remap_vec2(const glm::vec2& vec) const;
        glm::int32_t remap_x(const glm::int32_t& x, const glm::int32_t& out_min=MAP_OFFSET, const glm::int32_t& out_max=MAP_WIDTH) const;
        glm::int32_t remap_y(const glm::int32_t& y, const glm::int32_t& out_min=MAP_OFFSET, const glm::int32_t& out_max=MAP_HEIGHT) const;

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
