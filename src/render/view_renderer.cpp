#include <render/view_renderer.h>

#include <mapbox/earcut.hpp>
#include <array>

using namespace bsp;
using Point = std::array<float, 2>;

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
                
                // Get the heights dynamically from the sector
                float bottom = segment.get_floor();
                float top = segment.get_ceiling();

                glm::vec3 delta = glm::vec3(p1.x - p0.x, 0.0f, p1.y - p0.y);
                glm::vec3 normal = glm::normalize(glm::vec3(-delta.z, 0.0f, delta.x));
                
                // Calculate physical dimensions for UV tiling
                float width = glm::length(delta);
                float height = top - bottom; 

                // Insert Vertices using dynamic 'bottom' and 'top'
                mesh.vertices[v_offset * 3 + 0] = p0.x; mesh.vertices[v_offset * 3 + 1] = bottom; mesh.vertices[v_offset * 3 + 2] = p0.y;
                mesh.vertices[v_offset * 3 + 3] = p1.x; mesh.vertices[v_offset * 3 + 4] = bottom; mesh.vertices[v_offset * 3 + 5] = p1.y;
                mesh.vertices[v_offset * 3 + 6] = p1.x; mesh.vertices[v_offset * 3 + 7] = top;    mesh.vertices[v_offset * 3 + 8] = p1.y;
                mesh.vertices[v_offset * 3 + 9] = p0.x; mesh.vertices[v_offset * 3 + 10] = top;   mesh.vertices[v_offset * 3 + 11] = p0.y;

                // Insert Texcoords (UVs)
                // We set Y to 'height' so the texture repeats cleanly top-to-bottom
                mesh.texcoords[v_offset * 2 + 0] = 0.0f;  mesh.texcoords[v_offset * 2 + 1] = height; // Bottom-Left
                mesh.texcoords[v_offset * 2 + 2] = width; mesh.texcoords[v_offset * 2 + 3] = height; // Bottom-Right
                mesh.texcoords[v_offset * 2 + 4] = width; mesh.texcoords[v_offset * 2 + 5] = 0.0f;   // Top-Right
                mesh.texcoords[v_offset * 2 + 6] = 0.0f;  mesh.texcoords[v_offset * 2 + 7] = 0.0f;   // Top-Left

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
}
