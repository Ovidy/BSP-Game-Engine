#pragma once

#include <raylib.h>
#include <bsp/camera.h>
#include <render/map_renderer.h>
#include <render/view_renderer.h>

class InputHandler {
public:
    // Declaration only
    InputHandler();

    void update(bsp::Camera& camera, MapRenderer& map_renderer, const float& dt);
};
