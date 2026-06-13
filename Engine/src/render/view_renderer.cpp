#include <render/view_renderer.h>

#include <mapbox/earcut.hpp>
#include <array>
#include <cstring> // For memcpy
#include <rlgl.h>

#include <bsp/components.h>
#include <physics/components.h>

namespace engine
{
    using Point = std::array<float, 2>;

    // Helper structure to temporarily hold mesh data while we batch it
    struct MeshData
    {
        std::vector<float> vertices;
        std::vector<float> texcoords;
        std::vector<float> normals;
        std::vector<unsigned short> indices;
    };

    ViewRenderer::~ViewRenderer()
    {
    }

    void ViewRenderer::clear()
    {
        for (auto &pair : batched_models)
        {
            UnloadModel(pair.second);
        }
        for (auto &pair : batched_plane_models)
        {
            UnloadModel(pair.second);
        }
    }

    void ViewRenderer::load_models(const std::vector<Segment> &bsp_segments, const std::vector<Sector> &level_sectors, TextureManager &texture_manager)
    {
        // Clean up old models
        for (auto &pair : batched_models)
            UnloadModel(pair.second);
        for (auto &pair : batched_plane_models)
            UnloadModel(pair.second);

        batched_models.clear();
        batched_plane_models.clear();

        // ==========================================
        // 1. BUILD BATCHED WALL MODELS (Vertical)
        // ==========================================
        std::unordered_map<glm::int32_t, std::vector<Segment>> segments_by_texture;
        for (const auto &seg : bsp_segments)
        {
            segments_by_texture[seg.get_texture_id()].push_back(seg);
        }

        for (const auto &pair : segments_by_texture)
        {
            glm::int32_t tex_id = pair.first;
            const auto &grouped_segments = pair.second;

            Mesh mesh = {0};
            mesh.triangleCount = grouped_segments.size() * 2;
            mesh.vertexCount = grouped_segments.size() * 4;

            // Allocate memory for the combined mesh
            mesh.vertices = (float *)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
            mesh.texcoords = (float *)MemAlloc(mesh.vertexCount * 2 * sizeof(float));
            mesh.normals = (float *)MemAlloc(mesh.vertexCount * 3 * sizeof(float));
            mesh.indices = (unsigned short *)MemAlloc(mesh.triangleCount * 3 * sizeof(unsigned short));

            int v_offset = 0; // Vertex index offset
            int i_offset = 0; // Array index offset for indices

            for (const auto &segment : grouped_segments)
            {
                glm::vec2 p0 = segment.get_start();
                glm::vec2 p1 = segment.get_end();

                // Look up the parent sector using the segment's sector_id
                const Sector &parent_sector = level_sectors[segment.get_sector_id()];

                // Get the heights dynamically from the sector
                float bottom = parent_sector.floor_height;
                float top = parent_sector.ceiling_height;

                glm::vec3 delta = glm::vec3(p1.x - p0.x, 0.0f, p1.y - p0.y);
                glm::vec3 normal = glm::normalize(glm::vec3(-delta.z, 0.0f, delta.x));

                // Calculate physical dimensions for UV tiling
                float width = glm::length(delta);
                float height = top - bottom;

                // Insert Vertices using dynamic 'bottom' and 'top'
                mesh.vertices[v_offset * 3 + 0] = p0.x;
                mesh.vertices[v_offset * 3 + 1] = bottom;
                mesh.vertices[v_offset * 3 + 2] = p0.y;
                mesh.vertices[v_offset * 3 + 3] = p1.x;
                mesh.vertices[v_offset * 3 + 4] = bottom;
                mesh.vertices[v_offset * 3 + 5] = p1.y;
                mesh.vertices[v_offset * 3 + 6] = p1.x;
                mesh.vertices[v_offset * 3 + 7] = top;
                mesh.vertices[v_offset * 3 + 8] = p1.y;
                mesh.vertices[v_offset * 3 + 9] = p0.x;
                mesh.vertices[v_offset * 3 + 10] = top;
                mesh.vertices[v_offset * 3 + 11] = p0.y;

                // Insert Texcoords (UVs)
                mesh.texcoords[v_offset * 2 + 0] = 0.0f;
                mesh.texcoords[v_offset * 2 + 1] = height; // Bottom-Left
                mesh.texcoords[v_offset * 2 + 2] = width;
                mesh.texcoords[v_offset * 2 + 3] = height; // Bottom-Right
                mesh.texcoords[v_offset * 2 + 4] = width;
                mesh.texcoords[v_offset * 2 + 5] = 0.0f; // Top-Right
                mesh.texcoords[v_offset * 2 + 6] = 0.0f;
                mesh.texcoords[v_offset * 2 + 7] = 0.0f; // Top-Left

                // Insert Normals
                for (int n = 0; n < 4; n++)
                {
                    mesh.normals[(v_offset + n) * 3 + 0] = normal.x;
                    mesh.normals[(v_offset + n) * 3 + 1] = normal.y;
                    mesh.normals[(v_offset + n) * 3 + 2] = normal.z;
                }

                // Insert Indices
                mesh.indices[i_offset + 0] = v_offset + 0;
                mesh.indices[i_offset + 1] = v_offset + 1;
                mesh.indices[i_offset + 2] = v_offset + 2;
                mesh.indices[i_offset + 3] = v_offset + 0;
                mesh.indices[i_offset + 4] = v_offset + 2;
                mesh.indices[i_offset + 5] = v_offset + 3;

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

        for (const auto &sector : level_sectors)
        {
            if (sector.walls.empty())
                continue;

            // Prepare polygon for Earcut
            std::vector<std::vector<Point>> polygon(1);
            for (const auto &wall : sector.walls)
            {
                polygon[0].push_back({wall.get_start().x, wall.get_start().y});
            }

            // Run Earcut Triangulation
            std::vector<uint16_t> indices = mapbox::earcut<uint16_t>(polygon);

            // --- Floor Generation ---
            glm::int32_t f_tex = sector.floor_texture_id;
            auto &f_mesh = plane_meshes[f_tex];
            unsigned short f_v_offset = f_mesh.vertices.size() / 3;

            for (size_t i = 0; i < polygon[0].size(); ++i)
            {
                float px = polygon[0][i][0];
                float py = polygon[0][i][1];

                f_mesh.vertices.push_back(px);
                f_mesh.vertices.push_back(sector.floor_height);
                f_mesh.vertices.push_back(py);

                f_mesh.texcoords.push_back(px);
                f_mesh.texcoords.push_back(py);

                f_mesh.normals.push_back(0.0f);
                f_mesh.normals.push_back(1.0f); // Pointing Up
                f_mesh.normals.push_back(0.0f);
            }

            for (size_t i = 0; i < indices.size(); i += 3)
            {
                // Floors point UP. We reverse Earcut's default winding so they are visible from above.
                f_mesh.indices.push_back(f_v_offset + indices[i]);
                f_mesh.indices.push_back(f_v_offset + indices[i + 2]);
                f_mesh.indices.push_back(f_v_offset + indices[i + 1]);
            }

            // --- Ceiling Generation ---
            glm::int32_t c_tex = sector.ceiling_texture_id;
            auto &c_mesh = plane_meshes[c_tex];
            unsigned short c_v_offset = c_mesh.vertices.size() / 3;

            for (size_t i = 0; i < polygon[0].size(); ++i)
            {
                float px = polygon[0][i][0];
                float py = polygon[0][i][1];

                c_mesh.vertices.push_back(px);
                c_mesh.vertices.push_back(sector.ceiling_height);
                c_mesh.vertices.push_back(py);

                c_mesh.texcoords.push_back(px);
                c_mesh.texcoords.push_back(py);

                c_mesh.normals.push_back(0.0f);
                c_mesh.normals.push_back(-1.0f); // Pointing Down
                c_mesh.normals.push_back(0.0f);
            }

            for (size_t i = 0; i < indices.size(); i += 3)
            {
                // Ceilings point DOWN. Default winding makes them visible from below.
                c_mesh.indices.push_back(c_v_offset + indices[i]);
                c_mesh.indices.push_back(c_v_offset + indices[i + 1]);
                c_mesh.indices.push_back(c_v_offset + indices[i + 2]);
            }
        }

        // Convert the accumulated MeshData vectors into proper Raylib Models
        for (const auto &pair : plane_meshes)
        {
            glm::int32_t tex_id = pair.first;
            const auto &data = pair.second;

            if (data.vertices.empty())
                continue;

            Mesh mesh = {0};
            mesh.vertexCount = data.vertices.size() / 3;
            mesh.triangleCount = data.indices.size() / 3;

            mesh.vertices = (float *)MemAlloc(data.vertices.size() * sizeof(float));
            std::memcpy(mesh.vertices, data.vertices.data(), data.vertices.size() * sizeof(float));

            mesh.texcoords = (float *)MemAlloc(data.texcoords.size() * sizeof(float));
            std::memcpy(mesh.texcoords, data.texcoords.data(), data.texcoords.size() * sizeof(float));

            mesh.normals = (float *)MemAlloc(data.normals.size() * sizeof(float));
            std::memcpy(mesh.normals, data.normals.data(), data.normals.size() * sizeof(float));

            mesh.indices = (unsigned short *)MemAlloc(data.indices.size() * sizeof(unsigned short));
            std::memcpy(mesh.indices, data.indices.data(), data.indices.size() * sizeof(unsigned short));

            UploadMesh(&mesh, false);
            Model model = LoadModelFromMesh(mesh);
            model.materials[0].maps[MATERIAL_MAP_DIFFUSE].texture = texture_manager.get_texture(tex_id);
            batched_plane_models[tex_id] = model;
        }
    }

    void ViewRenderer::draw(bool is_map_drawn, const Camera3D &camera, TextureManager &texture_manager, entt::registry &registry)
    {
        Color screen_tint = is_map_drawn ? DARKGRAY : WHITE;

        // 1. Draw solid geometry first (Walls, Floors, Ceilings)
        for (const auto &pair : batched_models)
        {
            DrawModel(pair.second, Vector3{0.0f, 0.0f, 0.0f}, 1.0f, screen_tint);
        }

        rlDisableBackfaceCulling();
        for (const auto &pair : batched_plane_models)
        {
            DrawModel(pair.second, Vector3{0.0f, 0.0f, 0.0f}, 1.0f, screen_tint);
        }
        rlEnableBackfaceCulling();

        // ==========================================
        // 2. SORT AND DRAW ECS SPRITES
        // ==========================================
        glm::vec3 cam_pos(camera.position.x, camera.position.y, camera.position.z);

        // We still need to sort, so we create a temporary struct to hold the sorting data
        struct SortableSprite
        {
            float distance_sq;
            const TransformComponent *transform;
            const SpriteComponent *sprite;
        };

        std::vector<SortableSprite> sorted_sprites;

        // Query EnTT for all entities with Transforms and Sprites
        auto view = registry.view<const TransformComponent, const SpriteComponent>();

        // Reserve space to avoid reallocation (optional but good for performance)
        sorted_sprites.reserve(view.size_hint());

        for (auto entity : view)
        {
            const auto &transform = view.get<TransformComponent>(entity);
            const auto &sprite_comp = view.get<SpriteComponent>(entity);

            // Calculate squared distance to camera
            glm::vec3 diff = transform.position - cam_pos;
            float dist_sq = glm::dot(diff, diff);

            sorted_sprites.push_back({dist_sq, &transform, &sprite_comp});
        }

        // Sort from furthest to closest (Painter's Algorithm)
        std::sort(sorted_sprites.begin(), sorted_sprites.end(),
                  [](const SortableSprite &a, const SortableSprite &b)
                  {
                      return a.distance_sq > b.distance_sq;
                  });

        // Draw the sorted ECS sprites
        for (const auto &sorted : sorted_sprites)
        {
            Texture2D tex = texture_manager.get_texture(sorted.sprite->texture_id);

            Vector3 raylib_pos = {
                sorted.transform->position.x,
                sorted.transform->position.y,
                sorted.transform->position.z};

            // Use the Transform's position, but the Sprite's scale and tint
            DrawBillboard(camera, tex, raylib_pos, sorted.transform->scale.x, sorted.sprite->tint);
        }
    }
}
