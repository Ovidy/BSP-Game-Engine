#pragma once

#include <raylib.h>
#include <vector>
#include <glm/glm.hpp>
#include <bsp/data_types.h>
#include <render/texture_manager.h>

namespace render {
    class ViewRenderer {
    public:
        ViewRenderer() = default;
        ~ViewRenderer(); // Required to safely unload Raylib models/textures from VRAM

        // Pass the generated BSP tree segments here once during level load
        void load_models(const std::vector<bsp::Segment>& bsp_segments, TextureManager& texture_manager);

        // Call this every frame in render_3d. Screen tint is calculated on the fly.
        void draw(const std::vector<glm::int32_t>& segment_ids_to_draw, bool is_map_drawn);

    private:
        std::vector<Model> wall_models;

        Model generate_wall_model(const bsp::Segment& segment, TextureManager& texture_manager);
        Mesh get_quad_mesh(const bsp::Segment& segment) const;
        Color get_random_color() const;
    };
}
