#pragma once

#include <vector>
#include <glm/glm.hpp>
#include <bsp/data_types.h>

namespace bsp {
    
    // Helper to automatically normalize plane directions
    Plane make_plane(glm::vec3 anchor, glm::vec3 normal) {
        return Plane{ anchor, glm::normalize(normal) };
    }

    std::vector<glm::vec2> points = {
        // --- COURTYARD PERIMETER (0-7) ---
        // Notice the gaps! 2->3 is the East Door. 5->6 is the North Door.
        {0.0f, 0.0f}, {40.0f, 0.0f}, {40.0f, 15.0f}, {40.0f, 20.0f}, 
        {40.0f, 40.0f}, {20.0f, 40.0f}, {10.0f, 40.0f}, {0.0f, 40.0f},
        
        // --- HALLWAY (8-9) ---
        {60.0f, 15.0f}, {60.0f, 20.0f},
        
        // --- ARENA PERIMETER (10-13) ---
        {60.0f, 0.0f}, {100.0f, 0.0f}, {100.0f, 40.0f}, {60.0f, 40.0f},
        
        // --- SLOPED PIT RAMP (14-15) ---
        {20.0f, 50.0f}, {10.0f, 50.0f},
        
        // --- DEEP PIT BOTTOM (16-17) ---
        {20.0f, 60.0f}, {10.0f, 60.0f},
        
        // --- RAISED PLATFORM (18-21) ---
        {5.0f, 5.0f}, {10.0f, 5.0f}, {10.0f, 10.0f}, {5.0f, 10.0f},
        
        // --- PLATFORM RAMP (22-23) ---
        {15.0f, 5.0f}, {15.0f, 10.0f},
        
        // --- HOUSE LEFT (24-27) ---
        {20.0f, 10.0f}, {24.0f, 10.0f}, {24.0f, 18.0f}, {20.0f, 18.0f},
        
        // --- HOUSE RIGHT (28-29) ---
        {28.0f, 10.0f}, {28.0f, 18.0f},
        
        // --- FLOATING TRIANGLE (30-32) ---
        {10.0f, 25.0f}, {15.0f, 30.0f}, {5.0f, 30.0f},
        
        // --- PYRAMID BASE CORNERS (33-36) ---
        {70.0f, 10.0f}, {90.0f, 10.0f}, {90.0f, 30.0f}, {70.0f, 30.0f},
        
        // --- PYRAMID PEAK (37) ---
        {80.0f, 20.0f} 
    };
    
    std::vector<bsp::Sector> test_level_sectors = {
        
        // ---------------------------------------------------------
        // THE ARCHITECTURE SHELL (Connecting Rooms)
        // ---------------------------------------------------------

        // Sector 0: The Giant Main Courtyard
        {
            0, 
            make_plane({0.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}),  // Floor Y=0
            make_plane({0.0f, 12.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), // Ceiling Y=12
            0, 2, // Floor: Grass(0), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[0], points[1], 1, -1), // Wall: Brick(1)
                bsp::Segment(points[1], points[2], 1, -1), 
                bsp::Segment(points[3], points[4], 1, -1), 
                bsp::Segment(points[4], points[5], 1, -1), 
                bsp::Segment(points[6], points[7], 1, -1), 
                bsp::Segment(points[7], points[0], 1, -1)
            }
        },

        // Sector 1: Claustrophobic Hallway (Connects Courtyard to Arena)
        {
            1, 
            make_plane({0.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 3.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            3, 3, // Floor: Wood(3), Ceiling: Wood(3)
            std::vector<bsp::Segment>{
                bsp::Segment(points[2], points[8], 1, -1), // Wall: Brick(1)
                bsp::Segment(points[9], points[3], 1, -1)  
            }
        },

        // Sector 2: The Boss Arena
        {
            2, 
            make_plane({0.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 20.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            0, 2, // Floor: Grass(0), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[8], points[10], 1, -1), // Wall: Brick(1)
                bsp::Segment(points[10], points[11], 1, -1), 
                bsp::Segment(points[11], points[12], 1, -1), 
                bsp::Segment(points[12], points[13], 1, -1),
                bsp::Segment(points[13], points[9], 1, -1)
            }
        },

        // Sector 3: Ramp leading down into the Pit
        {
            3, 
            make_plane({0.0f, 0.0f, 40.0f}, {0.0f, 1.0f, 1.0f}), 
            make_plane({0.0f, 12.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 2, // Floor: Stone(4), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[5], points[14], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[15], points[6], 4, -1)
            }
        },

        // Sector 4: The Deep Pit Bottom
        {
            4, 
            make_plane({0.0f, -10.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 12.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 2, // Floor: Stone(4), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[14], points[16], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[16], points[17], 4, -1),
                bsp::Segment(points[17], points[15], 4, -1)
            }
        },

        // ---------------------------------------------------------
        // COURTYARD INTERIOR OBJECTS
        // ---------------------------------------------------------

        // Sector 5: Raised Platform (Height 4)
        {
            5, 
            make_plane({0.0f, 4.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 12.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            3, 2, // Floor: Wood(3), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[18], points[19], 3, -1), // Wall: Wood(3)
                bsp::Segment(points[19], points[20], 3, -1), 
                bsp::Segment(points[20], points[21], 3, -1), 
                bsp::Segment(points[21], points[18], 3, -1)
            }
        },

        // Sector 6: Ramp to Raised Platform
        {
            6, 
            make_plane({15.0f, 0.0f, 0.0f}, {0.8f, 1.0f, 0.0f}), 
            make_plane({0.0f, 12.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            3, 2, // Floor: Wood(3), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[22], points[19], 3, -1), // Wall: Wood(3)
                bsp::Segment(points[20], points[23], 3, -1),
                bsp::Segment(points[23], points[22], 3, -1)
            }
        },

        // Sector 7: House (Left Half) - Roof slopes UP towards X=24
        {
            7, 
            make_plane({0.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({20.0f, 5.0f, 0.0f}, {-1.0f, 1.0f, 0.0f}), 
            3, 1, // Floor: Wood(3), Ceiling/Roof: Brick(1)
            std::vector<bsp::Segment>{
                bsp::Segment(points[24], points[25], 1, -1), // Wall: Brick(1)
                bsp::Segment(points[25], points[26], 1, -1), 
                bsp::Segment(points[26], points[27], 1, -1), 
                bsp::Segment(points[27], points[24], 1, -1)
            }
        },

        // Sector 8: House (Right Half) - Roof slopes DOWN away from X=24
        {
            8, 
            make_plane({0.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({28.0f, 5.0f, 0.0f}, {1.0f, 1.0f, 0.0f}), 
            3, 1, // Floor: Wood(3), Ceiling/Roof: Brick(1)
            std::vector<bsp::Segment>{
                bsp::Segment(points[25], points[28], 1, -1), // Wall: Brick(1)
                bsp::Segment(points[28], points[29], 1, -1), 
                bsp::Segment(points[29], points[26], 1, -1), 
                bsp::Segment(points[26], points[25], 1, -1)
            }
        },

        // Sector 9: Floating Triangle
        {
            9, 
            make_plane({0.0f, 6.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 8.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 4, // Floor: Stone(4), Ceiling: Stone(4)
            std::vector<bsp::Segment>{
                bsp::Segment(points[30], points[31], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[31], points[32], 4, -1), 
                bsp::Segment(points[32], points[30], 4, -1)
            }
        },

        // ---------------------------------------------------------
        // ARENA INTERIOR: THE 4-SIDED PYRAMID
        // ---------------------------------------------------------

        // Sector 10: Pyramid South Face
        {
            10, 
            make_plane({80.0f, 0.0f, 10.0f}, {0.0f, 1.0f, -1.0f}), 
            make_plane({0.0f, 20.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 2, // Floor: Stone(4), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[33], points[34], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[34], points[37], 4, -1), 
                bsp::Segment(points[37], points[33], 4, -1)
            }
        },

        // Sector 11: Pyramid East Face
        {
            11, 
            make_plane({90.0f, 0.0f, 20.0f}, {1.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 20.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 2, // Floor: Stone(4), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[34], points[35], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[35], points[37], 4, -1), 
                bsp::Segment(points[37], points[34], 4, -1)
            }
        },

        // Sector 12: Pyramid North Face
        {
            12, 
            make_plane({80.0f, 0.0f, 30.0f}, {0.0f, 1.0f, 1.0f}), 
            make_plane({0.0f, 20.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 2, // Floor: Stone(4), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[35], points[36], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[36], points[37], 4, -1), 
                bsp::Segment(points[37], points[35], 4, -1)
            }
        },

        // Sector 13: Pyramid West Face
        {
            13, 
            make_plane({70.0f, 0.0f, 20.0f}, {-1.0f, 1.0f, 0.0f}), 
            make_plane({0.0f, 20.0f, 0.0f}, {0.0f, 1.0f, 0.0f}), 
            4, 2, // Floor: Stone(4), Ceiling: Sky(2)
            std::vector<bsp::Segment>{
                bsp::Segment(points[36], points[33], 4, -1), // Wall: Stone(4)
                bsp::Segment(points[33], points[37], 4, -1), 
                bsp::Segment(points[37], points[36], 4, -1)
            }
        }
    };

    std::vector<bsp::Sprite> test_level_sprites = {
        // Sprite in the open courtyard
        { glm::vec3(20.0f, 0.5f, 10.0f), 5, 1.0f, WHITE }, 
        
        // Sprite on top of the raised platform
        { glm::vec3(7.5f, 4.5f, 7.5f), 6, 1.0f, GREEN },
        
        // Sprite at the bottom of the deep pit!
        { glm::vec3(15.0f, -9.5f, 55.0f), 5, 1.5f, RED },
        
        // Sprite inside the pitched roof house
        { glm::vec3(24.0f, 2.0f, 14.0f), 6, 1.0f, YELLOW },

        // The Ultimate Prize: A Sprite perfectly resting on the peak of the pyramid!
        { glm::vec3(80.0f, 10.5f, 20.0f), 5, 2.0f, MAGENTA }
    };
}
