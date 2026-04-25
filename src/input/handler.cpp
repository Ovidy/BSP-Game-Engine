#include <input/handler.h>

using namespace render;

namespace input {
    
    // Default constructor implementation moved to CPP
    Handler::Handler() = default;

    void Handler::update(bsp::Camera& camera, MapRenderer& map_renderer) {
        // ----------- system controls ----------- //
        if (IsKeyPressed(KEY_F11)) {
            ToggleFullscreen();
        }
        if (IsKeyPressed(KEY_C)) {
            camera.toggle_noclip();
        }
        // ----------- mouse look --------------- //
        Vector2 mouse_delta = GetMouseDelta();
        if (mouse_delta.x != 0.0f) {
            camera.add_yaw(mouse_delta.x);
        }

        if (camera.is_free_view()) {
            if (mouse_delta.y != 0.0f) {
                camera.add_pitch(mouse_delta.y);
            }
        }

        // ----------- camera control ----------- //
        if (IsKeyDown(KEY_W)) {
            camera.step_forward();
        } 
        else if (IsKeyDown(KEY_S)) {
            camera.step_back();
        }

        if (IsKeyDown(KEY_D)) {
            camera.step_right();
        } 
        else if (IsKeyDown(KEY_A)) {
            camera.step_left();
        }

        if (IsKeyDown(KEY_RIGHT)) {
            camera.add_yaw(1.0f);
        } 
        else if (IsKeyDown(KEY_LEFT)) {
            camera.add_yaw(-1.0f);
        }

        if (camera.is_noclip()) {
            if (IsKeyDown(KEY_SPACE)) {
                camera.fly_up();
            }
            else if (IsKeyDown(KEY_LEFT_SHIFT)) {
                camera.fly_down();
            }
        } else {
            if (IsKeyDown(KEY_SPACE)) {
                camera.jump();
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
