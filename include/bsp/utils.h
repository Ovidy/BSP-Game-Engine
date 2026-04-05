#pragma once

#include <iostream>
#include <glm/glm.hpp>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define WINDOW_RESOLUTION glm::vec2(WINDOW_WIDTH, WINDOW_HEIGHT)

#define MAP_OFFSET 50
#define MAP_WIDTH WINDOW_WIDTH - MAP_OFFSET
#define MAP_HEIGHT WINDOW_HEIGHT - MAP_OFFSET

#define EPSILON 0.00001f

namespace bsp {
    glm::float32_t cross(const glm::vec2& a, const glm::vec2& b);
}
