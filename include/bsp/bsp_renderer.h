#pragma once

#include <utils.h>

class BSPRenderer {
    public:
        BSPRenderer();
        ~BSPRenderer();

        void render();
    private:
        void render_2d();
        void render_3d();
}