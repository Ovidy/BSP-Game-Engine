#pragma once

#include <raylib.h>
#include <bsp/camera.h>
#include <render/map_renderer.h>
#include <render/view_renderer.h>
#include <ecs/entity.h>

namespace engine
{
    class InputHandler
    {
    public:
        // Declaration only
        InputHandler();

        void update(Entity& player_entity, float dt);
    };
}
