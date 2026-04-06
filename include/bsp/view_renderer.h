#pragma once

#include <raylib.h>
#include <vector>
#include <glm/glm.hpp>
#include <bsp/data_types.h>

namespace bsp {
    class ViewRenderer {
    public:
        ViewRenderer() = default;
        ~ViewRenderer(); // Required to safely unload Raylib models/textures from VRAM

        // Pass the generated BSP tree segments here once during level load
        void load_models(const std::vector<Segment>& bsp_segments);

        // Call this every frame in render_3d. Screen tint is calculated on the fly.
        void draw(const std::vector<glm::int32_t>& segment_ids_to_draw, bool is_map_drawn);

    private:
        std::vector<Model> wall_models;
        std::vector<Texture2D> textures;

        Model generate_wall_model(const Segment& segment);
        Mesh get_quad_mesh(const Segment& segment) const;
        Texture2D get_random_texture();
        Color get_random_color() const;
    };
}
