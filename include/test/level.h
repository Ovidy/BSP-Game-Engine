#pragma once

#include <vector>
#include <bsp/data_types.h>

namespace bsp {
    // Points
    std::vector<glm::vec2> points = {
        { 1.0f, 1.0f },
        { 7.0f, 1.0f },
        { 7.0f, 8.0f },
        { 1.0f, 8.0f },

        { 5.0f, 2.0f },
        { 4.0f, 4.0f },
        { 5.0f, 6.0f },
        { 6.0f, 4.0f }
    };

    // Segments:
    std::vector<bsp::Segment> test_level_segments = {
        { points[0], points[1] },
        { points[1], points[2] },
        { points[2], points[3] },
        { points[3], points[0] },

        { points[4], points[5] },
        { points[5], points[6] },
        { points[6], points[7] },
        { points[7], points[4] },
    };
}
