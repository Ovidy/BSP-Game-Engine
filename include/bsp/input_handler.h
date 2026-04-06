#pragma once

#include <raylib.h>
#include <bsp/camera.h>
#include <bsp/map_renderer.h>
#include <bsp/view_renderer.h>

namespace bsp {
    class InputHandler {
    public:
        // Declaration only
        InputHandler();

        void update(Camera& camera, MapRenderer& map_renderer, ViewRenderer& view_renderer);
    };
}
