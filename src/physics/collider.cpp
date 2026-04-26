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
            // NEW: Calculate the exact floor and ceiling height at the player's INTENDED 2D position!
            // (Note: intended_pos.y represents the 3D Z-axis here)
            float dynamic_floor_y = sector.floor.get_height_at(intended_pos.x, intended_pos.y);
            float dynamic_ceiling_y = sector.ceiling.get_height_at(intended_pos.x, intended_pos.y);

            // Height check: Are we flying over or walking under this wall?
            if (feet_y >= dynamic_ceiling_y) continue; 
            if (head_y <= dynamic_floor_y) continue;

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
            if (is_point_in_sector(player_pos_2d, sector)) {
                
                // NEW: Calculate the exact floor and ceiling height at the player's CURRENT 2D position!
                float dynamic_floor_y = sector.floor.get_height_at(player_pos_2d.x, player_pos_2d.y);
                float dynamic_ceiling_y = sector.ceiling.get_height_at(player_pos_2d.x, player_pos_2d.y);

                // --- CHECK 1: The Sector's Floor Plane ---
                // Does it act as ground below our feet?
                if (dynamic_floor_y <= feet_y + 0.1f && dynamic_floor_y > best_bounds.floor_height) {
                    best_bounds.floor_height = dynamic_floor_y;
                }
                // Does it act as a ceiling above our head? (Standing underneath a sloped overlapping sector)
                if (dynamic_floor_y >= head_y - 0.1f && dynamic_floor_y < best_bounds.ceiling_height) {
                    best_bounds.ceiling_height = dynamic_floor_y;
                }

                // --- CHECK 2: The Sector's Ceiling Plane ---
                // Does it act as ground below our feet? (Standing on top of a sloped overlapping sector)
                if (dynamic_ceiling_y <= feet_y + 0.1f && dynamic_ceiling_y > best_bounds.floor_height) {
                    best_bounds.floor_height = dynamic_ceiling_y;
                }
                // Does it act as a normal ceiling above our head?
                if (dynamic_ceiling_y >= head_y - 0.1f && dynamic_ceiling_y < best_bounds.ceiling_height) {
                    best_bounds.ceiling_height = dynamic_ceiling_y;
                }
            }
        }
        
        return best_bounds;
    }

    glm::vec2 Collider::closest_point_on_segment(const glm::vec2& p, const glm::vec2& a, const glm::vec2& b) {
        // ... (Remains exactly the same) ...
        glm::vec2 ab = b - a;
        float dot_ab = glm::dot(ab, ab);
        
        if (dot_ab == 0.0f) return a; 
        
        float t = glm::dot(p - a, ab) / dot_ab;
        t = std::max(0.0f, std::min(1.0f, t)); 
        
        return a + t * ab;
    }

    bool Collider::is_point_in_sector(const glm::vec2& pt, const bsp::Sector& sector) {
        // ... (Remains exactly the same) ...
        bool is_inside = false;
        
        for (const auto& wall : sector.walls) {
            if (((wall.get_start().y > pt.y) != (wall.get_end().y > pt.y)) &&
                (pt.x < (wall.get_end().x - wall.get_start().x) * (pt.y - wall.get_start().y) / (wall.get_end().y - wall.get_start().y) + wall.get_start().x)) {
                is_inside = !is_inside;
            }
        }
        
        return is_inside;
    }
}
