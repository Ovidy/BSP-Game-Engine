#include <bsp/camera.h>
#include <algorithm>

namespace bsp {

    Camera::Camera(const glm::vec3& start_pos, const float pitch, const float yaw, float fov_y) {
        up = glm::vec3(0.0f, 1.0f, 0.0f);

        position = start_pos;
        m_cam.up = v3_rtg(up);
        m_cam.fovy = fov_y;
        m_cam.projection = CAMERA_PERSPECTIVE;
        refresh_raylib();

        set_pitch(pitch);
        set_yaw(yaw);

        velocity = glm::vec3(0.0f);
        speed = CAM_SPEED;
    }

    static float wrap_angle(float angle, float min, float max) {
        float range = max - min;
        float wrapped = std::fmod(angle - min, range);
        if (wrapped < 0)
            wrapped += range;
        return wrapped + min;
    }

    float Camera::set_pitch(float pitch, float max, bool refresh_cache) {
        f_pitch = wrap_angle(pitch, max -  360.0f, max);
        if (refresh_cache)
            refresh_vec_cache();
        return f_pitch;
	}

    float Camera::set_yaw(float yaw, float max, bool refresh_cache) {
        f_yaw = wrap_angle(yaw, max -  360.0f, max);
        if (refresh_cache)
            refresh_vec_cache();
        return f_yaw;
	}

    void Camera::add_pitch(float delta, bool lock, bool refresh_cache) {
        float desired = f_pitch + delta;
        if (lock)
            desired = std::clamp(desired, -89.9f, 89.9f);
        set_pitch(desired, 180.0f,refresh_cache);
	}

    void Camera::add_yaw(float delta, bool refresh_cache) {
        set_yaw(f_yaw + delta, 360.0f,refresh_cache);
	}

    void Camera::handle_mouse_delta(glm::vec2 delta, bool lock) { 
        add_yaw( delta.x, false);
        add_pitch( -delta.y, lock, false);
        if (delta != glm::vec2(0.0f))
            refresh_vec_cache();
    }


    void Camera::update(const glm::float32_t& dt, const std::vector<bsp::Sector>& level_sectors) {
        check_velocity();
        move(level_sectors, dt);
        refresh_raylib();
    }

    void Camera::step_forward(const float& dt) {
        velocity += speed * get_flat_forward();
    }

    void Camera::step_back(const float& dt) {
        velocity -= speed * get_flat_forward();
    }

    void Camera::step_left(const float& dt) {
        velocity -= speed * right;
    }

    void Camera::step_right(const float& dt) {
        velocity += speed * right;
    }

    void Camera::tilt_up() {
        pitch_dir += 1.0f;
    }

    void Camera::tilt_down() {
        pitch_dir -= 1.0f;
    }

    void Camera::fly_up(const float& dt) {
        position.y += speed * dt; 
    }

    void Camera::fly_down(const float& dt) {
        position.y -= speed * dt; 
    }

    void Camera::jump(const float& dt) {
        if (is_grounded || noclip_enabled) {
            velocity.y = JUMP_FORCE;
            is_grounded = false;
        }
    }

    void Camera::toggle_noclip() {
        noclip_enabled = !noclip_enabled;
    }
    
    bool Camera::is_noclip() const {
        return noclip_enabled;
    }

    void Camera::toggle_free_view() {
        free_view = !free_view;
    }

    bool Camera::is_free_view() const {
        return free_view;
    }

    void Camera::check_velocity() {
        if (velocity.x != 0.0f || velocity.z != 0.0f) {
            velocity.x *= CAM_DIAG_MOVE_CORR;
            velocity.z *= CAM_DIAG_MOVE_CORR;
        }
    }

    void Camera::move(const std::vector<bsp::Sector>& level_sectors, float dt) {
        glm::vec2 current_pos_2d = get_pos_2d();
        glm::vec2 vel_2d = glm::vec2{ velocity.x, velocity.z };
        
        if (!noclip_enabled) {
            // Apply Gravity
            if (!is_grounded) {
                velocity.y -= GRAVITY; 
            }

            // --- 1. HORIZONTAL COLLISION ---
            // Calculate bounds based on current height
            float head_y = position.y + 0.2f;
            float feet_y = position.y - player_height;

            physics::CollisionResult hit = physics::Collider::detect_wall_collision(
            current_pos_2d, vel_2d * dt, player_radius, feet_y, head_y, level_sectors
            );

            if (hit.any_collision()) {
                velocity.x *= !hit.x;
                velocity.z *= !hit.y;
            }
            
            // --- 2. APPLY HORIZONTAL MOVEMENT ---
            position.x += velocity.x * dt;
            position.z += velocity.z * dt;

            // --- 3. VERTICAL COLLISION & SNAPPING ---
            physics::VerticalBounds bounds = physics::Collider::get_sector_bounds(get_pos_2d(), feet_y, head_y, level_sectors);

            float next_y = position.y + velocity.y * dt;
            float next_feet_y = next_y - player_height;
            float next_head_y = next_y + 0.2f;

            // Floor Snapping
            if (next_feet_y <= bounds.floor_height) {
                position.y = bounds.floor_height + player_height; // CRITICAL: Snap to surface
                velocity.y = 0.0f;
                is_grounded = true;
            } else {
                position.y = next_y;
                is_grounded = false;
            }

            // Ceiling Snapping
            if (next_head_y >= bounds.ceiling_height) {
                position.y = bounds.ceiling_height - 0.2f; // CRITICAL: Don't let head enter ceiling
                velocity.y = 0.0f;
            }
        } else {
            position += velocity * dt;
        }
    }


    // --- Getters implemented in CPP --- //

    const Camera3D& Camera::get_raylib_camera() const { 
        return m_cam; 
    }
    
    glm::vec2 Camera::get_pos_2d() const { 
        return glm::vec2{position.x, position.z}; 
    }
    
    glm::vec3& Camera::get_position() { 
        return position;
    }

    float Camera::get_player_radius() const {
        return player_radius;
    }


    void Camera::refresh_raylib() {
        m_cam.target = v3_rtg(get_target());
        m_cam.position = v3_rtg(position);
    }

    glm::vec3 Camera::get_target() {
        return forward + position;
    }

    glm::vec3 Camera::calc_dir() {
        float pitch = glm::radians(f_pitch);
        float yaw =   glm::radians(f_yaw);

        return {
            cos(yaw)*cos(pitch),
            sin(pitch),
            sin(yaw)*cos(pitch)
        };
    }

    glm::vec3 Camera::get_forward() {
        return forward;
    }

    glm::vec3 Camera::calc_right() {
        glm::vec3 tmp_up = glm::normalize(up);
        glm::vec3 res =glm::normalize(glm::cross(forward, tmp_up));
        return res;
    }

    glm::vec3 Camera::get_flat_forward() {
        glm::vec3 flat_forward = forward;
        flat_forward.y = 0.0f;
        return glm::normalize(flat_forward);
    }

    void Camera::refresh_vec_cache() {
        forward = calc_dir();
        right = calc_right();
    }
}
