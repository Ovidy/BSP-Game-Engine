#include <bsp/input_handler.h>

namespace bsp {
    
    // Default constructor implementation moved to CPP
    InputHandler::InputHandler() = default;

    void InputHandler::update(Camera& camera, MapRenderer& map_renderer/*, ViewRenderer& view_renderer*/) {
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

        // if (IsKeyPressed(KEY_M)) {
        //     map_renderer.is_draw_map = !map_renderer.is_draw_map;
        //     view_renderer.update_screen_tint();
        // }
    }
}
