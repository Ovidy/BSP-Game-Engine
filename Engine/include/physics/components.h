#pragma once

#include <glm/glm.hpp>
#include <physics/collider.h>

namespace engine
{
    struct TransformComponent
    {
        glm::vec3 position = {0.0f, 0.0f, 0.0f};
        glm::vec3 rotation = {0.0f, 0.0f, 0.0f};
        glm::vec3 scale = {1.0f, 1.0f, 1.0f};


        constexpr glm::vec2 get_bsp_position() { return {position.x, position.z}; }
    };

    struct VelocityComponent
    {
        glm::vec3 velocity = {0.0f, 0.0f, 0.0f};
    };

    struct ColliderComponent
    {
        Collider collider;
    };
}
