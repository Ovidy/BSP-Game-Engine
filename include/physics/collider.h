#pragma once

#include <bsp/data_types.h>
#include <glm/glm.hpp>
#include <vector>

namespace physics {

    // The result of our detection phase
    struct CollisionResult {
        bool is_colliding = false;
        glm::vec2 hit_normal = glm::vec2(0.0f); // Which way the wall is facing
        float distance = 0.0f;                  // How close we got
    };

    class Collider {
    public:
        // Checks math, returns data, DOES NOT alter the player
        static CollisionResult detect_wall_collision(
            const glm::vec2& start_pos, 
            const glm::vec2& intended_pos, 
            float player_y,             // Current height
            float player_height,        // How tall the player is
            const std::vector<bsp::Sector>& level_sectors
        );

        // Takes the detection data and alters the movement vector
        static glm::vec2 resolve_movement(
            const glm::vec2& intended_vel, 
            const CollisionResult& hit
        );

    private:
        // Standard 2D line intersection math
        static bool line_intersects(
            const glm::vec2& p1, const glm::vec2& p2, 
            const glm::vec2& p3, const glm::vec2& p4, 
            glm::vec2& out_intersection
        );
    };
}
