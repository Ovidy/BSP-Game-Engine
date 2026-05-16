#include <bsp/handler.h>
#include <bsp/camera.h>
#include <render/handler.h>
#include <input/handler.h>
#include <test/level.h>

#include <raylib.h>
#include <resource_dir.h>

int main () {
	// Tell the window to use vsync and work on high DPI displays
	SetConfigFlags(FLAG_WINDOW_HIGHDPI);

	// Create the window and OpenGL context
	InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, "BSP Game Engine");

	// Set the target FPS to 60 so that our game loop runs at a consistent speed
	SetTargetFPS(60);

	DisableCursor();

    glm::float32_t deltaTime = 0.0f;

    // create our renderer and load the test level segments into it
    bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f), 0.0f, 0.0f, 60.0f);
    bsp::Handler bsp_handler;
    render::Handler render_handler;
    input::Handler input_handler;

	// Utility function from resource_dir.h to find the resources folder and set it as the current working directory so we can load from it
	SearchAndSetResourceDir("Game/resources");
	render_handler.load_texture(1, "Wall1.png");
	render_handler.load_texture(2, "Monster1-north.png");
	render_handler.load_texture(3, "wabbit_alpha.png");

	bsp_handler.load_level(bsp::test_level_sectors);
	render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);
	render_handler.load_sprites(bsp::test_level_sprites);
	
	// game loop
	while (!WindowShouldClose())		// run the loop until the user presses ESCAPE or presses the Close button on the window
	{
		// Update:
		deltaTime = GetFrameTime();
		input_handler.update(camera, render_handler.get_map_renderer(), deltaTime);
		
		// Ask the BSP tree what is nearby
    	std::vector<bsp::Sector> nearby_sectors = bsp_handler.get_nearby_sectors(
			camera.get_pos_2d(), 
			camera.get_player_radius()
		);

		camera.update(deltaTime, nearby_sectors);
		bsp_handler.update(camera.get_pos_2d());

		// Render:
		render_handler.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_handler.get_segment_ids_to_render());
	}

	// destroy the window and cleanup the OpenGL context
	CloseWindow();
	return 0;
}
