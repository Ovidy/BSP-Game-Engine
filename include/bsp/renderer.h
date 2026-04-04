#pragma once

#include <bsp/level_data.h>
#include <raylib.h>

namespace bsp {
    class Renderer {
    public:
        Renderer();
        ~Renderer();

        void render();

        void load_level(const std::vector<Segment>& segments);
        void load_level(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments);

    private:
        void render_2d();
        void render_3d();

        LevelData level_data;
    };
}
