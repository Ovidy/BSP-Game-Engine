#include <ecs/scene.h>
#include <ecs/entity.h>

#include <raylib.h>

#include <bsp/camera.h>

namespace engine
{
    Scene::Scene(
        const std::vector<Sector> &sectors,
        const std::vector<Sprite> &sprites,
        const std::unordered_map<glm::int32_t, std::string> &textures)  { 
        this->sectors  = sectors;
        this->sprites  = sprites;
        this->textures = textures; 
    }

    Scene::~Scene()
    {
    }

    const std::vector<Sector> &Scene::get_sectors() const { return sectors; }
    const std::vector<Sprite> &Scene::get_sprites() const { return sprites; }
    const std::unordered_map<glm::int32_t, std::string> &Scene::get_textures() const { return textures; }

    Entity Scene::create_entity()
    {
        return Entity(registry.create(), this);
    }

    void Scene::destroy_entity(const entt::entity &entity)
    {
        registry.destroy(entity);
    }

    Entity Scene::create_main_camera(const glm::vec3 &start_pos, const float pitch, const float yaw, const float fov_y)
    {
        Entity tmp = create_camera_entity(start_pos, pitch, yaw, fov_y);
        set_main_camera(tmp.id());
        return tmp;
    }

    Entity Scene::create_camera_entity(const glm::vec3 &start_pos, const float pitch, const float yaw, const float fov_y)
    {
        Entity camera_entity = create_entity();
        camera_entity.add_component<CameraComponent>(pitch, yaw, fov_y);
        return camera_entity;
    }

    void Scene::set_main_camera(const entt::entity &main_camera_entity)
    {
        this->main_camera = main_camera_entity;
    }

    entt::entity Scene::get_main_camera_entity() const
    {
        return main_camera;
    }
}
