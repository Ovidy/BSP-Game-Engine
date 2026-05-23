#pragma once

#include <bsp/data_types.h>

struct SectorComponent {
    bsp::Sector sector;
};

struct SpriteComponent {
    glm::int32_t texture_id;  // The image to draw
    Color tint = WHITE;       // For lighting or damage flashes
};