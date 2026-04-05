#pragma once

#include <glm/glm.hpp>
#include <memory>

namespace bsp {
    class Segment {
    public:
        Segment(const glm::vec2& start, const glm::vec2& end);
        ~Segment() = default;

        const glm::vec2& get_start() const;
        const glm::vec2& get_end() const;
        const glm::vec2 get_direction() const;

    private:
        glm::vec2 start;
        glm::vec2 end;
    };

    class BSPNode {
    public:
        BSPNode();
        ~BSPNode() = default;

        const std::shared_ptr<BSPNode>& get_front() const;
        const std::shared_ptr<BSPNode>& get_back() const;
        const Segment& get_partition() const;
    private:
        std::shared_ptr<BSPNode> front;
        std::shared_ptr<BSPNode> back;
        Segment partition;
    };
}
