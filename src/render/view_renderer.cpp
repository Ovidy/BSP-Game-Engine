#include <render/view_renderer.h>

using namespace bsp;

namespace render {
    ViewRenderer::~ViewRenderer() {
        for (auto& pair : batched_models) {
            UnloadModel(pair.second);
        }
    }

    void ViewRenderer::load_models(const std::vector<Segment>& bsp_segments, TextureManager& texture_manager) {
        // Clean up old models
        for (auto& pair : batched_models) {
            UnloadModel(pair.second);
        }

        batched_models.clear();

        // 1. Group segments by their Texture ID
        std::unordered_map<glm::int32_t, std::vector<Segment>> segments_by_texture;
        for (const auto& seg : bsp_segments) {
            segments_by_texture[seg.get_texture_id()].push_back(seg);
        }

        // 2. Build ONE massive mesh for each texture group
        for (const auto& pair : segments_by_texture) {
            glm::int32_t tex_id = pair.first;
            const auto& grouped_segments = pair.second;

            Mesh mesh = { 0 };
            mesh.triangleCount = grouped_segments.size() * 2;
            mesh.vertexCount = grouped_segments.size() * 4;

            // Allocate memory for the combined mesh
            mesh.vertices = (float*)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
            mesh.texcoords = (float*)MemAlloc(mesh.vertexCount * 2 * sizeof(float));
            mesh.normals = (float*)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
            mesh.indices = (unsigned short*)MemAlloc(mesh.triangleCount * 3 * sizeof(unsigned short));

            int v_offset = 0; // Vertex index offset
            int i_offset = 0; // Array index offset for indices

            for (const auto& segment : grouped_segments) {
                glm::vec2 p0 = segment.get_start();
                glm::vec2 p1 = segment.get_end();
                float bottom = 0.0f, top = 1.0f;

                glm::vec3 delta = glm::vec3(p1.x - p0.x, 0.0f, p1.y - p0.y);
                glm::vec3 normal = glm::normalize(glm::vec3(-delta.z, 0.0f, delta.x));
                float width = glm::length(delta);

                // Insert Vertices
                mesh.vertices[v_offset * 3 + 0] = p0.x; mesh.vertices[v_offset * 3 + 1] = bottom; mesh.vertices[v_offset * 3 + 2] = p0.y;
                mesh.vertices[v_offset * 3 + 3] = p1.x; mesh.vertices[v_offset * 3 + 4] = bottom; mesh.vertices[v_offset * 3 + 5] = p1.y;
                mesh.vertices[v_offset * 3 + 6] = p1.x; mesh.vertices[v_offset * 3 + 7] = top;    mesh.vertices[v_offset * 3 + 8] = p1.y;
                mesh.vertices[v_offset * 3 + 9] = p0.x; mesh.vertices[v_offset * 3 + 10] = top;   mesh.vertices[v_offset * 3 + 11] = p0.y;

                // Insert Texcoords
                mesh.texcoords[v_offset * 2 + 0] = 0.0f;  mesh.texcoords[v_offset * 2 + 1] = bottom;
                mesh.texcoords[v_offset * 2 + 2] = width; mesh.texcoords[v_offset * 2 + 3] = bottom;
                mesh.texcoords[v_offset * 2 + 4] = width; mesh.texcoords[v_offset * 2 + 5] = top;
                mesh.texcoords[v_offset * 2 + 6] = 0.0f;  mesh.texcoords[v_offset * 2 + 7] = top;

                // Insert Normals
                for (int n = 0; n < 4; n++) {
                    mesh.normals[(v_offset + n) * 3 + 0] = normal.x;
                    mesh.normals[(v_offset + n) * 3 + 1] = normal.y;
                    mesh.normals[(v_offset + n) * 3 + 2] = normal.z;
                }

                // Insert Indices (Offset by the current vertex count!)
                mesh.indices[i_offset + 0] = v_offset + 0; mesh.indices[i_offset + 1] = v_offset + 1; mesh.indices[i_offset + 2] = v_offset + 2;
                mesh.indices[i_offset + 3] = v_offset + 0; mesh.indices[i_offset + 4] = v_offset + 2; mesh.indices[i_offset + 5] = v_offset + 3;

                // Advance offsets for the next segment
                v_offset += 4;
                i_offset += 6;
            }

            UploadMesh(&mesh, false);
            Model model = LoadModelFromMesh(mesh);
            
            // Apply the texture for this specific batch
            model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture = texture_manager.get_texture(tex_id);
            
            batched_models[tex_id] = model;
        }
    }

    void ViewRenderer::draw(bool is_map_drawn) {
        Color screen_tint = is_map_drawn ? DARKGRAY : WHITE;

        // Instead of drawing 100 individual walls, we just draw the few batched chunks!
        for (const auto& pair : batched_models) {
            DrawModel(pair.second, Vector3{ 0.0f, 0.0f, 0.0f }, 1.0f, screen_tint);
        }
    }

    Model ViewRenderer::generate_wall_model(const Segment& segment, TextureManager& texture_manager) {
        Mesh mesh = get_quad_mesh(segment);
        Model model = LoadModelFromMesh(mesh);
        
        // Get the texture from the handler using the segment's ID
        Texture2D texture = texture_manager.get_texture(segment.get_texture_id());

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
}
