#pragma once

#include <glm/glm.hpp>
#include <memory>

namespace bsp {
    struct Sector {
        float floor_height = 0.0f;
        float ceiling_height = 1.0f;
    };

    class Segment {
    public:
        Segment(const glm::vec2& start, const glm::vec2& end, const glm::int32_t& texture_id, const Sector& sector);
        ~Segment() = default;

        const glm::vec2& get_start() const;
        const glm::vec2& get_end() const;
        const glm::vec2 get_direction() const;

        const glm::int32_t& get_texture_id() const;

        const Sector& get_sector() const;
        float get_floor() const;
        float get_ceiling() const;

    private:
        glm::vec2 start;
        glm::vec2 end;
        glm::int32_t texture_id;
        Sector sector;
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
}
