#include <ecs/scene.h>

#include <raylib.h>
#include <resource_dir.h>

#include <bsp/handler.h>
#include <render/renderer_3d.h>
#include <input/handler.h>

#include <test/level.h>

int main () {
	// Tell the window to use vsync and work on high DPI displays
	SetConfigFlags(FLAG_WINDOW_HIGHDPI);

	// Create the window and OpenGL context
	InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, "BSP Game Engine");

	// Set the target FPS to 60 so that our game loop runs at a consistent speed
	SetTargetFPS(60);

	DisableCursor();

    glm::float32_t delta_time = 0.0f;

	Scene scene(bsp::test_level_sectors, bsp::test_level_sprites, bsp::test_level_textures);

	bsp::Handler bsp_handler;
    Renderer3D renderer;
    input::Handler input_handler;

	scene.create_main_camera(glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f), 0.0f, 0.0f, 60.0f);

	SearchAndSetResourceDir("Game/resources");

	for (const auto& [id, path] : scene.get_textures()) {
		renderer.load_texture(id, path);
	}

	bsp_handler.load_level(scene.get_sectors());
	renderer.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), scene.get_sectors(), WINDOW_RESOLUTION);
	renderer.load_sprites(scene.get_sprites());

	// game loop
	while (!WindowShouldClose())		// run the loop until the user presses ESCAPE or presses the Close button on the window
	{
		delta_time = GetFrameTime();
		bsp::Camera& camera = scene.get_main_camera();

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

	// destroy the window and cleanup the OpenGL context
	CloseWindow();
	return 0;
}
