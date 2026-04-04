#pragma once

#include <data_types.h>

namespace bsp {
    struct LevelData {
        LevelData(const std::vector<Segment>& segments);
        LevelData(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments);

        LevelData() = default;
        LevelData(const LevelData&) = default;
        LevelData(LevelData&&) = default;
        LevelData& operator=(LevelData&&) = default;
        LevelData& operator=(const LevelData&) = default;
        ~LevelData() = default;

        std::vector<Segment> segments;
    };
}
