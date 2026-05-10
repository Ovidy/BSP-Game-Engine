#include <physics/collider.h>
#include <algorithm> // For std::max/min
#include <cmath>     // For std::sqrt

namespace physics {

    CollisionResult Collider::detect_wall_collision(
        const glm::vec2& pos,const glm::vec2& vel ,float player_radius,        
        float feet_y, float head_y, 
        const std::vector<bsp::Sector>& level_sectors) 
    {
        CollisionResult result;

        glm::vec2 intented_x = pos + glm::vec2(vel.x, 0.0f);
        glm::vec2 intented_y = pos + glm::vec2(0.0, vel.y);

        for (const auto& sector : level_sectors) {
            // Height check: Are we flying over or walking under this wall?
            if (feet_y >= sector.ceiling_height) continue; 
            if (head_y <= sector.floor_height) continue;

            if (result.total_collision()) return result;

            for (const auto& wall : sector.walls) {
                if (!result.x)
                    result.x = check_axis(intented_x, player_radius, wall);
                if (!result.y)
                    result.y = check_axis(intented_y, player_radius, wall);
            }
        }
        return result;
    }

    VerticalBounds Collider::get_sector_bounds(const glm::vec2& player_pos_2d, float feet_y, float head_y, const std::vector<bsp::Sector>& level_sectors) {
        VerticalBounds best_bounds;
        
        for (const auto& sector : level_sectors) {
            // If our 2D coordinates are inside this room's footprint
            if (is_point_in_sector(player_pos_2d, sector)) {
                
                // --- CHECK 1: The Sector's Floor ---
                // Does it act as ground below our feet?
                if (sector.floor_height <= feet_y + 0.1f && sector.floor_height > best_bounds.floor_height) {
                    best_bounds.floor_height = sector.floor_height;
                }
                // Does it act as a ceiling above our head? (Standing underneath a floating block)
                if (sector.floor_height >= head_y - 0.1f && sector.floor_height < best_bounds.ceiling_height) {
                    best_bounds.ceiling_height = sector.floor_height;
                }

                // --- CHECK 2: The Sector's Ceiling ---
                // Does it act as ground below our feet? (Standing ON TOP of a block)
                if (sector.ceiling_height <= feet_y + 0.1f && sector.ceiling_height > best_bounds.floor_height) {
                    best_bounds.floor_height = sector.ceiling_height;
                }
                // Does it act as a normal ceiling above our head?
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

    bool Collider::check_axis(const glm::vec2& pos, float player_radius, const bsp::Segment& wall) {

        glm::vec2 closest = closest_point_on_segment(pos, wall.get_start(), wall.get_end());
        glm::vec2 diff = pos - closest;
        float dist_sq = glm::dot(diff, diff);
        float radius_sq = player_radius * player_radius;
        return dist_sq < radius_sq;
    }
}
