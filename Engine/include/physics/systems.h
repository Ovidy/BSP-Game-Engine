#pragma once

#include <bsp/data_types.h>

namespace engine
{
    class Scene;
    void character_controller_update(Scene* scene, float dt, const std::vector<Sector>& level_sectors);
}
