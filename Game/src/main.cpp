#include <ecs/scene.h>

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

    glm::float32_t delta_time = 0.0f;

	Scene scene;

	entt::entity main_camera = scene.create_camera_entity(glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f), 0.0f, 0.0f, 60.0f);
	scene.set_main_camera(main_camera);

	SearchAndSetResourceDir("Game/resources");
	
    scene.load_texture(1, "Wall1.png");
	scene.load_texture(2, "Monster1-north.png");
	scene.load_texture(3, "wabbit_alpha.png");
	
	scene.load_level(bsp::test_level_sectors, bsp::test_level_sprites);

	// game loop
	while (!WindowShouldClose())		// run the loop until the user presses ESCAPE or presses the Close button on the window
	{
		delta_time = GetFrameTime();
		scene.update(delta_time);
	}

	// destroy the window and cleanup the OpenGL context
	CloseWindow();
	return 0;
}
