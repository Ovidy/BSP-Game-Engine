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
        Camera(const glm::vec3& start_pos, const glm::vec3& start_target, float fov_y);

        void pre_update(const glm::float32_t& deltaTime);
        void update(const glm::float32_t& deltaTime, const std::vector<bsp::Sector>& level_sectors);

        void step_forward();
        void step_back();
        void step_left();
        void step_right();

        void tilt_up();
        void tilt_down();

        void fly_up();
        void fly_down();

        void toggle_noclip();
        bool is_noclip() const;

        void add_yaw(float dx);

        // Declarations only
        const Camera3D& get_raylib_camera() const;
        glm::vec2 get_pos_2d() const;
        glm::vec3 get_pos_3d() const;

    private:
        Camera3D m_cam;
        glm::vec3 fake_up;
        glm::vec2 pos_2d;

        float speed;
        float pitch_dir;
        float yaw_delta;
        float player_height = 0.8f; // How tall the camera is
        glm::vec3 cam_step;
        glm::vec3 forward;
        glm::vec3 right;
        bool noclip_enabled = true; // Start floating freely for debugging

        void set_yaw(float dt);
        void set_pitch(float dt);
        void update_target(const glm::vec3& new_target_pos);
        void update_vectors();
        glm::vec3 get_forward() const;
        void init_cam_step(float dt);
        void check_cam_step();
        void move(const std::vector<bsp::Sector>& level_sectors);
        void move_x(float dx);
        void move_y(float dy);
        void move_z(float dz);
        void update_pos_2d();
    };
}