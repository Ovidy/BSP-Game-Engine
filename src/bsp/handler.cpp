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
}
