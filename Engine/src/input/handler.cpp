#include <input/handler.h>

using namespace render;

namespace input {
    
    // Default constructor implementation moved to CPP
    Handler::Handler() = default;

    void Handler::update(bsp::Camera& camera, MapRenderer& map_renderer, const float& dt) {
        // ----------- system controls ----------- //
        if (IsKeyPressed(KEY_F11)) {
            ToggleFullscreen();
        }
        
        if (IsKeyPressed(KEY_C)) {
            camera.toggle_noclip();
            static float gravities[] = {0.0f, camera.GRAVITY};
            camera.GRAVITY = gravities[!camera.is_noclip()];
            camera.velocity.y = 0.0f;
        }

        if (IsKeyPressed(KEY_F)) {
            camera.toggle_free_view();
        }
        // ----------- mouse look --------------- //
        Vector2 mouse_delta = GetMouseDelta();
        if (mouse_delta.x != 0.0f) {
            camera.add_yaw(mouse_delta.x * dt);
        }

        if (camera.is_free_view()) {
            if (mouse_delta.y != 0.0f) {
                camera.add_pitch(-mouse_delta.y * dt, true);
            }
        }
        camera.handle_mouse_delta(glm::vec2(mouse_delta.x, mouse_delta.y) * dt, true);
        DrawText(TextFormat("%f %f", camera.yaw(), camera.pitch()), 20, 30, 20, RAYWHITE);
        
        // ----------- camera control ----------- //
        if (IsKeyDown(KEY_W)) {
            camera.step_forward(dt);
        } 
        else if (IsKeyDown(KEY_S)) {
            camera.step_back(dt);
        }

        if (IsKeyDown(KEY_D)) {
            camera.step_right(dt);
        } 
        else if (IsKeyDown(KEY_A)) {
            camera.step_left(dt);
        }
        
        if (IsKeyDown(KEY_RIGHT)) {
            camera.add_yaw(100.0f * dt);
        } 
        else if (IsKeyDown(KEY_LEFT)) {
            camera.add_yaw(-100.0f * dt);
        }

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
        if (camera.is_free_view()) {
            if (IsKeyDown(KEY_UP)) {
                camera.tilt_up();
            }
            else if (IsKeyDown(KEY_DOWN)) {
                camera.tilt_down();
            }
        }
        // -------------------------------------- //
        if (IsKeyPressed(KEY_M)) {
            if (map_renderer.is_enabled()) {
                map_renderer.disable_render();
            } else {
                map_renderer.enable_render();
            }
        }
    }
}
