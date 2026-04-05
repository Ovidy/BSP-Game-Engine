#include <bsp/data_types.h>

namespace bsp {
    // Segement class implementation
    Segment::Segment(const glm::vec2& start, const glm::vec2& end)
        : start(start), end(end) {}

    const glm::vec2& Segment::get_start() const {
        return start;
    }

    const glm::vec2& Segment::get_end() const {
        return end;
    }

    const glm::vec2 Segment::get_direction() const {
        return end - start;
    }

    // BSPNode class implementation
    BSPNode::BSPNode() : front(nullptr), back(nullptr), partition({{0.0f, 0.0f}, {0.0f, 0.0f}}) {}

    const std::shared_ptr<BSPNode>& BSPNode::get_front() const {
        return front;
    }

    const std::shared_ptr<BSPNode>& BSPNode::get_back() const {
        return back;
    }

    const Segment& BSPNode::get_partition() const {
        return partition;
    }
}
