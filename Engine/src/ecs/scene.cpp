#include <ecs/scene.h>

#include <raylib.h>

Scene::Scene() {

}

Scene::~Scene() {

}

void Scene::update(const glm::float32_t& delta_time) {

}

entt::entity Scene::create_entity() {
    return registry.create();    
}

void Scene::destroy_entity(const entt::entity& entity) {
    registry.destroy(entity);
}

entt::registry& Scene::get_registry() {
    return registry;
}
