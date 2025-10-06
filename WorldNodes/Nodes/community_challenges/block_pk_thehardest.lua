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
    add_bent_s(10,8,8,"bent_base_txt","In the current beta branch im looking at, There is a Pink Active area in the Super Massive Black Hole.")

    --new solution 1.01.30
    --Solution:First, get to at least depth 30 of the Ying Forest. Find an Unremebered Tower (black tower) that has a "Tweedle Dum Air Secret Case" on the Treasure Kilo of the tower. You can see if the case exists by looking through the second to top floor of the tower (through the glass windows). Shrink through the toll gate on the top floor, then go down and enter the Tweedle Dum Air. Enter one of the blue 3x3x5 bases, and shrink. Now go towards the waypoint in the back and shrink using the shrink there. You should now be inside Stoney Air. Then, shrink and enter a Rich Yellow Cube (use the Look Block HUD to find it. It has the exact name: "XAR_STONEY_AIR_YELLOW_CUBE_1_RICH". Alternatively, with the 'non-cheaty way', look at the tops of Yellow Cubes that are the size of a chunk, a Rich Yellow Cube has a grey corner on the top). Then, use a Blue Ring to get to the Secret Island (there is one in every green lattice block). Travel to any of the corners of the island. then shrink and enter the Galaxy Cube in the Galaxy Flower. Use the corner shrink 3 times, then fly to the Supermassive Black Hole. (It is slightly faster to start from the back left corner.) Travel past the first shell with the waypoint, then go through the plugs, go through the tunnels until you reach the area with the Orange Ground Cities. Go to one of the buildings with a pink P and enter it, then use the Pink Ring. 
    --This entire process should take about 30 minutes. 
    --Below was my end pathpos for my attempt.
    --[[
    YING_FOREST_TOWER_TREASURE_KILO--7,7,2
    TWEED_DUM_CASE_SECRET------------6,8,13
    TAU_CAVE_AIR_TWEED_DUM-----------7,7,7
    TAU_CAVE_AIR_TWEED_DUM_BASE------8,9,12
    STONEY_AIR-----------------------7,7,7
    STONEY_AIR_YELLOW_CUBE_1_RICH----7,7,7
    STONEY_AIR_SECRET_AREA_1---------7,7,7
    STONEY_AIR_SECRET_AREA_2---------12,12,8
    SPACE_GALAXY_FLOWER--------------8,8,8
    SPACE_GALAXY---------------------7,7,7
    BLACK_HOLE_BIG-------------------2,2,8
    BLACK_HOLE_BIG_3_KILO------------7,0,8
    ORANGE_GROUND_CITY---------------10,2,6
    ORANGE_GROUND_CITY_PINK
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
