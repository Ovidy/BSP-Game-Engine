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
    Node::Node() : front(nullptr), back(nullptr), splitter({{0.0f, 0.0f}, {0.0f, 0.0f}}) {}

    const std::shared_ptr<Node>& Node::get_front() const {
        return front;
    }

    const std::shared_ptr<Node>& Node::get_back() const {
        return back;
    }

    const Segment& Node::get_splitter() const {
        return splitter;
    }

    const glm::int32_t Node::get_segment_id() const {
        return segment_id;
    }

    void Node::set_front(const std::shared_ptr<Node>& front) {
        this->front = front;
    }

    void Node::set_back(const std::shared_ptr<Node>& back) {
        this->back = back;
    }

    void Node::set_splitter(const Segment& splitter) {
        this->splitter = splitter;
    }

    void Node::set_segment_id(const glm::int32_t& id) {
        this->segment_id = id;
    }
}
