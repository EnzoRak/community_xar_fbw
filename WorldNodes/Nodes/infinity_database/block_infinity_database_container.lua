function p.__get_is_solid() return true end
function p.__get_tex() return "block_infinity_green" end

function p.__main()
    set_default_block("XAR_GROUP_3_AIR_CHUNK")
    std.create_center(12,"XAR_SOLID_BORING_INFINITY_GREEN")
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER",2,2,14,13,13,15)
    create_rect("XAR_GROUP_3_AIR_CHUNK",3,2,14,12,13,15)
    create_rect("XAR_GROUP_3_AIR_CHUNK",2,3,14,13,12,15)
    create_rect("XAR_STOPPER",2,7,7,13,8,8)
    create_rect("XAR_STOPPER",7,2,7,8,13,8)
    create_rect("XAR_STOPPER",7,7,2,8,8,13)
    std.create_center(10,"XAR_EMPTY_BORING")
    std.create_center(6,"XAR_SOLID_BORING_INFINITY_GREEN")
    std.create_center(4,"infinity_database_air")
    set_pos(5,5,10,"XAR_SMALL_YELLOW_FLOWER_BLUE_RINGS")
    create_rect("XAR_STOPPER_BIG",6,6,10,9,9,10)
    create_rect("XAR_DESCEND_SIMPLE",6,6,11,9,9,11)
    set_pos(2,2,2,"XAR_EMPTY_BORING")
    add_bent(2,2,2,"bent_base_ring_pink_dest")
    base_blue_tele.set_blue_type_down(randi(6,9),randi(6,9),randi(6,9))
end
