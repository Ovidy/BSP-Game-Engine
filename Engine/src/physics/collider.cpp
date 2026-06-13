#include <physics/collider.h>
#include <algorithm> // For std::max/min
#include <cmath>     // For std::sqrt

namespace engine
{
// The EPSILON buffer prevents floating-point ghost wall collision
    const float EPSILON = 0.01f;

    void Collider::resolve_wall_collisions(
        glm::vec2 &pos, float player_radius,
        float feet_y, float head_y,
        const std::vector<Sector> &level_sectors)
    {
        // We run the resolution twice (2 passes) to perfectly resolve corners.
        // If Wall A pushes you into Wall B, the second pass pushes you out of Wall B!
        for (int pass = 0; pass < 2; ++pass) {
            for (const auto &sector : level_sectors)
            {
                if (feet_y >= sector.ceiling_height - EPSILON) continue;
                if (head_y <= sector.floor_height + EPSILON) continue;

                for (const auto &wall : sector.walls)
                {
                    glm::vec2 closest = closest_point_on_segment(pos, wall.get_start(), wall.get_end());
                    glm::vec2 diff = pos - closest;
                    
                    float dist_sq = glm::dot(diff, diff);
                    float radius_sq = player_radius * player_radius;

                    // If the distance to the wall is less than our radius, we are penetrating!
                    if (dist_sq < radius_sq && dist_sq > 0.00001f) {
                        float dist = std::sqrt(dist_sq);
                        float penetration_depth = player_radius - dist;
                        
                        // Calculate the push direction (away from the wall)
                        glm::vec2 push_dir = diff / dist; 
                        
                        // Instantly push the player's position out of the wall
                        pos += push_dir * penetration_depth;
                    }
                }
            }
        }
    }

    VerticalBounds Collider::get_sector_bounds(const glm::vec2 &player_pos_2d, float feet_y, float head_y, const std::vector<Sector> &level_sectors)
    {
        VerticalBounds best_bounds;

        for (const auto &sector : level_sectors)
        {
            if (!is_point_in_sector(player_pos_2d, sector))
                continue;

            // --- 1. The Sector's Floor ---
            if (sector.floor_height < head_y && sector.floor_height > best_bounds.floor_height)
            {
                best_bounds.floor_height = sector.floor_height;
            }
            if (sector.floor_height > feet_y && sector.floor_height < best_bounds.ceiling_height)
            {
                best_bounds.ceiling_height = sector.floor_height;
            }

            // --- 2. The Sector's Ceiling ---
            if (sector.ceiling_height < head_y && sector.ceiling_height > best_bounds.floor_height)
            {
                best_bounds.floor_height = sector.ceiling_height;
            }
            if (sector.ceiling_height > feet_y && sector.ceiling_height < best_bounds.ceiling_height)
            {
                best_bounds.ceiling_height = sector.ceiling_height;
            }
        }

        return best_bounds;
    }

    glm::vec2 Collider::closest_point_on_segment(const glm::vec2 &p, const glm::vec2 &a, const glm::vec2 &b)
    {
        glm::vec2 ab = b - a;
        float dot_ab = glm::dot(ab, ab);

        if (dot_ab == 0.0f)
            return a;

        float t = glm::dot(p - a, ab) / dot_ab;
        t = std::max(0.0f, std::min(1.0f, t));

        return a + t * ab;
    }

    bool Collider::is_point_in_sector(const glm::vec2 &pt, const Sector &sector)
    {
        bool is_inside = false;

        for (const auto &wall : sector.walls)
        {
            if (((wall.get_start().y > pt.y) != (wall.get_end().y > pt.y)) &&
                (pt.x < (wall.get_end().x - wall.get_start().x) * (pt.y - wall.get_start().y) / (wall.get_end().y - wall.get_start().y) + wall.get_start().x))
            {
                is_inside = !is_inside;
            }
        }

        return is_inside;
    }
}
