#include <physics/systems.h>
#include <entt/entt.hpp>
#include <ecs/entity.h>
#include <physics/collider.h>
#include <physics/components.h>
#include <bsp/components.h>

#define GRAVITY 9.81f // Define gravity constant

namespace engine
{
void character_controller_update(Scene* scene, float dt, const std::vector<Sector>& level_sectors)
    {
        // Find every entity that can move and collide
        auto view = scene->get_registry().view<TransformComponent, VelocityComponent, CharacterControllerComponent>();

        for (auto entity : view)
        {
            Entity tmp(entity, scene);
            auto &transform  = tmp.get_component<TransformComponent>();
            auto &velocity   = tmp.get_component<VelocityComponent>();
            auto &controller = tmp.get_component<CharacterControllerComponent>();

            // Noclip bypass
            if (controller.noclip_enabled)
            {
                transform.position += velocity.velocity * dt;
                continue;
            }

            // Apply Gravity
            if (!controller.is_grounded) {
                velocity.velocity.y -= GRAVITY * dt; 
            }

            // --- 1. APPLY HORIZONTAL MOVEMENT FIRST ---
            transform.position.x += velocity.velocity.x * dt;
            transform.position.z += velocity.velocity.z * dt;

            // --- 2. RESOLVE HORIZONTAL COLLISIONS (The Push-Out) ---
            float head_y = transform.position.y + 0.2f;
            float feet_y = transform.position.y - controller.height;
            
            // Get the updated 2D position after our horizontal movement
            glm::vec2 current_pos_2d{transform.position.x, transform.position.z};

            // This function will seamlessly push current_pos_2d away from any walls
            engine::Collider::resolve_wall_collisions(
                current_pos_2d, controller.radius, feet_y, head_y, level_sectors
            );

            // Save the corrected position back to the transform
            transform.position.x = current_pos_2d.x;
            transform.position.z = current_pos_2d.y;

            // --- 3. VERTICAL COLLISION & SNAPPING ---
            // Check bounds at our new, wall-corrected position
            engine::VerticalBounds bounds = engine::Collider::get_sector_bounds(current_pos_2d, feet_y, head_y, level_sectors);

            float next_y = transform.position.y + velocity.velocity.y * dt;
            float next_feet_y = next_y - controller.height;
            float next_head_y = next_y + 0.2f;

            // Floor Snapping
            if (next_feet_y <= bounds.floor_height)
            {
                transform.position.y = bounds.floor_height + controller.height;
                velocity.velocity.y = 0.0f;
                controller.is_grounded = true;
            }
            else
            {
                transform.position.y = next_y;
                controller.is_grounded = false;
            }

            // Ceiling Snapping
            if (next_head_y >= bounds.ceiling_height)
            {
                transform.position.y = bounds.ceiling_height - 0.2f;
                velocity.velocity.y = 0.0f;
            }
        }
    }
}
