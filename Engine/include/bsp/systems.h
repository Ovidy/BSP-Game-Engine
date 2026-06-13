#pragma once

#include <entt/entt.hpp>
#include <bsp/data_types.h>

namespace engine
{
    void character_controller_update(entt::registry& registry, float dt, const std::vector<Sector>& level_sectors);
}
