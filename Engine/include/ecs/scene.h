#pragma once

#include <entt/entt.hpp>
#include <bsp/data_types.h>
#include <bsp/camera.h>

namespace engine
{
    class Entity;


    // TODO: Use UUIDs instead of entt::entities because they change upon reruns
    class Scene
    {
    public:
        Scene(
            const std::vector<Sector> &sectors,
            const std::vector<Sprite> &sprites,
            const std::unordered_map<glm::int32_t, std::string> &textures);

        Scene(const Scene &scene) = delete;
        Scene &operator=(const Scene &) = delete;

        Scene(Scene &&scene) = default;
        Scene &operator=(Scene &&) = default;

        ~Scene();

        const std::vector<Sector> &get_sectors() const;
        const std::vector<Sprite> &get_sprites() const;
        const std::unordered_map<glm::int32_t, std::string> &get_textures() const;

        Entity create_entity();
        void destroy_entity(const entt::entity &entity);

        entt::registry &get_registry();

        Entity create_main_camera(const glm::vec3 &start_pos, const float pitch, const float yaw, const float fov_y);
        Entity create_camera_entity(const glm::vec3 &start_pos, const float pitch, const float yaw, const float fov_y);
        void set_main_camera(const entt::entity &main_camera);
        entt::entity get_main_camera_entity() const;

    private:
        entt::registry registry;

        std::vector<Sector> sectors;
        std::vector<Sprite> sprites;
        std::unordered_map<glm::int32_t, std::string> textures;

        entt::entity main_camera;
    };
}
