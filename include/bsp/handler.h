#pragma once

#include <bsp/tree_builder.h>
#include <bsp/tree_traverser.h>
#include <bsp/level_data.h>
#include <raylib.h>

namespace bsp {
    class Handler {
    public:
        Handler();
        ~Handler();

        void update(const glm::vec2& camera_position);
        void load_level(const std::vector<Segment>& segments);

    private:
        TreeBuilder tree_builder;
        TreeTraverser tree_traverser;
    };
}
