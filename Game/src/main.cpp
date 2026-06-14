#include <ecs/entity.h>

#include <raylib.h>
#include <resource_dir.h>

#include <bsp/bsp_manager.h>
#include <render/renderer_3d.h>
#include <input/input_handler.h>

#include <physics/components.h>
#include <physics/systems.h>
#include <bsp/components.h>

#include <test/level.h>

using namespace engine;

int main()
{
    // Window and context initialization
    SetConfigFlags(FLAG_WINDOW_HIGHDPI);
    InitWindow(WINDOW_RESOLUTION.x, WINDOW_RESOLUTION.y, "BSP Game Engine");
    SetTargetFPS(60);
    DisableCursor();

    glm::float32_t delta_time = 0.0f;

    // Core systems initialization
    Scene scene(test_level_sectors, test_level_sprites, test_level_textures);
    BspManager bsp_manager;
    Renderer3D renderer;
    InputHandler input_handler;

    // Setup player entity and camera
    Entity player = scene.create_main_camera(glm::vec3(6.0f, CAM_HEIGHT + 2.0f, 5.0f), 0.0f, 0.0f, 60.0f);

    // Setup player physics components
    player.add_component<TransformComponent>( glm::vec3(6.0f, CAM_HEIGHT + 2.0f, 5.0f));
    player.add_component<VelocityComponent >();

    auto &controller = player.add_component<CharacterControllerComponent>();
        controller.radius = 0.5f;
        controller.height = CAM_HEIGHT;
        controller.speed = 5.0f;
        controller.sensitivity = 9.0f;

    // Resource loading
    SearchAndSetResourceDir("Game/resources");

    for (const auto &[id, path] : scene.get_textures())
    {
        renderer.load_texture(id, path);
    }

    // Spawn level sprites
    for (const auto &sprite : scene.get_sprites())
    {
        Entity sprite_entity = scene.create_entity();
        sprite_entity.add_component<TransformComponent>(sprite.position, glm::vec3(0.0f), glm::vec3(1.0f));
        sprite_entity.add_component<SpriteComponent>(sprite.texture_id, sprite.tint);
    }

    // Initialize BSP level data
    bsp_manager.load_level(scene.get_sectors());
    renderer.load_segments(bsp_manager.get_segments(), bsp_manager.get_segments(), scene.get_sectors(), WINDOW_RESOLUTION);

    // Main game loop
    while (!WindowShouldClose())
    {
        delta_time = GetFrameTime();
        // --- 1. Input ---
        input_handler.update(player, delta_time);

        if (IsKeyPressed(KEY_M))
        {
            renderer.get_map_renderer().toggle();
        }

        // --- 2. Physics ---
        engine::CameraComponent &camera = player.get_component<CameraComponent>();
        auto &transform = player.get_component<TransformComponent>();

        std::vector<engine::Sector> nearby_sectors = bsp_manager.get_nearby_sectors(
            glm::vec2(transform.position.x, transform.position.z),
            player.get_component<CharacterControllerComponent>().radius);

        character_controller_update(&scene, delta_time, nearby_sectors);

        // --- 3. Camera Sync ---
        camera.refresh_raylib(transform.position);

        bsp_manager.update(transform.get_bsp_position());

        // --- 4. Render ---
        renderer.render(camera.get_raylib_camera(), transform.get_bsp_position(), bsp_manager.get_segment_ids_to_render(), &scene);
    }

    CloseWindow();
    return 0;
}
