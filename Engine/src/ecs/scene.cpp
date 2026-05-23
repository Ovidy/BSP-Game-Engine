#include <ecs/scene.h>

#include <raylib.h>

#include <bsp/camera.h>

#include <test/level.h>

Scene::Scene() {

}

Scene::~Scene() {

}

void Scene::update(const glm::float32_t& delta_time) {
    bsp::Camera& camera = registry.get<bsp::Camera>(main_camera);

    input_handler.update(camera, renderer.get_map_renderer(), delta_time);
		
    // Ask the BSP tree what is nearby
    std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(
        camera.get_pos_2d(), 
        camera.get_player_radius()
    );

    camera.update(delta_time, nearby_sectors);
    bsp_handler.update(camera.get_pos_2d());

    // Render:
    renderer.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());
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

entt::entity Scene::create_camera_entity(const glm::vec3& start_pos, const float pitch, const float yaw, const float fov_y) {
    entt::entity camera_entity = create_entity();
    registry.emplace<bsp::Camera>(camera_entity, start_pos, pitch, yaw, fov_y);
    return camera_entity;
}

void Scene::set_main_camera(const entt::entity& main_camera) {
    this->main_camera = main_camera;
}

void Scene::load_texture(glm::int32_t id, const std::string& file_path) {
    renderer.load_texture(id, file_path);
}

void Scene::load_level(const std::vector<bsp::Sector>& input_sectors, const std::vector<bsp::Sprite>& input_sprites) {
    bsp_handler.load_level(input_sectors);
	renderer.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);
	renderer.load_sprites(input_sprites);
}
