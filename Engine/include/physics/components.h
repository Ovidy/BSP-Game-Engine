#pragma once

#include <glm/glm.hpp>
#include <physics/collider.h>

namespace physics {
    struct TransformComponent {
        glm::vec3 position = {0.0f, 0.0f, 0.0f};
        glm::vec3 rotation = {0.0f, 0.0f, 0.0f};
        glm::vec3 scale    = {1.0f, 1.0f, 1.0f};
    };

    struct VelocityComponent {
        glm::vec3 velocity = {0.0f, 0.0f, 0.0f};
    };

    struct ColliderComponent {
        Collider collider;
    };
}