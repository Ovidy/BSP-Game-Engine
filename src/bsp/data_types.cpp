#include <bsp/data_types.h>

namespace bsp {
    // Segement class implementation
    Segment::Segment(const glm::vec2& start, const glm::vec2& end, const glm::int32_t& texture_id = -1, const glm::int32_t& sector_id = -1)
        : start(start), end(end), texture_id(texture_id), sector_id(sector_id) {}

    const glm::vec2& Segment::get_start() const {
        return start;
    }

    const glm::vec2& Segment::get_end() const {
        return end;
    }

    const glm::vec2 Segment::get_direction() const {
        return end - start;
    }

    const glm::int32_t& Segment::get_texture_id() const {
        return texture_id;
    }

    const glm::int32_t& Segment::get_sector_id() const {
        return sector_id;
    }

    void Segment::set_sector_id(glm::int32_t id) {
        sector_id = id;
    }

    // Plane struct implementation
    float Plane::get_height_at(float target_x, float target_z) const {
        if (normal.y == 0.0f) return anchor_point.y; // Prevent divide-by-zero on sheer cliffs
        
        // Standard Plane Equation: Solved for Y
        return anchor_point.y - ((normal.x * (target_x - anchor_point.x) + normal.z * (target_z - anchor_point.z)) / normal.y);
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

    void Node::set_front(const std::shared_ptr<Node>& input_front) {
        this->front = input_front;
    }

    void Node::set_back(const std::shared_ptr<Node>& input_back) {
        this->back = input_back;
    }

    void Node::set_splitter(const Segment& input_splitter) {
        this->splitter = input_splitter;
    }

    void Node::set_segment_id(const glm::int32_t& id) {
        this->segment_id = id;
    }
}
