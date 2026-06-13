#include <ecs/scene.h>

#include <raylib.h>
#include <resource_dir.h>

#include <bsp/handler.h>
#include <render/renderer_3d.h>
#include <input/input_handler.h>

#include <ecs/scene.h>

#include <physics/components.h>
#include <bsp/components.h>

#include <test/level.h>

using namespace engine;

int main () {
	// Tell the window to use vsync and work on high DPI displays
	SetConfigFlags(FLAG_WINDOW_HIGHDPI);

	// Create the window and OpenGL context
	InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, "BSP Game Engine");

	// Set the target FPS to 60 so that our game loop runs at a consistent speed
	SetTargetFPS(60);

	DisableCursor();

    glm::float32_t delta_time = 0.0f;

	Scene scene(test_level_sectors, test_level_sprites, test_level_textures);
    BspManager bsp_manager;
    Renderer3D renderer;
    InputHandler input_handler;

	scene.create_main_camera(glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f), 0.0f, 0.0f, 60.0f);

	SearchAndSetResourceDir("Game/resources");

	for (const auto& [id, path] : scene.get_textures()) {
		renderer.load_texture(id, path);
	}

	for (const auto& sprite : scene.get_sprites()) {
		entt::entity sprite_entity = scene.create_entity();
		scene.get_registry().emplace<TransformComponent>(sprite_entity, sprite.position, glm::vec3(0.0f), glm::vec3(1.0f));
		scene.get_registry().emplace<SpriteComponent>(sprite_entity, sprite.texture_id, sprite.tint);
	}

	bsp_manager.load_level(scene.get_sectors());
	renderer.load_segments(bsp_manager.get_segments(), bsp_manager.get_segments(), scene.get_sectors(), WINDOW_RESOLUTION);
	
	// game loop
	while (!WindowShouldClose())		// run the loop until the user presses ESCAPE or presses the Close button on the window
	{
		delta_time = GetFrameTime();
		engine::Camera& camera = scene.get_registry().get<engine::Camera>(scene.get_main_camera_entity());

		input_handler.update(camera, renderer.get_map_renderer(), delta_time);
			
		// Ask the BSP tree what is nearby
		std::vector<Sector> nearby_sectors = bsp_manager.get_nearby_sectors(
			camera.get_pos_2d(), 
			camera.get_player_radius()
		);

		camera.update(delta_time, nearby_sectors);
		bsp_manager.update(camera.get_pos_2d());

		// Render:
		renderer.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_manager.get_segment_ids_to_render(), scene.get_registry());
	}

	// destroy the window and cleanup the OpenGL context
	CloseWindow();
	return 0;
}
