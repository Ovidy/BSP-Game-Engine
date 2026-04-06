#include <bsp/input_handler.h>

namespace bsp {
    InputHandler::InputHandler() {
        // constructor code here
    }

    void InputHandler::update(Camera& camera) {
        if (is_key_down(static_cast<int>(KeyMap::FORWARD))) {
            camera.move_forward();
        } else if (is_key_down(static_cast<int>(KeyMap::BACKWARD))) {
            camera.move_backward();
        }

        if (is_key_down(static_cast<int>(KeyMap::STRAFE_LEFT))) {
            camera.strafe_left();
        } else if (is_key_down(static_cast<int>(KeyMap::STRAFE_RIGHT))) {
            camera.strafe_right();
        }
    }

    bool InputHandler::is_key_pressed(int key) const {
        return IsKeyPressed(key);
    }

    bool InputHandler::is_key_down(int key) const {
        return IsKeyDown(key);
    }

    bool InputHandler::is_key_released(int key) const {
        return IsKeyReleased(key);
    }

    bool InputHandler::is_mouse_button_pressed(int button) const {
        return IsMouseButtonPressed(button);
    }

    bool InputHandler::is_mouse_button_down(int button) const {
        return IsMouseButtonDown(button);
    }

    bool InputHandler::is_mouse_button_released(int button) const {
        return IsMouseButtonReleased(button);
    }

    Vector2 InputHandler::get_mouse_position() const {
        return GetMousePosition();
    }
}