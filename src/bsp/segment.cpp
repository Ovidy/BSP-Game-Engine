#include <bsp/segment.h>

bsp::Segment::Segment(const glm::vec2& start, const glm::vec2& end)
    : start(start), end(end) {}

const glm::vec2& bsp::Segment::get_start() const {
    return start;
}

const glm::vec2& bsp::Segment::get_end() const {
    return end;
}
