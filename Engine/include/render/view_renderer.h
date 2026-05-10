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
        // Manual Memory unloading
        // Only required if the object isn't used for the entire program lifetime
        void clear();

        // Pass the generated BSP tree segments here once during level load
        void load_models(const std::vector<bsp::Segment>& bsp_segments, const std::vector<bsp::Sector>& level_sectors, TextureManager& texture_manager);

        // Pass the world sprites here during level load
        void load_sprites(const std::vector<bsp::Sprite>& level_sprites);

        // Call this every frame in render_3d. Screen tint is calculated on the fly.
        void draw(bool is_map_drawn, const Camera3D& camera, TextureManager& texture_manager);

    private:
        std::unordered_map<glm::int32_t, Model> batched_models;       // For vertical walls
        std::unordered_map<glm::int32_t, Model> batched_plane_models; // For horizontal floors/ceilings    
    
        std::vector<bsp::Sprite> sprites;  // For sprite rendering
    };
}
