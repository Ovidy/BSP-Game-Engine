#pragma once

#include <render/map_renderer.h>
#include <render/view_renderer.h>
#include <render/texture_manager.h>

namespace render {
    class Handler {
    public:
        Handler();
        ~Handler();

        void render(const Camera3D& raylib_camera, const glm::vec2& camera_position, const std::vector<glm::int32_t>& current_segment_ids);

        void load_segments(const std::vector<bsp::Segment>& segments, const std::vector<bsp::Segment>& tree_segments, const std::vector<bsp::Sector>& level_sectors);

        void load_texture(glm::int32_t id, const std::string& file_path);

        void load_sprites(const std::vector<bsp::Sprite>& level_sprites);
        
        MapRenderer& get_map_renderer();
    private:
        void render_2d(const Camera3D& raylib_camera, const glm::vec2& camera_position, const std::vector<glm::int32_t>& current_segment_ids);
        void render_3d(const Camera3D& raylib_camera, const std::vector<glm::int32_t>& current_segment_ids);

        MapRenderer map_renderer;
        ViewRenderer view_renderer;
        TextureManager texture_manager;
        std::vector<bsp::Segment> segments;
        std::vector<bsp::Segment> tree_segments;
    };
}
