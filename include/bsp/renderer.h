#pragma once

#include <bsp/map_renderer.h>
#include <bsp/tree_builder.h>
#include <bsp/tree_traverser.h>
#include <raylib.h>

namespace bsp {
    class Renderer {
    public:
        Renderer();
        ~Renderer();

        void update();
        void render();

        void load_level(const std::vector<Segment>& segments);
        void load_level(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments);

        const LevelData& get_level_data() const;
    private:
        void render_2d();
        void render_3d();

        LevelData level_data;
        MapRenderer map_renderer;
        TreeBuilder tree_builder;
        TreeTraverser tree_traverser;
    };
}
