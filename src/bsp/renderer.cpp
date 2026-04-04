#include <bsp/renderer.h>

bsp::Renderer::Renderer() {
    // constructor code here
}

bsp::Renderer::~Renderer() {
    // destructor code here
}

void bsp::Renderer::render() {
    // drawing
    BeginDrawing();

    // Setup the back buffer for drawing (clear color and depth buffers)
    ClearBackground(BLACK);

    // render 2D and 3D content
    render_2d();
    render_3d();
    
    // end the frame and get ready for the next one  (display frame, poll input, etc...)
    EndDrawing();
}

void bsp::Renderer::render_2d() {
    // 2D rendering code here
}

void bsp::Renderer::render_3d() {
    // 3D rendering code here
}

void bsp::Renderer::load_level(const std::vector<Segment>& segments) {
    level_data = LevelData(segments);
}

void bsp::Renderer::load_level(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments) {
    level_data = LevelData(segments);
}
