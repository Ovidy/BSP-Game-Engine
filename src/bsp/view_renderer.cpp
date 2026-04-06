#include <bsp/view_renderer.h>

namespace bsp {
    
    ViewRenderer::~ViewRenderer() {
        // We must manually free Raylib memory when this class is destroyed
        for (auto& model : wall_models) {
            UnloadModel(model);
        }
        for (auto& texture : textures) {
            UnloadTexture(texture);
        }
    }

    void ViewRenderer::load_models(const std::vector<Segment>& bsp_segments) {
        // Clear previous level data if loading a new level
        for (auto& model : wall_models) UnloadModel(model);
        for (auto& texture : textures) UnloadTexture(texture);
        wall_models.clear();
        textures.clear();

        wall_models.reserve(bsp_segments.size());

        for (const auto& seg : bsp_segments) {
            wall_models.push_back(generate_wall_model(seg));
        }
    }

    void ViewRenderer::draw(const std::vector<glm::int32_t>& segment_ids_to_draw, bool is_map_drawn) {
        // Determine the tint strictly during the draw call, no state variables needed!
        Color screen_tint = is_map_drawn ? DARKGRAY : WHITE;

        for (glm::int32_t id : segment_ids_to_draw) {
            if (id >= 0 && id < wall_models.size()) {
                DrawModel(wall_models[id], Vector3{ 0.0f, 0.0f, 0.0f }, 1.0f, screen_tint);
            }
        }
    }

    Model ViewRenderer::generate_wall_model(const Segment& segment) {
        Mesh mesh = get_quad_mesh(segment);
        Model model = LoadModelFromMesh(mesh);
        
        Texture2D texture = get_random_texture();
        textures.push_back(texture); // Save it so we can Unload it later

        model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture = texture;
        return model;
    }

    Mesh ViewRenderer::get_quad_mesh(const Segment& segment) const {
        Mesh mesh = { 0 };
        mesh.triangleCount = 2;
        mesh.vertexCount = 4;

        // In Raylib, you MUST allocate mesh arrays using MemAlloc
        mesh.vertices = (float *)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
        mesh.texcoords = (float *)MemAlloc(mesh.vertexCount * 2 * sizeof(float));
        mesh.normals = (float *)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
        mesh.indices = (unsigned short *)MemAlloc(mesh.triangleCount * 3 * sizeof(unsigned short));

        glm::vec2 p0 = segment.get_start();
        glm::vec2 p1 = segment.get_end();
        float bottom = 0.0f;
        float top = 1.0f;

        glm::vec3 delta = glm::vec3(p1.x - p0.x, 0.0f, p1.y - p0.y);
        glm::vec3 normal = glm::normalize(glm::vec3(-delta.z, 0.0f, delta.x));
        float width = glm::length(delta);

        // 1. Vertices (x, y, z) - Note: Raylib's Y is up
        // v0 (bottom left)
        mesh.vertices[0] = p0.x; mesh.vertices[1] = bottom; mesh.vertices[2] = p0.y;
        // v1 (bottom right)
        mesh.vertices[3] = p1.x; mesh.vertices[4] = bottom; mesh.vertices[5] = p1.y;
        // v2 (top right)
        mesh.vertices[6] = p1.x; mesh.vertices[7] = top;    mesh.vertices[8] = p1.y;
        // v3 (top left)
        mesh.vertices[9] = p0.x; mesh.vertices[10] = top;   mesh.vertices[11] = p0.y;

        // 2. Texcoords (u, v)
        mesh.texcoords[0] = 0.0f;  mesh.texcoords[1] = bottom;
        mesh.texcoords[2] = width; mesh.texcoords[3] = bottom;
        mesh.texcoords[4] = width; mesh.texcoords[5] = top;
        mesh.texcoords[6] = 0.0f;  mesh.texcoords[7] = top;

        // 3. Normals
        for (int i = 0; i < 4; i++) {
            mesh.normals[i * 3 + 0] = normal.x;
            mesh.normals[i * 3 + 1] = normal.y;
            mesh.normals[i * 3 + 2] = normal.z;
        }

        // 4. Indices (2 Triangles)
        mesh.indices[0] = 0; mesh.indices[1] = 1; mesh.indices[2] = 2;
        mesh.indices[3] = 0; mesh.indices[4] = 2; mesh.indices[5] = 3;

        UploadMesh(&mesh, false);
        return mesh;
    }

    Color ViewRenderer::get_random_color() const {
        return Color{ 
            (unsigned char)GetRandomValue(50, 255), 
            (unsigned char)GetRandomValue(50, 255), 
            (unsigned char)GetRandomValue(50, 255), 
            255 
        };
    }

    Texture2D ViewRenderer::get_random_texture() {
        Image image = GenImageChecked(10, 10, 1, 1, get_random_color(), WHITE);
        Texture2D texture = LoadTextureFromImage(image);
        UnloadImage(image);
        return texture;
    }
}
