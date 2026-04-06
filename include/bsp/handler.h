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

        const std::vector<glm::int32_t>& get_segment_ids_to_render() const;
        const std::vector<Segment>& get_segments() const;
    
    private:
        TreeBuilder tree_builder;
        TreeTraverser tree_traverser;
    };
}
