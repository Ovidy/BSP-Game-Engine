#pragma once

#include <bsp/data_types.h>
#include <glm/glm.hpp>
#include <vector>

namespace physics {
    // The result of our detection phase
    struct CollisionResult {
        bool is_colliding = false;
        glm::vec2 push_vector = glm::vec2(0.0f); // Accumulates forces to push the player out
    };

    // Struct to hold the vertical limits of wherever the player is standing
    struct VerticalBounds {
        float floor_height = -9999.0f; // Start infinitely low
        float ceiling_height = 9999.0f; // Start infinitely high
    };

    class Collider {
    public:
        // Checks math, returns data, DOES NOT alter the player
        static CollisionResult detect_wall_collision(
            const glm::vec2& intended_pos, float player_radius,        
            float feet_y, float head_y,        
            const std::vector<bsp::Sector>& level_sectors
        );

        // Finds which sector the player is in, and returns its heights
        static VerticalBounds get_sector_bounds(
            const glm::vec2& player_pos_2d, 
            float feet_y, float head_y,
            const std::vector<bsp::Sector>& level_sectors
        );

        // Takes the detection data and alters the movement vector
        static glm::vec2 resolve_movement(
            const glm::vec2& intended_vel, 
            const CollisionResult& hit
        );

    private:
        // Finds the mathematically closest point on a line segment to the player
        static glm::vec2 closest_point_on_segment(
            const glm::vec2& p, 
            const glm::vec2& a, 
            const glm::vec2& b
        );

        // Math helper to check if a point is inside a polygon
        static bool is_point_in_sector(const glm::vec2& point, const bsp::Sector& sector);
    };
}
