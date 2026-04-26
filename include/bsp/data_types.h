#pragma once

#include <glm/glm.hpp>
#include <raylib.h>
#include <memory>

namespace bsp {
    class Segment {
    public:
        Segment(const glm::vec2& start, const glm::vec2& end, const glm::int32_t& texture_id, const glm::int32_t& sector_id);
        ~Segment() = default;

        const glm::vec2& get_start() const;
        const glm::vec2& get_end() const;
        const glm::vec2 get_direction() const;

        const glm::int32_t& get_texture_id() const;
        const glm::int32_t& get_sector_id() const;

        void set_sector_id(glm::int32_t id);

    private:
        glm::vec2 start;
        glm::vec2 end;
        glm::int32_t texture_id;
        glm::int32_t sector_id;
    };

    // Defines a sloped surface
    struct Plane {
        glm::vec3 anchor_point; // A physical point on the surface
        glm::vec3 normal;       // Which way the surface faces (Up = 0, 1, 0)
        
        // Helper to calculate the exact Y height at any given X/Z location!
        float get_height_at(float target_x, float target_z) const;
    };

    struct Sector {
        glm::int32_t id;
        Plane floor;
        Plane ceiling;
        glm::int32_t floor_texture_id;
        glm::int32_t ceiling_texture_id;
        
        // The sector owns the walls that make up its perimeter
        std::vector<Segment> walls; 
    };

    class Node {
    public:
        Node();
        ~Node() = default;

        const std::shared_ptr<Node>& get_front() const;
        const std::shared_ptr<Node>& get_back() const;
        const Segment& get_splitter() const;
        const glm::int32_t get_segment_id() const;

        void set_front(const std::shared_ptr<Node>& front);
        void set_back(const std::shared_ptr<Node>& back);
        void set_splitter(const Segment& splitter);
        void set_segment_id(const glm::int32_t& id);
    private:
        std::shared_ptr<Node> front;
        std::shared_ptr<Node> back;
        Segment splitter;
        glm::int32_t segment_id;
    };

    struct Sprite {
        glm::vec3 position;       // X, Y (height), Z in the 3D world
        glm::int32_t texture_id;  // The image to draw
        float scale = 1.0f;       // Size multiplier
        Color tint = WHITE;       // For lighting or damage flashes
    };
}
