#pragma once

#include <render/map_renderer.h>
#include <render/view_renderer.h>
#include <render/texture_manager.h>

#include <entt/entt.hpp>

namespace engine
{
    class Renderer3D
    {
    public:
        Renderer3D();
        ~Renderer3D();

        void render(const Camera3D &raylib_camera, const glm::vec2 &camera_position, const std::vector<glm::int32_t> &current_segment_ids, entt::registry &registry);

        void load_segments(const std::vector<Segment> &segments, const std::vector<Segment> &tree_segments, const std::vector<Sector> &level_sectors, const glm::vec2 &window_size);

        void load_texture(glm::int32_t id, const std::string &file_path);

        MapRenderer &get_map_renderer();

    private:
        void render_2d(const Camera3D &raylib_camera, const glm::vec2 &camera_position, const std::vector<glm::int32_t> &current_segment_ids);
        void render_3d(const Camera3D &raylib_camera, const std::vector<glm::int32_t> &current_segment_ids, entt::registry &registry);

        void draw_controls_overlay();

        MapRenderer map_renderer;
        ViewRenderer view_renderer;
        TextureManager texture_manager;
        std::vector<Segment> segments;
        std::vector<Segment> tree_segments;
    };
}
