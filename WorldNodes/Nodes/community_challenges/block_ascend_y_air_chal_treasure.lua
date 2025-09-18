function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_x" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,0,1, 15,0,14)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,0,0, 15,0,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,15,1, 15,15,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,1,15, 15,14,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,0,1, 0,0,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,15,0, 14,15,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,15,15, 14,15,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,15,1, 0,15,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,1,15, 0,14,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,1,0, 15,15,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,0,0, 0,15,0)

    add_bent_s(7,7,6,"bent_base_txt","Wow, very nice.")
    add_bent(7,4,6,"bent_upgrade_armor_regen")
    add_bent(7,10,6,"bent_upgrade_armor_regen")
    add_bent(7,7,3,"bent_upgrade_gun_9_proj_speed")
    add_bent(7,7,9,"bent_upgrade_gun_0_proj_speed")
    add_bent(7,4,6,"bent_upgrade_gun_5_fire_speed")
    add_bent(7,10,6,"bent_upgrade_gun_5_proj_speed")
    add_bent(10,7,6,"bent_upgrade_gun_3_num")
    add_bent(4,7,6,"bent_upgrade_gun_3_time")
    add_bent(7,7,9,"bent_black_market")
    add_bent(7,7,3,"bent_buy_marker_1")
    add_bent(7,1,6,"bent_upgrade_armor_regen")
    add_bent(7,13,6,"bent_upgrade_armor_regen")

    --dont need pink sphere or ring here, because the grows let you grow.
end
