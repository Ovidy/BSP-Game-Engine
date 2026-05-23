#include <ecs/scene.h>

#include <raylib.h>

#include <bsp/camera.h>

Scene::Scene(
        const std::vector<bsp::Sector>& sectors, 
        const std::vector<bsp::Sprite>& sprites, 
        const std::unordered_map<glm::int32_t, std::string>& textures
    ) : sectors(sectors), sprites(sprites), textures(textures) {}

Scene::~Scene() {

}

const std::vector<bsp::Sector>& Scene::get_sectors() const { return sectors; }
const std::vector<bsp::Sprite>& Scene::get_sprites() const { return sprites; }
const std::unordered_map<glm::int32_t, std::string>& Scene::get_textures() const { return textures; }

entt::entity Scene::create_entity() {
    return registry.create();    
}

void Scene::destroy_entity(const entt::entity& entity) {
    registry.destroy(entity);
}

entt::registry& Scene::get_registry() {
    return registry;
}

void Scene::create_main_camera(const glm::vec3& start_pos, const float pitch, const float yaw, const float fov_y) {
    set_main_camera(create_camera_entity(start_pos, pitch, yaw, fov_y));
}

entt::entity Scene::create_camera_entity(const glm::vec3& start_pos, const float pitch, const float yaw, const float fov_y) {
    entt::entity camera_entity = create_entity();
    registry.emplace<bsp::Camera>(camera_entity, start_pos, pitch, yaw, fov_y);
    return camera_entity;
}

void Scene::set_main_camera(const entt::entity& main_camera_entity) {
    this->main_camera = main_camera_entity;
}

entt::entity Scene::get_main_camera_entity() const {
    return main_camera;
}
