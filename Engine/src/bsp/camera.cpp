#include <bsp/camera.h>
#include <algorithm>
#include <cmath>
#include <bsp/utils.h>

namespace engine
{
    CameraComponent::CameraComponent(const float pitch, const float yaw, float fov_y)
    {
        up = glm::vec3(0.0f, 1.0f, 0.0f);
        m_cam.up = v3_rtg(up);
        m_cam.fovy = fov_y;
        m_cam.projection = CAMERA_PERSPECTIVE;

        set_pitch(pitch);
        set_yaw(yaw);
    }

    static float wrap_angle(float angle, float min, float max)
    {
        float range = max - min;
        float wrapped = std::fmod(angle - min, range);
        if (wrapped < 0)
            wrapped += range;
        return wrapped + min;
    }

    float CameraComponent::set_pitch(float pitch, float max, bool refresh_cache)
    {
        f_pitch = wrap_angle(pitch, max - 360.0f, max);
        if (refresh_cache)
            refresh_vec_cache();
        return f_pitch;
    }

    float CameraComponent::set_yaw(float yaw, float max, bool refresh_cache)
    {
        f_yaw = wrap_angle(yaw, max - 360.0f, max);
        if (refresh_cache)
            refresh_vec_cache();
        return f_yaw;
    }

    void CameraComponent::add_pitch(float delta, bool lock, bool refresh_cache)
    {
        float desired = f_pitch + delta;
        if (lock)
            desired = std::clamp(desired, -89.9f, 89.9f);
        set_pitch(desired, 180.0f, refresh_cache);
    }

    void CameraComponent::add_yaw(float delta, bool refresh_cache)
    {
        set_yaw(f_yaw + delta, 360.0f, refresh_cache);
    }

    void CameraComponent::handle_mouse_delta(glm::vec2 delta, bool lock)
    {
        add_yaw(delta.x, false);
        add_pitch(-delta.y, lock, false);
        if (delta != glm::vec2(0.0f))
            refresh_vec_cache();
    }

    void CameraComponent::toggle_free_view()
    {
        free_view = !free_view;
    }

    bool CameraComponent::is_free_view() const
    {
        return free_view;
    }

    const Camera3D &CameraComponent::get_raylib_camera() const { return m_cam; }
    glm::vec3 CameraComponent::get_forward() { return forward; }

    void CameraComponent::refresh_raylib(const glm::vec3& position)
    {
        m_cam.target = v3_rtg(get_target(position));
        m_cam.position = v3_rtg(position);
    }

    glm::vec3 CameraComponent::get_target(const glm::vec3& position)
    {
        return forward + position;
    }

    glm::vec3 CameraComponent::calc_dir()
    {
        float pitch = glm::radians(f_pitch);
        float yaw = glm::radians(f_yaw);

        return {
            cos(yaw) * cos(pitch),
            sin(pitch),
            sin(yaw) * cos(pitch)};
    }

    glm::vec3 CameraComponent::calc_right()
    {
        glm::vec3 tmp_up = glm::normalize(up);
        return glm::normalize(glm::cross(forward, tmp_up));
    }

    glm::vec3 CameraComponent::get_flat_forward()
    {
        glm::vec3 flat_forward = forward;
        flat_forward.y = 0.0f;
        return glm::normalize(flat_forward);
    }

    void CameraComponent::refresh_vec_cache()
    {
        forward = calc_dir();
        right = calc_right();
    }
}
