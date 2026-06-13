#pragma once

#include <bsp/data_types.h>

namespace engine
{
    struct LevelData
    {
        LevelData(const std::vector<Segment> &segments);

        LevelData() = default;
        LevelData(const LevelData &) = default;
        LevelData(LevelData &&) = default;
        LevelData &operator=(LevelData &&) = default;
        LevelData &operator=(const LevelData &) = default;
        ~LevelData() = default;

        std::vector<Segment> segments;
    };
}
