#pragma once

#include <vector>
#include <bsp/data_types.h>

namespace bsp {
    bsp::Sector normal_sector = { 0.0f, 1.0f };
    bsp::Sector tall_room     = { 0.0f, 3.0f };
    bsp::Sector raised_ledge  = { 1.5f, 3.0f }; // Starts higher up, acts like a window or balcony
    bsp::Sector deep_pit      = { -2.0f, 1.0f };

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
        // The Diamond/Square: Tall Room (Using texture ID 1)
        { points[4], points[5], 1, tall_room }, { points[5], points[6], 1, tall_room }, { points[6], points[7], 1, tall_room }, { points[7], points[4], 1, tall_room },

        // The Outer Boundary: Normal Sector (Using random textures)
        { points[0], points[1], -1, normal_sector }, { points[1], points[2], -1, normal_sector }, { points[2], points[3], -1, normal_sector }, { points[3], points[0], -1, normal_sector },
        
        // The First Small Rectangle: Raised Ledge/Balcony
        { points[8], points[9], -1, raised_ledge }, { points[9], points[10], -1, raised_ledge }, { points[10], points[11], -1, raised_ledge }, { points[11], points[8], -1, raised_ledge },
        
        // The Second Small Rectangle: Deep Pit
        { points[12], points[13], -1, deep_pit }, { points[13], points[14], -1, deep_pit }, { points[14], points[15], -1, deep_pit }, { points[15], points[12], -1, deep_pit },
        
        // The Triangle: Normal Sector
        { points[16], points[17], -1, normal_sector }, { points[17], points[18], -1, normal_sector }, { points[18], points[16], -1, normal_sector },
    };
}
