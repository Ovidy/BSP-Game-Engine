#include <bsp/handler.h>

namespace bsp {
    Handler::Handler() {
        // constructor code here
    }

    Handler::~Handler() {
        // destructor code here
    }

    void Handler::update(const glm::vec2& camera_position) {
        tree_traverser.update(camera_position);
    }

    void Handler::load_level(const std::vector<Sector>& input_sectors) {
        std::vector<Segment> flat_segments;

        // Flatten the hierarchy and auto-link IDs
        // Note: Using 'auto' instead of 'const auto&' for the sector so we can modify the wall's sector_id safely
        for (auto sector : input_sectors) {
            for (auto& wall : sector.walls) {
                wall.set_sector_id(sector.id); // Guarantee the wall knows its parent
                flat_segments.push_back(wall);
            }
        }

        // Feed the flattened segments into your BSP engine
        tree_builder.load_segments(TreeBuilder::find_best_seed_modern(flat_segments), flat_segments);
        tree_traverser.set_root(tree_builder.get_root());
    }

    const std::vector<glm::int32_t>& Handler::get_segment_ids_to_render() const {
        return tree_traverser.get_segment_ids_to_render();
    }

    const std::vector<Segment>& Handler::get_segments() const {
        return tree_builder.get_segments();
    }
}
