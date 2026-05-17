#include <scene/scene.h>

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