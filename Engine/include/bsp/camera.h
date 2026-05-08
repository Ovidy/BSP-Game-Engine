#pragma once

#include <raylib.h>
#include <glm/glm.hpp>
#define GLM_ENABLE_EXPERIMENTAL
#include <glm/gtx/rotate_vector.hpp>
#include <bsp/utils.h>
#include <physics/collider.h>

namespace bsp {
    class Camera {
    public:
        Camera(const glm::vec3& start_pos, const float pitch, const float yaw, float fov_y);

        void update(const glm::float32_t& deltaTime, const std::vector<bsp::Sector>& level_sectors);

        float set_pitch(float pitch, float max = 180.0f, bool refresh_cache = true);
        float set_yaw(float yaw, float max = 360.0f, bool refresh_cache = true);
        void add_pitch(float delta, bool lock, bool refresh_cache = true); // Both should really be static functions
        void add_yaw(float delta, bool refresh_cache = true);              // in the cpp file but it's your choice 
        void handle_mouse_delta(glm::vec2 delta, bool lock_pitch);

        constexpr float pitch() {return f_pitch;};
        constexpr float yaw() {return f_yaw;};

        void step_forward(const float& dt);
        void step_back(const float& dt);
        void step_left(const float& dt);
        void step_right(const float& dt);

        void tilt_up();
        void tilt_down();

        void fly_up();
        void fly_down();

        void jump(const float& dt);

        // Enables or disables collision
        void toggle_noclip();
        bool is_noclip() const;

        // Enables or disables free view
        void toggle_free_view();
        bool is_free_view() const;

        // Declarations only
        const Camera3D& get_raylib_camera() const;
        glm::vec3& get_position();
        glm::vec2 get_pos_2d() const;
        float get_player_radius() const;

    private:
        Camera3D m_cam;
        glm::vec3 position;

        float speed;
        float pitch_dir;
        float yaw_delta;
        float pitch_delta;
        float player_height = 0.8f; // How tall the camera is
        float player_radius = 0.25f;
        bool is_grounded = false;
        
        const float GRAVITY = 05.0f;     // How fast we fall
        const float JUMP_FORCE = 60.0f;   // How high we jump

        glm::vec3 velocity = glm::vec3(0.0);
        bool noclip_enabled = false;
        bool free_view = true; // Look everywhere with mouse

        glm::vec3 up;
        glm::vec3 right;
        glm::vec3 forward;
        float f_pitch;
        float f_yaw;

        

        void check_velocity();
        void move(const std::vector<bsp::Sector>& level_sectors, const glm::float32_t deltaTime);

        glm::vec3 calc_dir();
        glm::vec3 calc_right();
        glm::vec3 get_target();
        glm::vec3 get_forward(); 
        glm::vec3 get_flat_forward(); // Isn't really releveant for 2.5D but nice to have
        void refresh_raylib();
        void refresh_vec_cache();
    };

}
