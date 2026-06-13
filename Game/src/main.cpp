#include <ecs/scene.h>

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
    scene.create_main_camera(glm::vec3(6.0f, CAM_HEIGHT + 2.0f, 5.0f), 0.0f, 0.0f, 60.0f);
    entt::entity player = scene.get_main_camera_entity();

    auto &reg = scene.get_registry();

    // Setup player physics components
    reg.emplace<engine::TransformComponent>(player, glm::vec3(6.0f, CAM_HEIGHT + 2.0f, 5.0f));
    reg.emplace<engine::VelocityComponent>(player);

    auto &controller = reg.emplace<engine::CharacterControllerComponent>(player);
    controller.radius = 0.5f;
    controller.height = CAM_HEIGHT;
    controller.speed = 5.0f;

    // Resource loading
    SearchAndSetResourceDir("Game/resources");

    for (const auto &[id, path] : scene.get_textures())
    {
        renderer.load_texture(id, path);
    }

    // Spawn level sprites
    for (const auto &sprite : scene.get_sprites())
    {
        entt::entity sprite_entity = scene.create_entity();
        reg.emplace<TransformComponent>(sprite_entity, sprite.position, glm::vec3(0.0f), glm::vec3(1.0f));
        reg.emplace<SpriteComponent>(sprite_entity, sprite.texture_id, sprite.tint);
    }

    // Initialize BSP level data
    bsp_manager.load_level(scene.get_sectors());
    renderer.load_segments(bsp_manager.get_segments(), bsp_manager.get_segments(), scene.get_sectors(), WINDOW_RESOLUTION);

    // Main game loop
    while (!WindowShouldClose())
    {
        delta_time = GetFrameTime();
        entt::entity player = scene.get_main_camera_entity();
        auto &reg = scene.get_registry();

        // --- 1. Input ---
        input_handler.update(reg, player, delta_time);

        if (IsKeyPressed(KEY_M))
        {
            renderer.get_map_renderer().toggle();
        }

        // --- 2. Physics ---
        engine::Camera &camera = reg.get<engine::Camera>(player);

        std::vector<engine::Sector> nearby_sectors = bsp_manager.get_nearby_sectors(
            glm::vec2(camera.get_position().x, camera.get_position().z),
            reg.get<engine::CharacterControllerComponent>(player).radius);

        character_controller_update(reg, delta_time, nearby_sectors);

        // --- 3. Camera Sync ---
        auto &transform = reg.get<engine::TransformComponent>(player);
        camera.get_position() = transform.position;
        camera.refresh_raylib();

        bsp_manager.update(camera.get_pos_2d());

        // --- 4. Render ---
        renderer.render(camera.get_raylib_camera(), camera.get_pos_2d(), bsp_manager.get_segment_ids_to_render(), reg);
    }

    CloseWindow();
    return 0;
}
