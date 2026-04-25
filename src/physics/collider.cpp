#include <physics/collider.h>
#include <algorithm> // For std::max/min
#include <cmath>     // For std::sqrt

namespace physics {

    CollisionResult Collider::detect_wall_collision(
        const glm::vec2& intended_pos, float player_radius, 
        float player_y, float player_height, 
        const std::vector<bsp::Sector>& level_sectors) 
    {
        CollisionResult result;
        float player_top = player_y + player_height;
        float player_bottom = player_y;

        for (const auto& sector : level_sectors) {
            
            // Height check (Allows flying over/under walls)
            if (player_bottom >= sector.ceiling_height) continue; 
            if (player_top <= sector.floor_height) continue;

            for (const auto& wall : sector.walls) {
                // Find exactly where on the wall we are hitting
                glm::vec2 closest = closest_point_on_segment(intended_pos, wall.get_start(), wall.get_end());
                
                glm::vec2 diff = intended_pos - closest;
                float dist_sq = glm::dot(diff, diff);
                float radius_sq = player_radius * player_radius;

                // If the distance is smaller than our radius, we have penetrated the wall!
                if (dist_sq < radius_sq) {
                    result.is_colliding = true;
                    
                    if (dist_sq > 0.0f) {
                        float dist = std::sqrt(dist_sq);
                        float penetration_depth = player_radius - dist;
                        
                        // Push away from the wall
                        glm::vec2 push_dir = diff / dist; 
                        result.push_vector += push_dir * penetration_depth;
                    } else {
                        // Edge case: Player's exact dead-center is ON the wall.
                        // Push them out using the wall's normal.
                        glm::vec2 wall_dir = glm::normalize(wall.get_end() - wall.get_start());
                        glm::vec2 normal(-wall_dir.y, wall_dir.x);
                        result.push_vector += normal * player_radius;
                    }
                }
            }
        }
        return result;
    }

    VerticalBounds Collider::get_sector_bounds(const glm::vec2& player_pos_2d, const std::vector<bsp::Sector>& level_sectors) {
        VerticalBounds bounds;
        
        // Find which sector the player is currently standing in
        for (const auto& sector : level_sectors) {
            if (is_point_in_sector(player_pos_2d, sector)) {
                bounds.floor_height = sector.floor_height;
                bounds.ceiling_height = sector.ceiling_height;
                return bounds; // Found the room!
            }
        }
        
        // If the player steps out of bounds, return default safe values
        return bounds; 
    }

    glm::vec2 Collider::closest_point_on_segment(const glm::vec2& p, const glm::vec2& a, const glm::vec2& b) {
        glm::vec2 ab = b - a;
        float dot_ab = glm::dot(ab, ab);
        
        if (dot_ab == 0.0f) return a; // Wall is just a single point (shouldn't happen, but safe)
        
        // Project player position onto the line to find the closest parameter 't'
        float t = glm::dot(p - a, ab) / dot_ab;
        
        // Clamp 't' so we don't check points beyond the physical ends of the wall
        t = std::max(0.0f, std::min(1.0f, t)); 
        
        return a + t * ab;
    }

    bool Collider::is_point_in_sector(const glm::vec2& pt, const bsp::Sector& sector) {
        bool is_inside = false;
        
        for (const auto& wall : sector.walls) {
            // Check if the ray crosses this wall segment
            if (((wall.get_start().y > pt.y) != (wall.get_end().y > pt.y)) &&
                (pt.x < (wall.get_end().x - wall.get_start().x) * (pt.y - wall.get_start().y) / (wall.get_end().y - wall.get_start().y) + wall.get_start().x)) {
                is_inside = !is_inside;
            }
        }
        
        return is_inside;
    }
}
