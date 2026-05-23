#include <scene/scene.h>

#include <raylib.h>

Scene::Scene() {

}

Scene::~Scene() {

}

entt::entity Scene::create_entity() {
    return registry.create();    
}

void Scene::destroy_entity(const entt::entity& entity) {
    registry.destroy(entity);
}

void Scene::load_texture(const entt::entity& entity, const std::string& file_path) {
    registry.emplace_or_replace<Texture2D>(entity, LoadTexture(file_path.c_str()));
}

const Texture2D& Scene::get_texture(const entt::entity& entity) const {
    return registry.get<Texture2D>(entity);
}

void Scene::load_sprite(const entt::entity& entity, const bsp::Sprite& sprite) {
    registry.emplace_or_replace<bsp::Sprite>(entity, sprite);
}

const bsp::Sprite& Scene::get_sprite(const entt::entity& entity) const {
    return registry.get<bsp::Sprite>(entity);
}
