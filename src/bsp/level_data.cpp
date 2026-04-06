#include <bsp/level_data.h>

bsp::LevelData::LevelData(const std::vector<Segment>& segments) : segments(segments) {}

bsp::LevelData::LevelData(const std::vector<std::pair<glm::vec2, glm::vec2>>& segments) {
    this->segments.reserve(segments.size());
    for (const auto& seg : segments) {
        this->segments.emplace_back(Segment{ seg.first, seg.second });
    }
}
