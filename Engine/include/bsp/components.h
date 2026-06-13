#pragma once

#include <bsp/data_types.h>

namespace engine {
    struct SectorComponent {
    Sector sector;
    };

    struct SpriteComponent {
    glm::int32_t texture_id;  // The image to draw
    Color tint = WHITE;       // For lighting or damage flashes
    };
}
