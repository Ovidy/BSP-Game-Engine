#include <ecs/scene.h>

#include <raylib.h>

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
