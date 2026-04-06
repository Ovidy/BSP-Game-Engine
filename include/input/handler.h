#pragma once

#include <raylib.h>
#include <bsp/camera.h>
#include <render/map_renderer.h>
#include <render/view_renderer.h>

namespace input {
    class Handler {
    public:
        // Declaration only
        Handler();

        void update(bsp::Camera& camera, render::MapRenderer& map_renderer);
    };
}
