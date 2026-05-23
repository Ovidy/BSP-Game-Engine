#include <render/renderer_3d.h>

using namespace bsp;

namespace render {
    Renderer3D::Renderer3D() {
        // constructor code here
    }

    Renderer3D::~Renderer3D() {
        // destructor code here
    }

    void Renderer3D::render(const Camera3D& raylib_camera, const glm::vec2& camera_position, const std::vector<glm::int32_t>& current_segment_ids) {
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

    void Renderer3D::render_2d(const Camera3D& raylib_camera, const glm::vec2& camera_position, const std::vector<glm::int32_t>& current_segment_ids) {
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

        draw_controls_overlay();
    }

    void Renderer3D::draw_controls_overlay() {
        // ==========================================
        // DRAW CONTROLS OVERLAY
        // ==========================================
        int font_size = 20;
        int small_font = 16;
        int padding = 20;
        int line_spacing = 22;

        // Position it on the top right side of the screen
        int x_pos = GetScreenWidth() - 260; 
        int y_pos = padding;

        // Draw a subtle semi-transparent background box so the text is readable against bright walls
        DrawRectangle(x_pos - 10, y_pos - 10, 260, 260, Color{ 0, 0, 0, 150 });

        // Draw the Title
        DrawText("CONTROLS:", x_pos, y_pos, font_size, RAYWHITE);
        y_pos += line_spacing + 5;

        // Draw the list of keys
        DrawText("W/A/S/D - Move", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;
        
        DrawText("SPACE - Jump", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;
        
        DrawText("L-SHIFT - Fly Down", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;
        
        DrawText("TAB - Toggle Mouse Lock", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;

        DrawText("MOUSE - Look Around", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;

        DrawText("UP/DOWN/LEFT/RIGHT - Look Around", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;

        DrawText("M - Toggle Map", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;

        DrawText("C - Toggle Creative Mode", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;

        DrawText("F - Free View Mode", x_pos, y_pos, small_font, LIGHTGRAY);
        y_pos += line_spacing;

        DrawText("F11 - Fullscreen", x_pos, y_pos, small_font, LIGHTGRAY);
    }

    void Renderer3D::render_3d(const Camera3D& raylib_camera, const std::vector<glm::int32_t>& current_segment_ids) {
        BeginMode3D(raylib_camera);

        // Just tell the view renderer to draw its batched models
        view_renderer.draw(map_renderer.is_enabled(), raylib_camera, texture_manager);

        DrawGrid(32, 1.0f);

        EndMode3D();
    }

    void Renderer3D::load_segments(const std::vector<bsp::Segment>& input_segments, const std::vector<bsp::Segment>& input_tree_segments, const std::vector<bsp::Sector>& level_sectors, const glm::vec2& window_size) {
        segments = input_segments;
        tree_segments = input_tree_segments;
        
        // MapRenderer only needs the 2D lines
        map_renderer.load_level_data(segments, tree_segments, window_size);
        
        // ViewRenderer needs the 3D walls AND the sectors to generate triangulated floors
        view_renderer.load_models(tree_segments, level_sectors, texture_manager);
    }

    void Renderer3D::load_texture(glm::int32_t id, const std::string& file_path) {
        texture_manager.load_texture(id, file_path);
    }

    void Renderer3D::load_sprites(const std::vector<bsp::Sprite>& level_sprites) {
        view_renderer.load_sprites(level_sprites);
    }

    MapRenderer& Renderer3D::get_map_renderer() {
        return map_renderer;
    }
}
