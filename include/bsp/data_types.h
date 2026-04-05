#pragma once

#include <glm/glm.hpp>

namespace bsp {
    class Segment {
    public:
        Segment(const glm::vec2& start, const glm::vec2& end);

        const glm::vec2& get_start() const;
        const glm::vec2& get_end() const;
    private:
        glm::vec2 start;
        glm::vec2 end;
    };

    
}
