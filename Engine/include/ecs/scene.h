#pragma once

#include <entt/entt.hpp>

#include <bsp/data_types.h>

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
};
