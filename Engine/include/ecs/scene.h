#pragma once

#include <entt/entt.hpp>

#include <bsp/handler.h>
#include <render/renderer_3d.h>
#include <input/handler.h>

class Scene {
public:
    Scene();
    ~Scene();

    void update(const glm::float32_t& delta_time);

    entt::entity create_entity();
    void destroy_entity(const entt::entity& entity);

    entt::registry& get_registry();

    entt::entity create_camera_entity(const glm::vec3& start_pos, const float pitch, const float yaw, const float fov_y);
    void set_main_camera(const entt::entity& main_camera);

    void load_texture(glm::int32_t id, const std::string& file_path);
    void load_level(const std::vector<bsp::Sector>& input_sectors, const std::vector<bsp::Sprite>& input_sprites);

private:
    entt::registry registry;
    entt::entity main_camera;

    bsp::Handler bsp_handler;
    Renderer3D renderer;
    input::Handler input_handler;
};
