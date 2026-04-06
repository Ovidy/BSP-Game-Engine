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

	bsp_handler.load_level(bsp::test_level_segments);
	render_handler.load_segments(bsp::test_level_segments, bsp_handler.get_segments());
	
	// Utility function from resource_dir.h to find the resources folder and set it as the current working directory so we can load from it
	SearchAndSetResourceDir("resources");

	// Load a texture from the resources directory
	//Texture wabbit = LoadTexture("wabbit_alpha.png");
	
	// game loop
	while (!WindowShouldClose())		// run the loop until the user presses ESCAPE or presses the Close button on the window
	{
		// Update:
		deltaTime = GetFrameTime();
		camera.pre_update(deltaTime);
		input_handler.update(camera, render_handler.get_map_renderer());
		camera.update(deltaTime);
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
