#include <physics/collider.h>

namespace physics {
    CollisionResult Collider::detect_wall_collision(
        const glm::vec2& start_pos, const glm::vec2& intended_pos, 
        float player_y, float player_height, 
        const std::vector<bsp::Sector>& level_sectors) 
    {
        CollisionResult result;
        float player_top = player_y + player_height;
        float player_bottom = player_y;

        // In a fully optimized engine, you would use the BSP tree here to ONLY get 
        // the sector the player is currently inside. For now, looping sectors works exactly the same.
        for (const auto& sector : level_sectors) {
            
            // HEIGHT CHECK: Are we completely above or below this sector?
            // If our feet are above the ceiling, we fly right over it!
            if (player_bottom >= sector.ceiling_height) {
                continue; 
            }
            
            // If our head is below the floor, we are underneath it!
            if (player_top <= sector.floor_height) {
                continue;
            }

            // If we are within the height bounds, check the 2D walls
            for (const auto& wall : sector.walls) {
                glm::vec2 intersection;
                
                if (line_intersects(start_pos, intended_pos, wall.get_start(), wall.get_end(), intersection)) {
                    result.is_colliding = true;
                    
                    // Calculate the wall's normal (perpendicular vector) for sliding
                    glm::vec2 wall_dir = glm::normalize(wall.get_end() - wall.get_start());
                    result.hit_normal = glm::vec2(-wall_dir.y, wall_dir.x); // 90 degree rotation
                    
                    return result; // Return immediately on first hit
                }
            }
        }
        return result;
    }

    glm::vec2 Collider::resolve_movement(const glm::vec2& intended_vel, const CollisionResult& hit) {
        if (!hit.is_colliding) {
            return intended_vel;
        }

        // Movement Prevention: Slide along the wall
        // We remove the part of the velocity that goes INTO the wall, keeping the part that slides ALONG it.
        float dot = glm::dot(intended_vel, hit.hit_normal);
        return intended_vel - (hit.hit_normal * dot); 
    }

    // Standard Line Intersection Algorithm (AABB / Cross Product approach)
    bool Collider::line_intersects(
        const glm::vec2& p1, const glm::vec2& p2, 
        const glm::vec2& p3, const glm::vec2& p4, 
        glm::vec2& out_intersection) 
    {
        float denominator = ((p4.y - p3.y) * (p2.x - p1.x)) - ((p4.x - p3.x) * (p2.y - p1.y));
        if (denominator == 0.0f) return false; // Lines are parallel

        float u_a = (((p4.x - p3.x) * (p1.y - p3.y)) - ((p4.y - p3.y) * (p1.x - p3.x))) / denominator;
        float u_b = (((p2.x - p1.x) * (p1.y - p3.y)) - ((p2.y - p1.y) * (p1.x - p3.x))) / denominator;

        // If u_a and u_b are between 0 and 1, the segments intersect!
        if (u_a >= 0.0f && u_a <= 1.0f && u_b >= 0.0f && u_b <= 1.0f) {
            out_intersection.x = p1.x + (u_a * (p2.x - p1.x));
            out_intersection.y = p1.y + (u_a * (p2.y - p1.y));
            return true;
        }
        
        return false;
    }
}
