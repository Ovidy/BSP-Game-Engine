#include <bsp/renderer.h>

namespace bsp {
    Renderer::Renderer() {
        // constructor code here
    }

    Renderer::~Renderer() {
        // destructor code here
    }

    void Renderer::render() {
        // drawing
        BeginDrawing();

        // Setup the back buffer for drawing (clear color and depth buffers)
        ClearBackground(BLACK);

        // render 2D and 3D content
        render_2d();
        render_3d();

        tree_traverser.update();
        
        // end the frame and get ready for the next one  (display frame, poll input, etc...)
        EndDrawing();
    }

    const LevelData& Renderer::get_level_data() const {
        return level_data;
    }

    void Renderer::render_2d() {
        // 2D rendering code here
        map_renderer.render(tree_traverser);
    }

    void Renderer::render_3d() {
        // 3D rendering code here
    }

    void Renderer::load_level(const std::vector<Segment>& segments) {
        level_data = LevelData(segments);
        tree_builder.build(segments);
        tree_traverser.set_root(tree_builder.get_root());
        map_renderer.load_level_data(level_data, tree_builder);
    }

    void Renderer::load_level(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments) {
        level_data = LevelData(segments);
        map_renderer.load_level_data(level_data, tree_builder);
        tree_builder.build(segments);
    }
}