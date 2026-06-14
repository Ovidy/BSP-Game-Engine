#pragma once

#include <bsp/data_types.h>

namespace engine
{
    struct SectorComponent
    {
        Sector sector;
    };

    struct SpriteComponent
    {
        glm::int32_t texture_id; // The image to draw
        Color tint = WHITE;      // For lighting or damage flashes
    };


    // TODO: We should really move the game specific
    // components out of the engine, doesn't really make sense considering ECS idom
    // tho it will require us to create a behaviour script component which isn't bad but might be
    // overkill

    struct CharacterControllerComponent
    {
        float radius = 0.25f;
        float height = 1.8f;
        float speed = 5.0f;
        float jump_force = 5.0f;
        bool is_grounded = false;
        bool noclip_enabled = false;
        float sensitivity = 9.0f;
    };
}
