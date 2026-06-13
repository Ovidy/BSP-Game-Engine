#pragma once

#include <raylib.h>
#include <glm/glm.hpp>

namespace engine
{
    class Camera
    {
    public:
        Camera(const glm::vec3 &start_pos, const float pitch, const float yaw, float fov_y);
        ~Camera() = default;

        // Angle Management
        float set_pitch(float pitch, float max = 89.9f, bool refresh_cache = true);
        float set_yaw(float yaw, float max = 360.0f, bool refresh_cache = true);
        void add_pitch(float delta, bool lock = true, bool refresh_cache = true);
        void add_yaw(float delta, bool refresh_cache = true);
        void handle_mouse_delta(glm::vec2 delta, bool lock = true);

        // Core Updates
        void refresh_raylib();
        void refresh_vec_cache();

        // Getters
        const Camera3D &get_raylib_camera() const;
        glm::vec2 get_pos_2d() const;
        glm::vec3 &get_position();
        glm::vec3 get_target();
        glm::vec3 get_forward();
        glm::vec3 get_flat_forward();

        // State toggles
        void toggle_free_view();
        bool is_free_view() const;

    private:
        glm::vec3 calc_dir();
        glm::vec3 calc_right();

        Camera3D m_cam;
        
        glm::vec3 position;
        glm::vec3 forward;
        glm::vec3 up;
        glm::vec3 right;

        float f_pitch;
        float f_yaw;
        bool free_view = false;
    };
}
