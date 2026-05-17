#pragma once

#include <entt/entt.hpp>

class Scene {
public:
    // Constructors and destructors
    Scene();
    ~Scene();

    // Entity Management
    entt::entity create_entity();
    void destroy_entity(const entt::entity& entity);

    // Texture Management
    

private:
    entt::registry registry;
};
