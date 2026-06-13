#include <input/input_handler.h>

// Default constructor implementation moved to CPP
InputHandler::InputHandler() = default;

void InputHandler::update(bsp::Camera& camera, MapRenderer& map_renderer, const float& dt) {
    // ----------- system controls ----------- //
    if (IsKeyPressed(KEY_F11)) {
        ToggleFullscreen();
    }
    
    if (IsKeyPressed(KEY_C)) {
        camera.toggle_noclip();
        
        camera.GRAVITY = camera.is_noclip() ? 0.0f : CAM_GRAV;
        camera.velocity.y = 0.0f;
    }

    if (IsKeyPressed(KEY_F)) {
        camera.toggle_free_view();
    }
    // ----------- mouse look --------------- //
    Vector2 mouse_delta = GetMouseDelta();
    camera.handle_mouse_delta(glm::vec2(mouse_delta.x, mouse_delta.y) * camera.get_sensitivity() * dt, true);

    
    // ----------- camera control ----------- //
    float f = (float)(IsKeyDown(KEY_W) - IsKeyDown(KEY_S));
    float r = (float)(IsKeyDown(KEY_D) - IsKeyDown(KEY_A));

    const auto& forward = camera.get_flat_forward();
    const auto& right = camera.get_right();

    camera.add_force((f * forward + r * right) * camera.get_speed());
    
    float pitch_delta = IsKeyDown(KEY_UP)  - IsKeyDown(KEY_DOWN);
    camera.add_pitch(100.0f * pitch_delta * dt, camera.is_free_view());

    float yaw_delta = IsKeyDown(KEY_RIGHT)  - IsKeyDown(KEY_LEFT);
    camera.add_yaw(100.0f * yaw_delta * dt);



    if (camera.is_noclip()) {
        if (IsKeyDown(KEY_SPACE)) {
            camera.fly_up(dt);
        }
        else if (IsKeyDown(KEY_LEFT_SHIFT)) {
            camera.fly_down(dt);
        }
    } else {
        if (IsKeyDown(KEY_SPACE)) {
            camera.jump(dt);
        }
    }

    // ----------- camera rotation ---------- //
    if (IsKeyPressed(KEY_M)) {
        map_renderer.toggle();
    }
}
