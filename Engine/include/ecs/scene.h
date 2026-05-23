#pragma once

#include <entt/entt.hpp>

#include <bsp/data_types.h>

class Scene {
public:
    // Constructors and destructors
    Scene();
    ~Scene();

    // Entity Management
    entt::entity create_entity();
    void destroy_entity(const entt::entity& entity);

    // Texture Management
    void load_texture(const entt::entity& entity, const std::string& file_path);
    const Texture2D& get_texture(const entt::entity& entity) const;

    // Sprite Management
    void load_sprite(const entt::entity& entity, const bsp::Sprite& sprite);
    const bsp::Sprite& get_sprite(const entt::entity& entity) const;

private:
    entt::registry registry;
};
