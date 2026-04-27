#pragma once

#include <raylib.h>
#include <unordered_map>
#include <vector>
#include <string>
#include <random>
#include <glm/glm.hpp>

namespace render {
    class TextureManager {
    public:
        TextureManager() = default;
        ~TextureManager();

        // Bind a file path to an ID
        void load_texture(glm::int32_t id, const std::string& file_path);

        // Retrieve a texture. Generates and stores a random one if ID is -1 or missing
        Texture2D get_texture(glm::int32_t id);

        // Clear VRAM manually if needed
        void clear();

    private:
        std::unordered_map<glm::int32_t, Texture2D> loaded_textures;
        std::vector<Texture2D> generated_textures; 

        Texture2D generate_random_texture();
        Color get_random_color() const;
    };
}
