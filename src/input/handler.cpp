#include <input/handler.h>

using namespace render;

namespace input {
    
    // Default constructor implementation moved to CPP
    Handler::Handler() = default;

    void Handler::update(bsp::Camera& camera, MapRenderer& map_renderer) {
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
