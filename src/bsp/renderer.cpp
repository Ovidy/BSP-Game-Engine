#include <bsp/renderer.h>

namespace bsp {
    Renderer::Renderer() : camera(glm::vec3(6.0f, CAM_HEIGHT, 7.0f), glm::vec3(0.0f, CAM_HEIGHT, 0.0f), 60.0f) {
        // constructor code here
    }

    Renderer::~Renderer() {
        // destructor code here
    }

    void Renderer::update(const glm::float32_t& dt) {
        camera.pre_update(dt);
        input_handler.update(camera, map_renderer, view_renderer);
        camera.update(dt);
        tree_traverser.update(camera.get_pos_2d());
    }

    void Renderer::render() {
        // drawing
        BeginDrawing();

        // Setup the back buffer for drawing (clear color and depth buffers)
        ClearBackground(BLACK);

        // render 2D and 3D content
        render_3d();
        render_2d();
        
        // end the frame and get ready for the next one  (display frame, poll input, etc...)
        EndDrawing();
    }

    const LevelData& Renderer::get_level_data() const {
        return level_data;
    }

    void Renderer::render_2d() {
        map_renderer.render(tree_traverser, camera.get_pos_2d());
        DrawFPS(10, 10);
    }

    void Renderer::render_3d() {
        BeginMode3D(camera.get_raylib_camera());

        view_renderer.draw(tree_traverser.get_segment_ids_to_render(), map_renderer.is_enabled());

        DrawGrid(32, 1.0f);

        EndMode3D();
    }

    void Renderer::load_level(const std::vector<Segment>& segments) {
        level_data = LevelData(segments);
        tree_builder.load_segments(TreeBuilder::find_best_seed_modern(segments), segments);
        tree_traverser.set_root(tree_builder.get_root());
        map_renderer.load_level_data(level_data, tree_builder);
        view_renderer.load_models(tree_builder.get_segments());
    }
}