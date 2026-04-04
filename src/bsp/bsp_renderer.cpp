#include <bsp_renderer.h>

BSPRenderer::BSPRenderer() {
    // constructor code here
}

BSPRenderer::~BSPRenderer() {
    // destructor code here
}

void BSPRenderer::render() {
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

void BSPRenderer::render_2d() {
    // 2D rendering code here
}

void BSPRenderer::render_3d() {
    // 3D rendering code here
}
