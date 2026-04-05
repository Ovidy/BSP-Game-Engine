#include <bsp/utils.h>

namespace bsp {
    float32_t cross(const glm::vec2& a, const glm::vec2& b) {
        return a.x * b.y - a.y * b.x;
    }
}
