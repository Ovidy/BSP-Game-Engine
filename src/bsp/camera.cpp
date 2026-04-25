#include <bsp/camera.h>

namespace bsp {

    Camera::Camera(const glm::vec3& start_pos, const glm::vec3& start_target, float fov_y) {
        fake_up = glm::vec3(0.0f, 1.0f, 0.0f);

        m_cam.position = { start_pos.x, start_pos.y, start_pos.z };
        m_cam.target = { start_target.x, start_target.y, start_target.z };
        m_cam.up = { fake_up.x, fake_up.y, fake_up.z };
        m_cam.fovy = fov_y;
        m_cam.projection = CAMERA_PERSPECTIVE;

        pos_2d = glm::vec2(m_cam.position.x, m_cam.position.z);
        cam_step = glm::vec3(0.0f);
        forward = glm::vec3(0.0f);
        right = glm::vec3(0.0f);
        speed = CAM_SPEED;
    }

    void Camera::set_yaw(float dt) {
        if (yaw_delta != 0.0f) {
            // Use the stored yaw_delta instead of GetMouseDelta()
            float delta_yaw = -yaw_delta * CAM_ROT_SPEED * dt;

            glm::vec3 new_target_pos = glm::rotateY(forward, delta_yaw);
            update_target(new_target_pos);
            
            // Update the forward vector immediately just like we do in pitch
            forward = glm::normalize(new_target_pos);
        }
    }

    void Camera::set_pitch(float dt) {
        if (pitch_dir != 0.0f) {
            // Calculate delta based on the input handler's direction
            float delta_pitch = pitch_dir * CAM_ROT_SPEED * dt;
            
            glm::vec3 new_target_pos = glm::rotate(forward, delta_pitch, right);

            // Clamp the rotation so the camera doesn't flip completely upside down
            if (new_target_pos.y < 0.99f && new_target_pos.y > -0.99f) {
                update_target(new_target_pos);
                forward = glm::normalize(new_target_pos); 
            }
        }
    }

    void Camera::add_yaw(float dx) {
        yaw_delta += dx;
    }

    void Camera::update_target(const glm::vec3& new_target_pos) {
        m_cam.target.x = m_cam.position.x + new_target_pos.x;
        m_cam.target.y = m_cam.position.y + new_target_pos.y;
        m_cam.target.z = m_cam.position.z + new_target_pos.z;
    }

    void Camera::pre_update(const glm::float32_t& dt) {
        init_cam_step(dt);
        update_vectors();
    }

    void Camera::update(const glm::float32_t& dt, const std::vector<bsp::Sector>& level_sectors) {
        check_cam_step();
        update_pos_2d();
        set_yaw(dt);
        set_pitch(dt);
        move(level_sectors);
    }

    void Camera::update_vectors() {
        forward = get_forward();
        right = glm::cross(forward, fake_up);
    }

    glm::vec3 Camera::get_forward() const {
        glm::vec3 dir(
            m_cam.target.x - m_cam.position.x,
            m_cam.target.y - m_cam.position.y,
            m_cam.target.z - m_cam.position.z
        );
        return glm::normalize(dir);
    }

    void Camera::init_cam_step(float dt) {
        speed = CAM_SPEED * dt;
        cam_step = glm::vec3(0.0f);
        pitch_dir = 0.0f;
        yaw_delta = 0.0f;
    }

    void Camera::step_forward() {
        cam_step += speed * forward;
    }

    void Camera::step_back() {
        cam_step -= speed * forward;
    }

    void Camera::step_left() {
        cam_step -= speed * right;
    }

    void Camera::step_right() {
        cam_step += speed * right;
    }

    void Camera::tilt_up() {
        pitch_dir += 1.0f;
    }

    void Camera::tilt_down() {
        pitch_dir -= 1.0f;
    }

    void Camera::fly_up() {
        cam_step.y += speed; 
    }

    void Camera::fly_down() {
        cam_step.y -= speed; 
    }

    void Camera::toggle_noclip() {
        noclip_enabled = !noclip_enabled;
    }
    
    bool Camera::is_noclip() const {
        return noclip_enabled;
    }

    void Camera::check_cam_step() {
        if (cam_step.x != 0.0f && cam_step.z != 0.0f) {
            cam_step *= CAM_DIAG_MOVE_CORR;
        }
    }

    void Camera::move(const std::vector<bsp::Sector>& level_sectors) {
        glm::vec2 current_pos_2d = { m_cam.position.x, m_cam.position.z };
        glm::vec2 intended_vel = { cam_step.x, cam_step.z };
        glm::vec2 final_vel = intended_vel;

        if (!noclip_enabled) {
            glm::vec2 intended_pos = current_pos_2d + intended_vel;
            
            // 1. Detection Phase
            physics::CollisionResult hit = physics::Collider::detect_wall_collision(
                current_pos_2d, intended_pos, 
                m_cam.position.y, player_height, 
                level_sectors
            );

            // 2. Prevention Phase
            final_vel = physics::Collider::resolve_movement(intended_vel, hit);
        }

        move_x(cam_step.x);
        move_y(cam_step.y);
        move_z(cam_step.z);
    }

    void Camera::move_x(float dx) {
        m_cam.position.x += dx;
        m_cam.target.x += dx;
    }

    void Camera::move_y(float dy) {
        m_cam.position.y += dy;
        m_cam.target.y += dy;
    }

    void Camera::move_z(float dz) {
        m_cam.position.z += dz;
        m_cam.target.z += dz;
    }

    void Camera::update_pos_2d() {
        pos_2d.x = m_cam.position.x;
        pos_2d.y = m_cam.position.z;
    }

    // --- Getters implemented in CPP --- //

    const Camera3D& Camera::get_raylib_camera() const { 
        return m_cam; 
    }
    
    glm::vec2 Camera::get_pos_2d() const { 
        return pos_2d; 
    }
    
    glm::vec3 Camera::get_pos_3d() const { 
        return glm::vec3(m_cam.position.x, m_cam.position.y, m_cam.position.z); 
    }
}
