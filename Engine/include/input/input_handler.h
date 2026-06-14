#pragma once

#include <raylib.h>
#include <bsp/camera.h>
#include <render/map_renderer.h>
#include <render/view_renderer.h>

namespace engine
{
    class InputHandler
    {
    public:
        // Declaration only
        InputHandler();

        void update(entt::registry& registry, entt::entity player_entity, float dt);
    };
}
