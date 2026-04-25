#include <physics/collider.h>
#include <algorithm> // For std::max/min
#include <cmath>     // For std::sqrt

namespace physics {

    CollisionResult Collider::detect_wall_collision(
        const glm::vec2& intended_pos, float player_radius, 
        float feet_y, float head_y, 
        const std::vector<bsp::Sector>& level_sectors) 
    {
        CollisionResult result;

        for (const auto& sector : level_sectors) {
            // Height check: Are we flying over or walking under this wall?
            if (feet_y >= sector.ceiling_height) continue; 
            if (head_y <= sector.floor_height) continue;

            // ... (Keep the rest of your wall collision logic exactly the same) ...
            for (const auto& wall : sector.walls) {
                glm::vec2 closest = closest_point_on_segment(intended_pos, wall.get_start(), wall.get_end());
                glm::vec2 diff = intended_pos - closest;
                float dist_sq = glm::dot(diff, diff);
                float radius_sq = player_radius * player_radius;

                if (dist_sq < radius_sq) {
                    result.is_colliding = true;
                    if (dist_sq > 0.0f) {
                        float dist = std::sqrt(dist_sq);
                        float penetration_depth = player_radius - dist;
                        glm::vec2 push_dir = diff / dist; 
                        result.push_vector += push_dir * penetration_depth;
                    } else {
                        glm::vec2 wall_dir = glm::normalize(wall.get_end() - wall.get_start());
                        glm::vec2 normal(-wall_dir.y, wall_dir.x);
                        result.push_vector += normal * player_radius;
                    }
                }
            }
        }
        return result;
    }

    VerticalBounds Collider::get_sector_bounds(const glm::vec2& player_pos_2d, float feet_y, float head_y, const std::vector<bsp::Sector>& level_sectors) {
        VerticalBounds best_bounds;
        
        for (const auto& sector : level_sectors) {
            // If our 2D coordinates are inside this room's walls
            if (is_point_in_sector(player_pos_2d, sector)) {
                
                // Find the highest floor that is strictly below (or equal to) our feet
                // (+0.1f buffers against floating point precision when perfectly grounded)
                if (sector.floor_height <= feet_y + 0.1f && sector.floor_height > best_bounds.floor_height) {
                    best_bounds.floor_height = sector.floor_height;
                }

                // Find the lowest ceiling that is strictly above our head
                if (sector.ceiling_height >= head_y - 0.1f && sector.ceiling_height < best_bounds.ceiling_height) {
                    best_bounds.ceiling_height = sector.ceiling_height;
                }
            }
        }
        
        return best_bounds;
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
