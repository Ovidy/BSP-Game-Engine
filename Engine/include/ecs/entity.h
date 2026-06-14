#pragma once
#include <entt/entt.hpp>
#include "ecs/scene.h"

namespace engine {
    // TODO: Add proper assert functions to make class safe


    // Wrapper class to simplify EnTT's API
    class Entity {
    public:
        Entity(entt::entity id, Scene* scene) : m_id(id), scene(scene) {};
        Entity() : m_id(entt::null), scene(nullptr) {};

        template <typename T>
        bool has_component() {
            return registry().any_of<T>(m_id);
        }

        template <typename T, typename ...Args>
        T& add_component(Args&& ...args) {
            assert(!has_component<T>() && "Trying to add component twice");
            return registry().emplace<T>(m_id, std::forward<Args>(args)...);
        }

        template <typename T>
        T& get_component() {
            assert(has_component<T>() && "Trying to retrieve non existant component");
            return registry().get<T>(m_id);
        }

        template<typename T>
        void remove_component() {
            assert(has_component<T>() && "Trying to remove non existant component");
            registry().remove<T>(m_id);
        }

        constexpr entt::entity id() const {return m_id;}

        //operator entt::entity() {
        //    return m_id;
        //}

        operator bool() {
            return m_id != entt::null;
        }

        bool operator==(const Entity& rhs) {
            return m_id == rhs.id();
        }

    private:

        constexpr entt::registry& registry() {
            return scene->get_registry();
        }

        entt::entity m_id;
        Scene* scene;
    };

}
