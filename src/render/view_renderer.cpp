#include <render/view_renderer.h>

#include <mapbox/earcut.hpp>
#include <array>
#include <cstring> // For memcpy
#include <rlgl.h>

using namespace bsp;
using Point = std::array<float, 2>;

namespace render {

    // Helper structure to temporarily hold mesh data while we batch it
    struct MeshData {
        std::vector<float> vertices;
        std::vector<float> texcoords;
        std::vector<float> normals;
        std::vector<unsigned short> indices;
    };

    ViewRenderer::~ViewRenderer() {
        for (auto& pair : batched_models) {
            UnloadModel(pair.second);
        }
        for (auto& pair : batched_plane_models) {
            UnloadModel(pair.second);
        }
    }

    void ViewRenderer::load_models(const std::vector<Segment>& bsp_segments, const std::vector<Sector>& level_sectors, TextureManager& texture_manager) {
        // Clean up old models
        for (auto& pair : batched_models) UnloadModel(pair.second);
        for (auto& pair : batched_plane_models) UnloadModel(pair.second);

        batched_models.clear();
        batched_plane_models.clear();

        // ==========================================
        // 1. BUILD BATCHED WALL MODELS (Vertical)
        // ==========================================
        std::unordered_map<glm::int32_t, std::vector<Segment>> segments_by_texture;
        for (const auto& seg : bsp_segments) {
            segments_by_texture[seg.get_texture_id()].push_back(seg);
        }

        for (const auto& pair : segments_by_texture) {
            glm::int32_t tex_id = pair.first;
            const auto& grouped_segments = pair.second;

            Mesh mesh = { 0 };
            mesh.triangleCount = grouped_segments.size() * 2;
            mesh.vertexCount = grouped_segments.size() * 4;

            mesh.vertices = (float*)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
            mesh.texcoords = (float*)MemAlloc(mesh.vertexCount * 2 * sizeof(float));
            mesh.normals = (float*)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
            mesh.indices = (unsigned short*)MemAlloc(mesh.triangleCount * 3 * sizeof(unsigned short));

            int v_offset = 0; 
            int i_offset = 0; 

            for (const auto& segment : grouped_segments) {
                glm::vec2 p0 = segment.get_start();
                glm::vec2 p1 = segment.get_end();

                const Sector& parent_sector = level_sectors[segment.get_sector_id()];
                
                // NEW: Get the exact heights at the left (p0) and right (p1) sides of the wall!
                float bottom0 = parent_sector.floor.get_height_at(p0.x, p0.y);
                float top0    = parent_sector.ceiling.get_height_at(p0.x, p0.y);
                float bottom1 = parent_sector.floor.get_height_at(p1.x, p1.y);
                float top1    = parent_sector.ceiling.get_height_at(p1.x, p1.y);

                glm::vec3 delta = glm::vec3(p1.x - p0.x, 0.0f, p1.y - p0.y);
                // Walls are still perfectly vertical, so the horizontal normal is still correct
                glm::vec3 normal = glm::normalize(glm::vec3(-delta.z, 0.0f, delta.x));

                // Calculate UV physical dimensions
                float width = glm::length(delta);
                float h0 = top0 - bottom0; // Height of the left edge
                float h1 = top1 - bottom1; // Height of the right edge

                // Insert Vertices using the dynamic sloped heights
                mesh.vertices[v_offset * 3 + 0] = p0.x; mesh.vertices[v_offset * 3 + 1] = bottom0; mesh.vertices[v_offset * 3 + 2] = p0.y;
                mesh.vertices[v_offset * 3 + 3] = p1.x; mesh.vertices[v_offset * 3 + 4] = bottom1; mesh.vertices[v_offset * 3 + 5] = p1.y;
                mesh.vertices[v_offset * 3 + 6] = p1.x; mesh.vertices[v_offset * 3 + 7] = top1;    mesh.vertices[v_offset * 3 + 8] = p1.y;
                mesh.vertices[v_offset * 3 + 9] = p0.x; mesh.vertices[v_offset * 3 + 10] = top0;   mesh.vertices[v_offset * 3 + 11] = p0.y;

                // Insert Texcoords (UVs mapped dynamically to the slope)
                mesh.texcoords[v_offset * 2 + 0] = 0.0f;  mesh.texcoords[v_offset * 2 + 1] = h0; 
                mesh.texcoords[v_offset * 2 + 2] = width; mesh.texcoords[v_offset * 2 + 3] = h1; 
                mesh.texcoords[v_offset * 2 + 4] = width; mesh.texcoords[v_offset * 2 + 5] = 0.0f;   
                mesh.texcoords[v_offset * 2 + 6] = 0.0f;  mesh.texcoords[v_offset * 2 + 7] = 0.0f;   

                // Insert Normals
                for (int n = 0; n < 4; n++) {
                    mesh.normals[(v_offset + n) * 3 + 0] = normal.x;
                    mesh.normals[(v_offset + n) * 3 + 1] = normal.y;
                    mesh.normals[(v_offset + n) * 3 + 2] = normal.z;
                }

                // Insert Indices
                mesh.indices[i_offset + 0] = v_offset + 0; mesh.indices[i_offset + 1] = v_offset + 1; mesh.indices[i_offset + 2] = v_offset + 2;
                mesh.indices[i_offset + 3] = v_offset + 0; mesh.indices[i_offset + 4] = v_offset + 2; mesh.indices[i_offset + 5] = v_offset + 3;

                v_offset += 4;
                i_offset += 6;
            }

            UploadMesh(&mesh, false);
            Model model = LoadModelFromMesh(mesh);
            model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture = texture_manager.get_texture(tex_id);
            batched_models[tex_id] = model;
        }

        // ==========================================
        // 2. BUILD BATCHED FLOOR & CEILING MODELS
        // ==========================================
        std::unordered_map<glm::int32_t, MeshData> plane_meshes;

        for (const auto& sector : level_sectors) {
            if (sector.walls.empty()) continue;

            std::vector<std::vector<Point>> polygon(1);
            for (const auto& wall : sector.walls) {
                polygon[0].push_back({ wall.get_start().x, wall.get_start().y });
            }

            std::vector<uint16_t> indices = mapbox::earcut<uint16_t>(polygon);

            // --- Floor Generation ---
            glm::int32_t f_tex = sector.floor_texture_id;
            auto& f_mesh = plane_meshes[f_tex];
            unsigned short f_v_offset = f_mesh.vertices.size() / 3;

            for (size_t i = 0; i < polygon[0].size(); ++i) {
                float px = polygon[0][i][0];
                float py = polygon[0][i][1];
                
                // NEW: Ask the plane for the exact height at this vertex!
                float dynamic_y = sector.floor.get_height_at(px, py);

                f_mesh.vertices.push_back(px);
                f_mesh.vertices.push_back(dynamic_y);
                f_mesh.vertices.push_back(py);

                f_mesh.texcoords.push_back(px);
                f_mesh.texcoords.push_back(py);

                // NEW: Use the plane's real normal, so lighting reacts correctly to slopes
                f_mesh.normals.push_back(sector.floor.normal.x);
                f_mesh.normals.push_back(sector.floor.normal.y);
                f_mesh.normals.push_back(sector.floor.normal.z);
            }
            
            for (size_t i = 0; i < indices.size(); i += 3) {
                f_mesh.indices.push_back(f_v_offset + indices[i]);
                f_mesh.indices.push_back(f_v_offset + indices[i + 2]); 
                f_mesh.indices.push_back(f_v_offset + indices[i + 1]);
            }

            // --- Ceiling Generation ---
            glm::int32_t c_tex = sector.ceiling_texture_id;
            auto& c_mesh = plane_meshes[c_tex];
            unsigned short c_v_offset = c_mesh.vertices.size() / 3;

            for (size_t i = 0; i < polygon[0].size(); ++i) {
                float px = polygon[0][i][0];
                float py = polygon[0][i][1];
                
                // NEW: Ask the plane for the exact height!
                float dynamic_y = sector.ceiling.get_height_at(px, py);

                c_mesh.vertices.push_back(px);
                c_mesh.vertices.push_back(dynamic_y);
                c_mesh.vertices.push_back(py);

                c_mesh.texcoords.push_back(px);
                c_mesh.texcoords.push_back(py);

                // NEW: Ceilings point down, so we flip the plane's normal for lighting
                c_mesh.normals.push_back(-sector.ceiling.normal.x);
                c_mesh.normals.push_back(-sector.ceiling.normal.y);
                c_mesh.normals.push_back(-sector.ceiling.normal.z);
            }

            for (size_t i = 0; i < indices.size(); i += 3) {
                c_mesh.indices.push_back(c_v_offset + indices[i]);
                c_mesh.indices.push_back(c_v_offset + indices[i + 1]);
                c_mesh.indices.push_back(c_v_offset + indices[i + 2]);
            }
        }

        // Convert the accumulated MeshData vectors into proper Raylib Models
        for (const auto& pair : plane_meshes) {
            glm::int32_t tex_id = pair.first;
            const auto& data = pair.second;

            if (data.vertices.empty()) continue;

            Mesh mesh = { 0 };
            mesh.vertexCount = data.vertices.size() / 3;
            mesh.triangleCount = data.indices.size() / 3;

            mesh.vertices = (float*)MemAlloc(data.vertices.size() * sizeof(float));
            std::memcpy(mesh.vertices, data.vertices.data(), data.vertices.size() * sizeof(float));

            mesh.texcoords = (float*)MemAlloc(data.texcoords.size() * sizeof(float));
            std::memcpy(mesh.texcoords, data.texcoords.data(), data.texcoords.size() * sizeof(float));

            mesh.normals = (float*)MemAlloc(data.normals.size() * sizeof(float));
            std::memcpy(mesh.normals, data.normals.data(), data.normals.size() * sizeof(float));

            mesh.indices = (unsigned short*)MemAlloc(data.indices.size() * sizeof(unsigned short));
            std::memcpy(mesh.indices, data.indices.data(), data.indices.size() * sizeof(unsigned short));

            UploadMesh(&mesh, false);
            Model model = LoadModelFromMesh(mesh);
            model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture = texture_manager.get_texture(tex_id);
            batched_plane_models[tex_id] = model;
        }
    }

    void ViewRenderer::load_sprites(const std::vector<bsp::Sprite>& level_sprites) {
        this->sprites = level_sprites;
    }

    void ViewRenderer::draw(bool is_map_drawn, const Camera3D& camera, TextureManager& texture_manager) {
        Color screen_tint = is_map_drawn ? DARKGRAY : WHITE;

        // 1. Draw solid geometry first (Walls, Floors, Ceilings)
        for (const auto& pair : batched_models) {
            DrawModel(pair.second, Vector3{ 0.0f, 0.0f, 0.0f }, 1.0f, screen_tint);
        }

        rlDisableBackfaceCulling(); 
        for (const auto& pair : batched_plane_models) {
            DrawModel(pair.second, Vector3{ 0.0f, 0.0f, 0.0f }, 1.0f, screen_tint);
        }
        rlEnableBackfaceCulling();

        // ==========================================
        // 2. SORT AND DRAW SPRITES
        // ==========================================
        if (!sprites.empty()) {
            glm::vec3 cam_pos(camera.position.x, camera.position.y, camera.position.z);

            // Create a temporary list of pointers/indices so we can sort without modifying the original array
            std::vector<std::pair<float, const bsp::Sprite*>> sorted_sprites;
            sorted_sprites.reserve(sprites.size());

            for (const auto& sprite : sprites) {
                // Calculate squared distance (faster than actual distance, perfectly fine for sorting)
                glm::vec3 diff = sprite.position - cam_pos;
                float dist_sq = glm::dot(diff, diff);
                sorted_sprites.push_back({ dist_sq, &sprite });
            }

            // Sort from furthest to closest (Painter's Algorithm)
            std::sort(sorted_sprites.begin(), sorted_sprites.end(), 
                [](const auto& a, const auto& b) {
                    return a.first > b.first; 
                });

            // Draw the sorted sprites
            for (const auto& pair : sorted_sprites) {
                const bsp::Sprite* sprite = pair.second;
                
                // Get the actual texture from the manager
                Texture2D tex = texture_manager.get_texture(sprite->texture_id);
                
                Vector3 raylib_pos = { sprite->position.x, sprite->position.y, sprite->position.z };
                
                // DrawBillboard is Raylib's magic function that automatically calculates 
                // the quad vertices so they perfectly face the camera!
                DrawBillboard(camera, tex, raylib_pos, sprite->scale, sprite->tint);
            }
        }
    }
}
