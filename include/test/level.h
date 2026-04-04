#pragma once

#include <vector>
#include <utils.h>

// Points
std::vector<glm::vec2> points = {
    { 1.0f, 1.0f },
    { 7.0f, 1.0f },
    { 7.0f, 8.0f },
    { 1.0f, 8.0f }
};

// Segments:
std::vector<std::pair<glm::vec2, glm::vec2>> segments = {
    { points[0], points[1] },
    { points[1], points[2] },
    { points[2], points[3] },
    { points[3], points[0] }
};
