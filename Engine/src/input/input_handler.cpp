#include <input/input_handler.h>
#include <entt/entt.hpp>
#include <bsp/camera.h>
#include <physics/components.h>
#include <bsp/components.h>
#include <bsp/utils.h>

namespace engine
{
    InputHandler::InputHandler() {}

    void InputHandler::update(entt::registry &registry, entt::entity player_entity, float dt)
    {
        // 1. Grab the components we need to read/write
        auto &velocity = registry.get<engine::VelocityComponent>(player_entity);
        auto &controller = registry.get<engine::CharacterControllerComponent>(player_entity);
        auto &camera = registry.get<engine::Camera>(player_entity);

        // ==========================================
        // 2. MOUSE & CAMERA LOOK
        // ==========================================
        glm::vec2 mouse_delta = rtg_v2(GetMouseDelta());
        camera.handle_mouse_delta(mouse_delta);

        // Arrow Keys Look (Fallback)
        if (IsKeyDown(KEY_RIGHT))
            camera.add_yaw(100.0f * dt);
        if (IsKeyDown(KEY_LEFT))
            camera.add_yaw(-100.0f * dt);
        if (IsKeyDown(KEY_UP))
            camera.add_pitch(100.0f * dt);
        if (IsKeyDown(KEY_DOWN))
            camera.add_pitch(-100.0f * dt);

        // ==========================================
        // 3. HORIZONTAL MOVEMENT
        // ==========================================
        glm::vec3 forward = camera.get_flat_forward();
        glm::vec3 right = glm::normalize(glm::cross(forward, glm::vec3(0, 1, 0)));

        // Reset horizontal velocity each frame (acts as instant friction)
        velocity.velocity.x = 0.0f;
        velocity.velocity.z = 0.0f;

        if (IsKeyDown(KEY_W))
            velocity.velocity += forward * controller.speed;
        if (IsKeyDown(KEY_S))
            velocity.velocity -= forward * controller.speed;
        if (IsKeyDown(KEY_A))
            velocity.velocity -= right * controller.speed;
        if (IsKeyDown(KEY_D))
            velocity.velocity += right * controller.speed;

        // ==========================================
        // 4. VERTICAL MOVEMENT (Jump vs Noclip)
        // ==========================================
        if (controller.noclip_enabled)
        {
            // NOCLIP MODE: Reset gravity/momentum so we don't drift
            velocity.velocity.y = 0.0f;
            if (IsKeyDown(KEY_SPACE))
                velocity.velocity.y += controller.speed;
            if (IsKeyDown(KEY_LEFT_SHIFT))
                velocity.velocity.y -= controller.speed;
        }
        else
        {
            // NORMAL MODE: Jump
            if (IsKeyDown(KEY_SPACE) && controller.is_grounded)
            {
                velocity.velocity.y = controller.jump_force;
                controller.is_grounded = false;
            }
        }

        // ==========================================
        // 5. TOGGLES & SETTINGS
        // ==========================================
        // C - Toggle Creative Mode (Noclip)
        if (IsKeyPressed(KEY_C))
        {
            controller.noclip_enabled = !controller.noclip_enabled;
        }

        // F - Free View Mode
        if (IsKeyPressed(KEY_F))
        {
            camera.toggle_free_view();
        }

        // TAB - Toggle Mouse Lock
        if (IsKeyPressed(KEY_TAB))
        {
            if (IsCursorHidden())
                EnableCursor();
            else
                DisableCursor();
        }

        // F11 - Fullscreen
        if (IsKeyPressed(KEY_F11))
        {
            ToggleFullscreen();
        }
    }
}
