#include <bsp/bsp_manager.h>

namespace engine
{
    BspManager::BspManager()
    {
        // constructor code here
    }

    BspManager::~BspManager()
    {
        // destructor code here
    }

    void BspManager::update(const glm::vec2 &camera_position)
    {
        tree_traverser.update(camera_position);
    }

    void BspManager::load_level(const std::vector<Sector> &input_sectors)
    {
        std::vector<Segment> flat_segments;
        sector_cache.clear();

        // Flatten the hierarchy and auto-link IDs
        // Note: Using 'auto' instead of 'const auto&' for the sector so we can modify the wall's sector_id safely
        for (auto sector : input_sectors)
        {
            sector_cache[sector.id] = sector; // Cache it for Physics lookups!

            for (auto &wall : sector.walls)
            {
                wall.set_sector_id(sector.id); // Guarantee the wall knows its parent
                flat_segments.push_back(wall);
            }
        }

        // Feed the flattened segments into your BSP engine
        tree_builder.load_segments(TreeBuilder::find_best_seed_modern(flat_segments), flat_segments);
        tree_traverser.set_root(tree_builder.get_root());
    }

    std::vector<Sector> BspManager::get_nearby_sectors(const glm::vec2 &pos, const glm::float32_t &radius) const
    {
        std::unordered_set<glm::int32_t> nearby_sector_ids;

        tree_traverser.get_collision_candidates(
            tree_builder.get_root(), pos, radius, nearby_sector_ids);

        std::vector<Sector> result;
        for (glm::int32_t id : nearby_sector_ids)
        {
            if (sector_cache.find(id) != sector_cache.end())
            {
                result.push_back(sector_cache.at(id));
            }
        }
        return result;
    }

    const std::vector<glm::int32_t> &BspManager::get_segment_ids_to_render() const
    {
        return tree_traverser.get_segment_ids_to_render();
    }

    const std::vector<Segment> &BspManager::get_segments() const
    {
        return tree_builder.get_segments();
    }
}
