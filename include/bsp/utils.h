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

#define CAM_HEIGHT 0.6
#define CAM_SPEED 6.2
#define CAM_ROT_SPEED 3.0
#define CAM_DIAG_MOVE_CORR 1 / pow(2, 0.5)

namespace bsp {
    glm::float32_t cross(const glm::vec2& a, const glm::vec2& b);

    bool is_on_front(const glm::vec2& a, const glm::vec2& b);
    bool is_on_back(const glm::vec2& a, const glm::vec2& b);
}
