/*
Raylib example file.
This is an example main file for a simple raylib project.
Use this as a starting point or replace it with your code.

by Jeffery Myers is marked with CC0 1.0. To view a copy of this license, visit https://creativecommons.org/publicdomain/zero/1.0/

*/

#include <iostream>

#include <bsp/handler.h>
#include <render/handler.h>
#include <input/handler.h>
#include <test/level.h>

#include "raylib.h"

#include "resource_dir.h"	// utility header for SearchAndSetResourceDir

using namespace bsp;

void prevent_dt_clamp(glm::float32_t& deltaTime);

int main ()
{
	// Tell the window to use vsync and work on high DPI displays
	SetConfigFlags(/*FLAG_VSYNC_HINT | */FLAG_WINDOW_HIGHDPI);

	// Create the window and OpenGL context
	InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, "BSP Game Engine");

	// Set the target FPS to 60 so that our game loop runs at a consistent speed
	SetTargetFPS(60);

	DisableCursor();

	glm::float32_t deltaTime = 0.0f;

	// create our renderer and load the test level segments into it
	bsp::Camera camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f);
	bsp::Handler bsp_handler;
	render::Handler render_handler;
	input::Handler input_handler;

	/*
	ID 0 = Grass/Ground (Used for the Courtyard and Arena floors)
	ID 1 = Brick/Wall (Used for the main perimeter walls and the House)
	ID 2 = Sky (Used for the massive ceilings)
	ID 3 = Wood (Used for the Hallway, the Raised Platform, and the House interior)
	ID 4 = Stone/Metal (Used for the Pyramid, the Deep Pit, and the ramps)
	*/

	// Utility function from resource_dir.h to find the resources folder and set it as the current working directory so we can load from it
	SearchAndSetResourceDir("resources");
	render_handler.load_texture(1, "Wall1.png");
	render_handler.load_texture(5, "Monster1-north.png");
	render_handler.load_texture(6, "wabbit_alpha.png");

	bsp_handler.load_level(bsp::test_level_sectors);
	render_handler.load_segments(bsp_handler.get_segments(), bsp_handler.get_segments(), bsp::test_level_sectors, WINDOW_RESOLUTION);
	render_handler.load_sprites(bsp::test_level_sprites);
	
	// game loop
	while (!WindowShouldClose())		// run the loop until the user presses ESCAPE or presses the Close button on the window
	{
		// Update:
		deltaTime = GetFrameTime();
		prevent_dt_clamp(deltaTime);
		camera.pre_update(deltaTime);
		input_handler.update(camera, render_handler.get_map_renderer());
		
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

	// cleanup
	// unload our texture so it can be cleaned up
	//UnloadTexture(wabbit);

	// destroy the window and cleanup the OpenGL context
	CloseWindow();
	return 0;
}

void prevent_dt_clamp(glm::float32_t& deltaTime) {
	if (deltaTime > 0.05f) {
		deltaTime = 0.0166f; 
	}
}
