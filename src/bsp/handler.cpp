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

    void Handler::load_level(const std::vector<Segment>& segments) {
        LevelData level_data = LevelData(segments);
        tree_builder.load_segments(TreeBuilder::find_best_seed_modern(segments), segments);
        tree_traverser.set_root(tree_builder.get_root());
    }

    const std::vector<glm::int32_t>& Handler::get_segment_ids_to_render() const {
        return tree_traverser.get_segment_ids_to_render();
    }

    const std::vector<Segment>& Handler::get_segments() const {
        return tree_builder.get_segments();
    }
}
