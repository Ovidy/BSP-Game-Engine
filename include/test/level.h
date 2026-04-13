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
        { 6.0f, 4.0f },

        { 1.8f, 1.8f },
        { 1.8f, 4.2f },
        { 3.5f, 4.2f },
        { 3.5f, 1.8f },

        { 1.5f, 5.5f },
        { 1.5f, 6.5f },
        { 2.0f, 6.5f },
        { 2.0f, 5.5f },

        { 3.25f, 4.8f },
        { 2.7f, 7.1f },
        { 3.8f, 7.1f },
    };
    
    // Segments:
    std::vector<bsp::Segment> test_level_segments = {
        // Example: Using texture ID 1 for this specific square (assuming you load it in main.cpp)
        { points[4], points[5], 1 }, { points[5], points[6], 1 }, { points[6], points[7], 1 }, { points[7], points[4], 1 },

        // The rest of the level using -1 as the placeholder (generates a random texture)
        { points[0], points[1], -1 }, { points[1], points[2], -1 }, { points[2], points[3], -1 }, { points[3], points[0], -1 },
        { points[8], points[9], -1 }, { points[9], points[10], -1 }, { points[10], points[11], -1 }, { points[11], points[8], -1 },
        { points[12], points[13], -1 }, { points[13], points[14], -1 }, { points[14], points[15], -1 }, { points[15], points[12], -1 },
        { points[16], points[17], -1 }, { points[17], points[18], -1 }, { points[18], points[16], -1 },
    };
}
