#pragma once

#include <bsp/utils.h>
#include <bsp/camera.h>
#include <raylib.h>

namespace bsp {
    enum class KeyMap {
        FORWARD = KEY_W,
        BACKWARD = KEY_S,
        STRAFE_LEFT = KEY_A,
        STRAFE_RIGHT = KEY_D,
        JUMP = KEY_SPACE
    };

    class InputHandler {
    public:
        InputHandler();

        void update(Camera& camera);
        bool is_key_pressed(int key) const;
        bool is_key_down(int key) const;
        bool is_key_released(int key) const;

        bool is_mouse_button_pressed(int button) const;
        bool is_mouse_button_down(int button) const;
        bool is_mouse_button_released(int button) const;

        Vector2 get_mouse_position() const;
    };
}