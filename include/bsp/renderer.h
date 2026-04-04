#pragma once

#include <utils.h>

namespace bsp {
    class Renderer {
    public:
        Renderer();
        ~Renderer();

        void render();
    private:
        void render_2d();
        void render_3d();
    };
}