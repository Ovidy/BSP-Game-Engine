#pragma once
#include <glm/glm.hpp>
#include <vector>
#include <bsp/data_types.h>

namespace engine
{
    struct VerticalBounds
    {
        float floor_height = -INFINITY;
        float ceiling_height = INFINITY;
    };

    class Collider
    {
    public:
        // Notice we pass 'pos' by reference (&) so the collider can physically push it!
        static void resolve_wall_collisions(
            glm::vec2 &pos, float player_radius,
            float feet_y, float head_y,
            const std::vector<Sector> &level_sectors);

        static VerticalBounds get_sector_bounds(
            const glm::vec2 &player_pos_2d, float feet_y, float head_y,
            const std::vector<Sector> &level_sectors);

        static glm::vec2 closest_point_on_segment(const glm::vec2 &p, const glm::vec2 &a, const glm::vec2 &b);
        static bool is_point_in_sector(const glm::vec2 &pt, const Sector &sector);
    };
}
