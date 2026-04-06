#pragma once

#include <bsp/map_renderer.h>
#include <bsp/tree_builder.h>
#include <bsp/tree_traverser.h>
#include <bsp/camera.h>
#include <bsp/input_handler.h>
#include <raylib.h>

namespace bsp {
    class Renderer {
    public:
        Renderer();
        ~Renderer();

        void update(const glm::float32_t& dt);
        void render();

        void load_level(const std::vector<Segment>& segments);

        const LevelData& get_level_data() const;
    private:
        void render_2d();
        void render_3d();

        LevelData level_data;
        MapRenderer map_renderer;
        TreeBuilder tree_builder;
        TreeTraverser tree_traverser;
        Camera camera;
        InputHandler input_handler;
    };
}
