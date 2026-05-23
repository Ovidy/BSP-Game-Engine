#pragma once

#include <entt/entt.hpp>

#include <bsp/handler.h>
#include <render/handler.h>
#include <input/handler.h>

class Scene {
public:
    Scene();
    ~Scene();

    void update(const glm::float32_t& delta_time);

    entt::entity create_entity();
    void destroy_entity(const entt::entity& entity);

    entt::registry& get_registry();

private:
    entt::registry registry;
    entt::entity player_entity;

    bsp::Handler bsp_handler;
    render::Handler render_handler;
    input::Handler input_handler;
};
