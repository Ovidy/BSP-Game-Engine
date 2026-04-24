#include <render/texture_manager.h>

namespace render {

    TextureManager::~TextureManager() {
        clear();
    }

    void TextureManager::clear() {
        for (auto& pair : loaded_textures) {
            UnloadTexture(pair.second);
        }
        for (auto& tex : generated_textures) {
            UnloadTexture(tex);
        }
        loaded_textures.clear();
        generated_textures.clear();
    }

    void TextureManager::load_texture(glm::int32_t id, const std::string& file_path) {
        // If ID already exists, unload the old one first to prevent memory leaks
        if (loaded_textures.find(id) != loaded_textures.end()) {
            UnloadTexture(loaded_textures[id]);
        }
        loaded_textures[id] = LoadTexture(file_path.c_str());
    }

    Texture2D TextureManager::get_texture(glm::int32_t id) {
        // If ID is valid and exists in our map, return it
        if (id >= 0 && loaded_textures.find(id) != loaded_textures.end()) {
            return loaded_textures[id];
        }

        // Otherwise (ID is -1 or missing), generate a random one
        Texture2D random_tex = generate_random_texture();
        generated_textures.push_back(random_tex);
        return random_tex;
    }

    Texture2D TextureManager::generate_random_texture() {
        Image image = GenImageChecked(10, 10, 1, 1, get_random_color(), WHITE);
        Texture2D texture = LoadTextureFromImage(image);
        UnloadImage(image);
        return texture;
    }

    Color TextureManager::get_random_color() const {
        // 1. Setup a static, hardware-seeded Mersenne Twister.
        // Making it 'static' ensures it only initializes once and keeps its state.
        static std::random_device rd;
        static std::mt19937 gen(rd());

        // 2. Define our distribution ranges
        // Hue controls the actual color (0 to 360 degrees on the color wheel)
        std::uniform_real_distribution<float> hue_dist(0.0f, 360.0f);
        
        // Keep Saturation (color intensity) and Value (brightness) high to avoid mud!
        std::uniform_real_distribution<float> sat_dist(0.6f, 1.0f); // 60% to 100% saturation
        std::uniform_real_distribution<float> val_dist(0.8f, 1.0f); // 80% to 100% brightness

        // 3. Generate the random HSV values
        float h = hue_dist(gen);
        float s = sat_dist(gen);
        float v = val_dist(gen);

        // 4. Let Raylib handle the complex math of converting HSV back to an RGB Color struct
        return ColorFromHSV(h, s, v);
    }
}
