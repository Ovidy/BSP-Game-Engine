#pragma once

#include <raylib.h>
#include <bsp/camera.h>
#include <render/map_renderer.h>
#include <render/view_renderer.h>

namespace engine {
    class InputHandler {
    public:
    // Declaration only
    InputHandler();

    void update(Camera& camera, MapRenderer& map_renderer, const float& dt);
    };
}
