#include <bsp/utils.h>

namespace engine
{
    glm::float32_t cross(const glm::vec2 &a, const glm::vec2 &b)
    {
        return a.x * b.y - b.x * a.y;
    }

    bool is_on_front(const glm::vec2 &a, const glm::vec2 &b)
    {
        return a.x * b.y < b.x * a.y;
    }

    bool is_on_back(const glm::vec2 &a, const glm::vec2 &b)
    {
        return !is_on_front(a, b);
    }

    Vector3 v3_rtg(const glm::vec3 &value)
    {
        return {value.x, value.y, value.z};
    }

    Vector2 v2_rtg(const glm::vec2 &value)
    {
        return {value.x, value.y};
    }

    glm::vec2 rtg_v2(const Vector2 &value)
    {
        return {value.x, value.y};
    }
}
