#include <bsp/tree_builder.h>

namespace bsp {
    TreeBuilder::TreeBuilder() : root_node(std::make_shared<Node>()), segment_id(0) {}

    void TreeBuilder::build(const std::vector<Segment>& segments) {
        build_tree(root_node, segments);
    }

    void TreeBuilder::build(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments) {
        std::vector<Segment> segment_objects;
        segment_objects.reserve(segments.size());

        for (const auto& pair : segments) {
            segment_objects.emplace_back(pair.first, pair.second);
        }

        build_tree(root_node, segment_objects);
    }

    std::shared_ptr<Node> TreeBuilder::get_root() const {
        return root_node;
    }

    std::pair<std::vector<Segment>, std::vector<Segment>> TreeBuilder::split_space(std::shared_ptr<Node> node, const std::vector<Segment>& segments) {
        const Segment& splitter = segments[0]; // For simplicity, we use the first segment as the partitioning plane

        node->set_splitter(splitter);

        std::vector<Segment> front_segments;
        std::vector<Segment> back_segments;

        for (auto segment : segments) {
            // Determine which side of the splitter the segment lies on
            glm::vec2 start_to_splitter = segment.get_start() - splitter.get_start();
            glm::vec2 end_to_splitter = segment.get_end() - splitter.get_start();

            float start_side = glm::dot(start_to_splitter, glm::vec2(-splitter.get_direction().y, splitter.get_direction().x));
            float end_side = glm::dot(end_to_splitter, glm::vec2(-splitter.get_direction().y, splitter.get_direction().x));

            bool denominator_is_zero = glm::abs(glm::dot(splitter.get_direction(), splitter.get_direction())) < EPSILON;
            bool numerator_is_zero = glm::abs(glm::dot(start_to_splitter, splitter.get_direction())) < EPSILON;

            if (denominator_is_zero && numerator_is_zero) {
                // The segment is collinear with the splitter, we can choose to put it in either front or back
                front_segments.push_back(segment);
            } else if (start_side >= 0 && end_side >= 0) {
                // Both endpoints are in front of the splitter
                front_segments.push_back(segment);
            } else if (start_side <= 0 && end_side <= 0) {
                // Both endpoints are behind the splitter
                back_segments.push_back(segment);
            } else {
                // The segment intersects the splitter, we need to split it into two segments
                glm::vec2 direction = splitter.get_direction();
                float t = glm::dot(splitter.get_start() - segment.get_start(), direction) / glm::dot(segment.get_direction(), direction);
                glm::vec2 intersection_point = segment.get_start() + t * segment.get_direction();

                if (start_side > 0) {
                    front_segments.push_back(Segment(segment.get_start(), intersection_point));
                    back_segments.push_back(Segment(intersection_point, segment.get_end()));
                } else {
                    back_segments.push_back(Segment(segment.get_start(), intersection_point));
                    front_segments.push_back(Segment(intersection_point, segment.get_end()));
                }
            }

            return {front_segments, back_segments};
        }
        
        

    }

    void TreeBuilder::build_tree(std::shared_ptr<Node> node, const std::vector<Segment>& segments) {
        if (segments.empty()) {
            return; // Base case: no segments to partition
        }

        auto partition_segments = split_space(node, segments);

        if (partition_segments.first) {
            build_tree(partition_segments.first, segments); // Recursively build the front node
        }

        if (partition_segments.second) {
            build_tree(partition_segments.second, segments); // Recursively build the back node
        }
    }
}