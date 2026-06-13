#include <ecs/scene.h>

#include <raylib.h>
#include <resource_dir.h>

#include <bsp/bsp_manager.h>
#include <render/renderer_3d.h>
#include <input/input_handler.h>

#include <ecs/scene.h>

#include <physics/components.h>
#include <bsp/components.h>
#include <bsp/systems.h>

#include <test/level.h>

using namespace engine;

int main()
{
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

    // Create the camera entity
    scene.create_main_camera(glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f), 0.0f, 0.0f, 60.0f);
    entt::entity player = scene.get_main_camera_entity();

    // Attach the physical body to the player
    auto& reg = scene.get_registry();
    
    // Give it a Transform (starting at the camera's initial position)
    reg.emplace<engine::TransformComponent>(player, glm::vec3(6.0f, CAM_HEIGHT + 2, 5.0f));
    
    // Give it Velocity
    reg.emplace<engine::VelocityComponent>(player);
    
    // Give it the Character Controller settings
    auto& controller = reg.emplace<engine::CharacterControllerComponent>(player);
    controller.radius = 0.5f;
    controller.height = CAM_HEIGHT;
    controller.speed = 5.0f;

    SearchAndSetResourceDir("Game/resources");

    for (const auto &[id, path] : scene.get_textures())
    {
        renderer.load_texture(id, path);
    }

    for (const auto &sprite : scene.get_sprites())
    {
        entt::entity sprite_entity = scene.create_entity();
        scene.get_registry().emplace<TransformComponent>(sprite_entity, sprite.position, glm::vec3(0.0f), glm::vec3(1.0f));
        scene.get_registry().emplace<SpriteComponent>(sprite_entity, sprite.texture_id, sprite.tint);
    }

    bsp_manager.load_level(scene.get_sectors());
    renderer.load_segments(bsp_manager.get_segments(), bsp_manager.get_segments(), scene.get_sectors(), WINDOW_RESOLUTION);

    // game loop
    while (!WindowShouldClose())
    {
        delta_time = GetFrameTime();
        entt::entity player = scene.get_main_camera_entity();
        auto& reg = scene.get_registry();

        // ==========================================
        // 1. INPUT SYSTEM
        // ==========================================
        input_handler.update(reg, player, delta_time);

        // Map Toggle logic! 
        // We use IsKeyPressed so it only fires once per tap, not every frame it is held down.
        if (IsKeyPressed(KEY_M)) {
            // Adjust the function name "toggle()" to match whatever you named it in MapRenderer
            renderer.get_map_renderer().toggle(); 
        }

        // ==========================================
        // 2. PHYSICS SYSTEM
        // ==========================================
        engine::Camera& camera = reg.get<engine::Camera>(player);
        
        // Ask the BSP tree what is nearby for collision
        std::vector<engine::Sector> nearby_sectors = bsp_manager.get_nearby_sectors(
            glm::vec2(camera.get_position().x, camera.get_position().z), 
            reg.get<engine::CharacterControllerComponent>(player).radius
        );

        // Run the ECS Physics!
        character_controller_update(reg, delta_time, nearby_sectors);

        // ==========================================
        // 3. CAMERA SYNC
        // ==========================================
        // The physics system moved the Transform. Now we must snap the visual Camera to match the new physical position.
        auto& transform = reg.get<engine::TransformComponent>(player);
        camera.get_position() = transform.position;
        
        // Refresh raylib's internal camera matrices
        camera.refresh_raylib(); 
        
        bsp_manager.update(camera.get_pos_2d());

        // ==========================================
        // 4. RENDER SYSTEM
        // ==========================================
        renderer.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_manager.get_segment_ids_to_render(), reg);
    }

    // destroy the window and cleanup the OpenGL context
    CloseWindow();
    return 0;
}
