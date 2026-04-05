#include <bsp/tree_builder.h>

namespace bsp {
    TreeBuilder::TreeBuilder() : root_node(std::make_shared<Node>()), segment_id(0) {}

    void TreeBuilder::load_segments(const std::vector<Segment>& input_segments) {
        build_tree(root_node, input_segments);
    }

    void TreeBuilder::load_segments(const std::vector<std::pair<glm::vec2, glm::vec2>>& input_segments) {
        std::vector<Segment> segment_objects;
        segment_objects.reserve(input_segments.size());

        for (const auto& pair : input_segments) {
            segment_objects.emplace_back(pair.first, pair.second);
        }

        build_tree(root_node, segment_objects);
    }

    std::shared_ptr<Node> TreeBuilder::get_root() const {
        return root_node;
    }

    const std::vector<Segment>& TreeBuilder::get_segments() const {
        return segments;
    }

    void TreeBuilder::add_segment_to_node(std::shared_ptr<Node> node, const Segment& segment) {
        segments.push_back(segment);
        node->set_segment_id(segment_id++);
    }

    std::pair<std::vector<Segment>, std::vector<Segment>> TreeBuilder::split_space(std::shared_ptr<Node> node, const std::vector<Segment>& input_segments) {
        const Segment& splitter = input_segments[0]; // For simplicity, we use the first segment as the partitioning plane

        node->set_splitter(splitter);

        std::vector<Segment> front_segments;
        std::vector<Segment> back_segments;

        for (size_t i = 1; i < input_segments.size(); ++i) {
            const Segment& segment = input_segments[i];
            glm::vec2 dir_splitter = splitter.get_direction();
            glm::vec2 dir_segment = segment.get_direction();

            glm::float32_t numinator = bsp::cross(segment.get_start() - splitter.get_start(), dir_splitter);
            glm::float32_t denominator = bsp::cross(dir_splitter, dir_segment);

            bool denominator_zero = std::abs(denominator) < EPSILON;
            bool numinator_zero = std::abs(numinator) < EPSILON;

            if (denominator_zero && numinator_zero) {
                front_segments.push_back(segment);
            } else if (!denominator_zero) {
                glm::float32_t t = numinator / denominator;

                if (t > 0.0f && t < 1.0f) {
                    glm::vec2 intersection_point = segment.get_start() + t * dir_segment;

                    Segment front_part(segment.get_start(), intersection_point);
                    Segment back_part(intersection_point, segment.get_end());

                    if (numinator > 0) {
                        std::swap(front_part, back_part);
                    }

                    front_segments.push_back(front_part);
                    back_segments.push_back(back_part);
                } else {
                    if (numinator < 0 || (numinator_zero && denominator > 0)) {
                        front_segments.push_back(segment);
                    } else {
                        back_segments.push_back(segment);
                    }
                }
            } else {
                if (numinator < 0 || (numinator_zero && denominator > 0)) {
                    front_segments.push_back(segment);
                } else {
                    back_segments.push_back(segment);
                }
            }
        }
        
        add_segment_to_node(node, splitter);

        return {front_segments, back_segments};
    }

    void TreeBuilder::build_tree(std::shared_ptr<Node> node, const std::vector<Segment>& input_segments) {
        if (input_segments.empty()) {
            return; // Base case: no segments to partition
        }

        auto partition_segments = split_space(node, input_segments);

        if (!partition_segments.first.empty()) {
            node->set_front(std::make_shared<Node>()); // Create a new node for the front space
            build_tree(node->get_front(), partition_segments.first); // Recursively build the front node
        }

        if (!partition_segments.second.empty()) {
            node->set_back(std::make_shared<Node>()); // Create a new node for the back space
            build_tree(node->get_back(), partition_segments.second); // Recursively build the back node
        }
    }
}