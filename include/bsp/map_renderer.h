#pragma once

namespace bsp {
    class MapRenderer {
    public:
        MapRenderer() = default;
        MapRenderer(const MapRenderer&) = default;
        MapRenderer(MapRenderer&&) = default;
        MapRenderer& operator=(MapRenderer&&) = default;
        MapRenderer& operator=(const MapRenderer&) = default;
        ~MapRenderer() = default;

        void render();
    };
}