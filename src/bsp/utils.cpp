#include <bsp/utils.h>

namespace bsp {
    glm::float32_t cross(const glm::vec2& a, const glm::vec2& b) {
        return a.x * b.y - b.x * a.y;
    }

    bool is_on_front(const glm::vec2& a, const glm::vec2& b) {
        return a.x * b.y < b.x * a.y;
    }

    bool is_on_back(const glm::vec2& a, const glm::vec2& b) {
        return !is_on_front(a, b);
    }
}
