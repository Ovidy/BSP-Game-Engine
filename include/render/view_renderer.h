#pragma once

#include <raylib.h>
#include <vector>
#include <unordered_map>
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
        void draw(bool is_map_drawn);

    private:
        std::unordered_map<glm::int32_t, Model> batched_models;
    };
}
