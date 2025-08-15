function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_GLASS", 4,0,0, 4,15,15)
    create_rect("XAR_ONE_WAY_X_NEG", 0,0,0, 0,15,15)
    create_rect("XAR_YING_TREE_INNER", 10,5,5, 10,5,6)
    create_rect("XAR_YING_TREE_INNER", 10,8,0, 10,8,4)
    create_rect("XAR_YING_TREE_INNER", 10,9,4, 10,11,4)
    create_rect("XAR_YING_TREE_INNER", 10,11,5, 10,11,6)
    create_rect("XAR_YING_TREE_INNER", 10,5,4, 10,7,4)
    set_pos(10,11,7, "XAR_YING_FOREST")
    create_rect("XAR_YING_FOREST", 10,6,5, 10,10,5)
    set_pos(10,5,7, "XAR_YING_FOREST")
    
    add_bent_s(10,8,9,"bent_base_txt","Part 2: ^xFF00FFThe Hidden Pink Ring^!\n\nI hope you know which areas lead to more areas without Pink Spheres in the Ying Forest.\n\nOnce you shrink down, the only way to come back to this size is to use a ^x0000FFBlue Ring.^! \n\nThe only way to progress it to find a ^xFF00FFPink Ring^! somewhere that will take you out of the Ying Forest.")
    add_bent_s(10,8,8,"bent_base_txt","In the current beta branch im looking at, a Pink Sphere has been added to the Bulk, making it impossible to Pink out of a Ying Forest. \n\nYeah, when I was working on this, I thought that Dan wouldn't, but he added it anyways. \n\nSo, now I have modified The Bulk to remove the pink sphere.")

    --Solution:First, get to at least depth 30 of the Ying Forest. Find an Unremebered Tower (black tower) that has a "Tweedle Dum Air Secret Case" on the Treasure Kilo of the tower. You can see if the case exists by looking through the second to top floor of the tower (through the glass windows). Shrink through the toll gate on the top floor, then go down and enter the Tweedle Dum Air. Enter one of the blue 3x3x5 bases, and shrink. Now go towards the waypoint in the back and shrink using the shrink there. You should now be inside Stoney Air. Then, shrink and enter a Rich Yellow Cube (use the Look Block HUD to find it. It has the exact name: "XAR_STONEY_AIR_YELLOW_CUBE_1_RICH". Alternatively, with the 'non-cheaty way', look at the tops of Yellow Cubes that are the size of a chunk, a Rich Yellow Cube has a grey corner on the top). Then, use a Blue Ring to get to the Secret Island (there is one in every green lattice block). Travel to any of the corners of the island. then shrink and enter the Galaxy Cube in the Galaxy Flower. Use the corner shrink, then the corner shrink on the green pillar, and look for the nearest Sun with a Clay Planet around it, then go back, then shrink again on the black pillar on the green pillar, and fly towards the Clay Planet. Go beneath the Planet and shrink, pay the toll, then go around the Planet to the top. Shrink using a Ying Forest Shrink, then go through any plug on the floor. Go through 8 layers of mazes and cavities of the Planet until you reach the major treasure room at the bottom. (Remember, you can also shrink to skip some walls, though doing so will take even longer, because a lot of walls are not just one kilochunk thick). When you enter the first plug at the top, doing "pathpos" in the command window, looking at the line "PLANET_CLAY" should show something like: PLANET_CLAY----------------------X,Y,14. If the last number reaches 6, (pathpos showing X,Y,6), then you have reached the end. This way you can track how far along you are in the maze. Also, my personal best through this maze is slightly over 20 minutes.) Enter the Bulk, and shrink into the Bulk air using one of the large island shrinks. Locate one of the small 1x1x1 Grey X Blocks that are close to one of the larger Ying Forests. Shrink using a ring in the forest, then get to the grey X cube, which is now a modified EMP Castle. Shrink again, then enter through the top of the castle center area. The Pink Ring is in the yellow treasure room next to the trophy. 
    --This entire process should take about 45 minutes. 
    --Below was my end pathpos for my attempt.
    --[[
    YING_FOREST_TOWER_TREASURE_KILO-------7,7,2
    TWEED_DUM_CASE_SECRET-----------------7,11,8
    TAU_CAVE_AIR_TWEED_DUM----------------6,0,6
    TAU_CAVE_AIR_TWEED_DEE----------------7,7,8
    TAU_CAVE_AIR_TWEED_DUM----------------7,7,7
    TAU_CAVE_AIR_TWEED_DUM_BASE-----------6,7,11
    STONEY_AIR----------------------------7,7,7
    STONEY_AIR_YELLOW_CUBE_1_RICH---------7,7,7
    STONEY_AIR_SECRET_AREA_1--------------7,7,7
    STONEY_AIR_SECRET_AREA_2--------------3,3,8
    SPACE_GALAXY_FLOWER-------------------8,8,8
    SPACE_GALAXY--------------------------14,14,7
    SPACE_SOLAR_SYSTEM--------------------6,7,6
    SPACE_PLANET_AREA---------------------7,7,7
    PLANET_CLAY---------------------------7,7,1
    PLANET_CLAY_MAZE_MAJOR_TREASURE_KILO--7,7,6
    BULK_STANDING_CUBES-------------------6,11,10
    BULK_HANGING_CHAIN_AIR_1--------------13,15,0
    BULK_HANGING_CHAIN_AIR_2--------------7,7,8
    BULK_CASTLE---------------------------7,8,2
    WILLISTON_CASTLE_TREASURE
    ]]


    add_bent(2,8,7,"bent_base_ring_pink_dest")
    add_bent(10,8,7,"bent_base_ring_green_danger")
    
    --op(?) lute
    add_bent(9,8,5,"bent_gold_1000")
    add_bent(9,7,5,"bent_gold_1000")
    add_bent(9,9,5,"bent_gold_1000")
    add_bent_i(9,8,4,"bent_damage_5x_stacking",1200)
    add_bent(9,7,4,"bent_upgrade_gun_3_num")
    add_bent(9,9,4,"bent_upgrade_gun_3_num")
    add_bent(9,6,4,"bent_upgrade_gun_3_num")
    add_bent(9,10,4,"bent_upgrade_gun_3_num")
    add_bent_i(9,8,3,"bent_xp_5x_stacking",1200)
    add_bent(9,7,3,"bent_upgrade_gun_6_num")
    add_bent(9,9,3,"bent_upgrade_gun_6_num")


    chunk_dyn_set_s("dyn_base_blue_tele_type", "terminal")
    chunk_dyn_set_i("dyn_base_blue_tele_pos_x", 8)
    chunk_dyn_set_i("dyn_base_blue_tele_pos_y", 8)
    chunk_dyn_set_i("dyn_base_blue_tele_pos_z", 7)
end
