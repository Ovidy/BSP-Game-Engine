#include <render/handler.h>

using namespace bsp;

namespace render {
    Handler::Handler() {
        // constructor code here
    }

    Handler::~Handler() {
        // destructor code here
    }

    void Handler::render(const Camera3D& raylib_camera, const glm::vec2& camera_position, const std::vector<glm::int32_t>& current_segment_ids) {
        // drawing
        BeginDrawing();

        // Setup the back buffer for drawing (clear color and depth buffers)
        ClearBackground(BLACK);

        // render 2D and 3D content
        render_3d(raylib_camera, current_segment_ids);
        render_2d(raylib_camera, camera_position, current_segment_ids);
        
        // end the frame and get ready for the next one  (display frame, poll input, etc...)
        EndDrawing();
    }

    void Handler::render_2d(const Camera3D& raylib_camera, const glm::vec2& camera_position, const std::vector<glm::int32_t>& current_segment_ids) {
        // Calculate the 2D forward direction on the XZ plane
        glm::vec2 forward(
            raylib_camera.target.x - raylib_camera.position.x,
            raylib_camera.target.z - raylib_camera.position.z
        );
        
        // Normalize it so it doesn't scale weirdly if you change camera target distance
        forward = glm::normalize(forward);

        // Pass the forward vector into the map renderer
        map_renderer.render(current_segment_ids, camera_position, forward);
        DrawFPS(10, 10);
    }

    void Handler::render_3d(const Camera3D& raylib_camera, const std::vector<glm::int32_t>& current_segment_ids) {
        BeginMode3D(raylib_camera);

        // Just tell the view renderer to draw its batched models
        view_renderer.draw(map_renderer.is_enabled(), raylib_camera, texture_manager);

        DrawGrid(32, 1.0f);

        EndMode3D();
    }

    void Handler::load_segments(const std::vector<bsp::Segment>& input_segments, const std::vector<bsp::Segment>& input_tree_segments, const std::vector<bsp::Sector>& level_sectors) {
        segments = input_segments;
        tree_segments = input_tree_segments;
        
        // MapRenderer only needs the 2D lines
        map_renderer.load_level_data(segments, tree_segments);
        
        // ViewRenderer needs the 3D walls AND the sectors to generate triangulated floors
        view_renderer.load_models(tree_segments, level_sectors, texture_manager);
    }

    void Handler::load_texture(glm::int32_t id, const std::string& file_path) {
        texture_manager.load_texture(id, file_path);
    }

    void Handler::load_sprites(const std::vector<bsp::Sprite>& level_sprites) {
        view_renderer.load_sprites(level_sprites);
    }

    MapRenderer& Handler::get_map_renderer() {
        return map_renderer;
    }
}
