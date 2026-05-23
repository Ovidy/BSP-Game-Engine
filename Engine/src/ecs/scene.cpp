#include <ecs/scene.h>

#include <raylib.h>
#include <resource_dir.h>

#include <bsp/camera.h>

#include <test/level.h>

Scene::Scene() {
    player_entity = create_entity();
    registry.emplace<bsp::Camera>(player_entity, glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f), 0.0f, 0.0f, 60.0f);

    SearchAndSetResourceDir("Game/resources");
	
    renderer.load_texture(1, "Wall1.png");
	renderer.load_texture(2, "Monster1-north.png");
	renderer.load_texture(3, "wabbit_alpha.png");

	bsp_handler.load_level(bsp::test_level_sectors);
	renderer.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);
	renderer.load_sprites(bsp::test_level_sprites);
}

Scene::~Scene() {

}

void Scene::update(const glm::float32_t& delta_time) {
    bsp::Camera& camera = registry.get<bsp::Camera>(player_entity);

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
