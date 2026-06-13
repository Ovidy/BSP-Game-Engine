#pragma once

#include <memory>
#include <random>
#include <future>
#include <thread>
#include <utility>

#include <glm/glm.hpp>

#include <bsp/utils.h>
#include <bsp/data_types.h>

namespace engine {
    class TreeBuilder {
    public:
    TreeBuilder();
    ~TreeBuilder() = default;

    void load_segments(const glm::int32_t& seed, const std::vector<Segment>& segments);

    std::shared_ptr<Node> get_root() const;
    const std::vector<Segment>& get_segments() const;

    static glm::int32_t find_best_seed_modern(const std::vector<Segment>& input_segments, glm::int32_t start_seed = 0, glm::int32_t end_seed = 100000, glm::int32_t weight_factor = 3);

    private:
    glm::int32_t find_best_seed(const std::vector<Segment>& input_segments, glm::int32_t start_seed = 0, glm::int32_t end_seed = 20000, glm::int32_t weight_factor = 3);
    
    static std::pair<glm::int32_t, glm::int32_t> evaluate_seed_range(const std::vector<Segment>& input_segments, glm::int32_t start_seed, glm::int32_t end_seed, glm::int32_t weight_factor);

    void add_segment_to_node(std::shared_ptr<Node> node, const Segment& segment);
    
    std::pair<std::vector<Segment>, std::vector<Segment>> split_space(std::shared_ptr<Node> node, const std::vector<Segment>& segments);
    void build_tree(std::shared_ptr<Node> node, const std::vector<Segment>& segments);
    
    void print_number_of_segments() const;

    std::shared_ptr<Node> root_node;
    std::vector<Segment> segments;
    glm::int32_t segment_id;
    glm::int32_t num_front_segments;
    glm::int32_t num_back_segments;
    glm::int32_t num_split_segments;
    };
}
