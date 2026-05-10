#include <bsp/tree_builder.h>
#include <algorithm>

namespace bsp {
    TreeBuilder::TreeBuilder() : root_node(std::make_shared<Node>()), segment_id(0), num_front_segments(0), num_back_segments(0), num_split_segments(0) {}

    void TreeBuilder::print_number_of_segments() const {
        std::cout << "Total segments: " << segments.size() << std::endl;
        std::cout << "Front segments: " << num_front_segments << std::endl;
        std::cout << "Back segments: " << num_back_segments << std::endl;
        std::cout << "Split segments: " << num_split_segments << std::endl;
    }

    void TreeBuilder::load_segments(const glm::int32_t& seed, const std::vector<Segment>& input_segments) {
        // Find best seed using the Python defaults: 0 to 20,000, weight 3
        glm::int32_t best_seed = (!seed) ? find_best_seed(input_segments, 0, 20000, 3) : seed;
        
        std::mt19937 rng(best_seed);
        std::vector<Segment> shuffled_segments = input_segments;
        std::shuffle(shuffled_segments.begin(), shuffled_segments.end(), rng);
        
        // Reset state one final time for the actual, permanent tree
        root_node = std::make_shared<Node>();
        segments.clear();
        segment_id = 0;
        num_front_segments = 0;
        num_back_segments = 0;
        num_split_segments = 0;

        build_tree(root_node, shuffled_segments);
        print_number_of_segments();
    }

    std::shared_ptr<Node> TreeBuilder::get_root() const {
        return root_node;
    }

    const std::vector<Segment>& TreeBuilder::get_segments() const {
        return segments;
    }

    glm::int32_t TreeBuilder::find_best_seed_modern(const std::vector<Segment>& input_segments, glm::int32_t start_seed, glm::int32_t end_seed, glm::int32_t weight_factor) {
        unsigned int cpu_count = std::thread::hardware_concurrency();
        if (cpu_count == 0) cpu_count = 4; // Fallback

        glm::int32_t total_seeds = end_seed - start_seed;
        glm::int32_t chunk_size = total_seeds / cpu_count;

        std::vector<std::future<std::pair<glm::int32_t, glm::int32_t>>> futures;

        for (unsigned int i = 0; i < cpu_count; ++i) {
            glm::int32_t chunk_start = start_seed + i * chunk_size;
            glm::int32_t chunk_end = (i == cpu_count - 1) ? end_seed : chunk_start + chunk_size;

            std::cout << "CPU " << i << ": " << chunk_start << ", " << chunk_end << std::endl;

            // Launch the thread asynchronously. 
            // Notice: No 'this' pointer is captured, making it perfectly isolated.
            futures.push_back(std::async(std::launch::async, [input_segments, chunk_start, chunk_end, weight_factor]() {
                return TreeBuilder::evaluate_seed_range(input_segments, chunk_start, chunk_end, weight_factor);
            }));
        }

        glm::int32_t best_seed = -1;
        glm::int32_t best_score = std::numeric_limits<glm::int32_t>::max();

        for (auto& fut : futures) {
            auto result = fut.get(); 
            glm::int32_t local_score = result.first;
            glm::int32_t local_seed = result.second;

            if (local_score < best_score) {
                best_score = local_score;
                best_seed = local_seed;
            }
        }

        std::cout << "\nBest seed: " << best_seed << " with score: " << best_score << std::endl;
        return best_seed;
    }

    std::pair<glm::int32_t, glm::int32_t> TreeBuilder::evaluate_seed_range(const std::vector<Segment>& input_segments, glm::int32_t start_seed, glm::int32_t end_seed, glm::int32_t weight_factor) {
        glm::int32_t local_best_seed = -1;
        glm::int32_t local_best_score = std::numeric_limits<glm::int32_t>::max();

        for (glm::int32_t seed = start_seed; seed < end_seed; ++seed) {
            std::mt19937 rng(seed);
            std::vector<Segment> shuffled_segments = input_segments;
            std::shuffle(shuffled_segments.begin(), shuffled_segments.end(), rng);

            // Because this method is static, we MUST create an instance here.
            // This guarantees thread safety.
            TreeBuilder temp_builder;
            temp_builder.build_tree(temp_builder.get_root(), shuffled_segments);

            glm::int32_t score = std::abs(temp_builder.num_back_segments - temp_builder.num_front_segments) + (weight_factor * temp_builder.num_split_segments);

            if (score < local_best_score) {
                local_best_score = score;
                local_best_seed = seed;
            }
        }

        return {local_best_score, local_best_seed}; 
    }

    glm::int32_t TreeBuilder::find_best_seed(const std::vector<Segment>& input_segments, glm::int32_t start_seed, glm::int32_t end_seed, glm::int32_t weight_factor) {
        glm::int32_t best_seed = -1;
        glm::int32_t best_score = std::numeric_limits<glm::int32_t>::max();

        // Note: seed < end_seed matches Python's range(start, end) which is exclusive
        for (glm::int32_t seed = start_seed; seed < end_seed; ++seed) {
            std::mt19937 rng(seed);
            std::vector<Segment> shuffled_segments = input_segments;
            std::shuffle(shuffled_segments.begin(), shuffled_segments.end(), rng);

            // Reset state for this iteration (matching the Python code)
            std::shared_ptr<Node> temp_root = std::make_shared<Node>();
            segments.clear();
            segment_id = 0;
            num_front_segments = 0;
            num_back_segments = 0;
            num_split_segments = 0;

            // Build test tree
            build_tree(temp_root, shuffled_segments);

            // Calculate the score based on your formula:
            // score = abs(num_back - num_front) + weight_factor * num_splits
            glm::int32_t score = std::abs(num_back_segments - num_front_segments) + (weight_factor * num_split_segments);

            if (score < best_score) {
                best_score = score;
                best_seed = seed;
            }
        }

        std::cout << "Best seed found: " << best_seed << " with score: " << best_score << std::endl;

        return best_seed;
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
                    num_split_segments++;
                    glm::vec2 intersection_point = segment.get_start() + t * dir_segment;

                    Segment front_part(segment.get_start(), intersection_point, segment.get_texture_id(), segment.get_sector_id());
                    Segment back_part(intersection_point, segment.get_end(), segment.get_texture_id(), segment.get_sector_id());

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
            num_front_segments++;
            node->set_front(std::make_shared<Node>()); // Create a new node for the front space
            build_tree(node->get_front(), partition_segments.first); // Recursively build the front node
        }

        if (!partition_segments.second.empty()) {
            num_back_segments++;
            node->set_back(std::make_shared<Node>()); // Create a new node for the back space
            build_tree(node->get_back(), partition_segments.second); // Recursively build the back node
        }
    }
}
