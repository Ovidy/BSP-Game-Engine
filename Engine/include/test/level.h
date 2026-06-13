#pragma once

#include <vector>
#include <bsp/data_types.h>
#include <ecs/scene.h>

namespace engine
{
    // Points (Remains exactly the same)
    std::vector<glm::vec2> points = {
        {1.0f, 1.0f},
        {7.0f, 1.0f},
        {7.0f, 8.0f},
        {1.0f, 8.0f}, // 0-3: Outer Boundary
        {5.0f, 2.0f},
        {4.0f, 4.0f},
        {5.0f, 6.0f},
        {6.0f, 4.0f}, // 4-7: Diamond/Square
        {1.8f, 1.8f},
        {1.8f, 4.2f},
        {3.5f, 4.2f},
        {3.5f, 1.8f}, // 8-11: First Rect
        {1.5f, 5.5f},
        {1.5f, 6.5f},
        {2.0f, 6.5f},
        {2.0f, 5.5f}, // 12-15: Second Rect
        {3.25f, 4.8f},
        {2.7f, 7.1f},
        {3.8f, 7.1f}, // 16-18: Triangle
        {3.25f + 5.0f, 4.8f + 5.0f},
        {2.7f + 5.0f, 7.1f + 5.0f},
        {3.8f + 5.0f, 7.1f + 5.0f}, // 16-18: Triangle
    };

    // Sectors with Extreme Height Variations
    std::vector<Sector> test_level_sectors = {

        // Sector 0: The Outer Boundary (Giant Main Hall)
        {
            0, 0.0f, 6.0f, -1, -1, // Ceiling raised to 6.0f
            std::vector<Segment>{
                Segment(points[0], points[1], -1, -1),
                Segment(points[1], points[2], -1, -1),
                Segment(points[2], points[3], -1, -1),
                Segment(points[3], points[0], -1, -1)}},

        // Sector 1: The Diamond/Square (Claustrophobic Room)
        {
            1, 0.0f, 2.0f, 1, 1, // Ceiling lowered to 2.0f
            std::vector<Segment>{
                Segment(points[4], points[5], 1, -1),
                Segment(points[5], points[6], 1, -1),
                Segment(points[6], points[7], 1, -1),
                Segment(points[7], points[4], 1, -1)}},

        // Sector 2: The First Small Rectangle (Mid-Air Balcony)
        {
            2, 2.0f, 4.0f, -1, -1, // Shifted up
            std::vector<Segment>{
                Segment(points[8], points[9], -1, -1),
                Segment(points[9], points[10], -1, -1),
                Segment(points[10], points[11], -1, -1),
                Segment(points[11], points[8], -1, -1)}},

        // Sector 3: The Second Small Rectangle (Sunken Trench)
        {
            3, -3.0f, 0.0f, -1, -1, // Ceiling flush with main floor
            std::vector<Segment>{
                Segment(points[12], points[13], -1, -1),
                Segment(points[13], points[14], -1, -1),
                Segment(points[14], points[15], -1, -1),
                Segment(points[15], points[12], -1, -1)}},

        // Sector 4: The Triangle (High Floating Platform)
        {
            4, 4.0f, 6.0f, -1, -1, // Touching the massive main ceiling
            std::vector<Segment>{
                Segment(points[16], points[17], -1, -1),
                Segment(points[17], points[18], -1, -1),
                Segment(points[18], points[16], -1, -1)}},

        // Sector 5: The Triangle (Far away)
        {
            5, 0.0f, 6.0f, -1, -1, // Touching the massive main ceiling
            std::vector<Segment>{
                Segment(points[19], points[20], -1, -1),
                Segment(points[20], points[21], -1, -1),
                Segment(points[21], points[19], -1, -1)}}};

    std::vector<Sprite> test_level_sprites = {
        // Place a sprite in the middle of the giant main hall (Floor is 0.0f)
        {glm::vec3(2.0f, 0.5f, 2.0f), 2, 1.0f, WHITE}, // Assuming texture ID 2 is a monster/item

        // Place a sprite up on the floating triangle platform (Floor is 4.0f)
        {glm::vec3(5.2f, 4.5f, 4.5f), 3, 1.5f, WHITE} // Tinted red, slightly larger
    };

    std::unordered_map<glm::int32_t, std::string> test_level_textures = {
        {1, "Wall1.png"},
        {2, "Monster1-north.png"},
        {3, "wabbit_alpha.png"}};
}
