function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_x" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_ANTI_PLUG_GLASS",0,0,0,15,15,15)
    std.create_edges("XAR_SOLID_BORING_CONCRETE_YELLOW_X")
    create_rect("XAR_EMPTY_BORING",1,1,1,14,14,14)
    add_bent_s(7,7,10,"bent_base_txt","^x00ff00Congratulations!!^!\n\nYou made it out of the sample of MCL12! Here's our reward. Now all yours.")
    add_bent(2,2,2,"bent_upgrade_armor_regen")
    add_bent(2,2,4,"bent_upgrade_armor_regen")
    add_bent(2,4,2,"bent_upgrade_armor_regen")
    add_bent(2,4,4,"bent_upgrade_armor_regen")
    add_bent(2,6,2,"bent_upgrade_armor_regen")
    add_bent(2,6,4,"bent_upgrade_armor_regen")
    add_bent(2,8,2,"bent_upgrade_armor_regen")
    add_bent(2,8,4,"bent_upgrade_armor_regen")
    add_bent(2,2,6,"bent_upgrade_gun_3_num")
    add_bent(2,2,8,"bent_upgrade_gun_3_num")
    add_bent(2,2,10,"bent_upgrade_gun_6_num")
    add_bent(2,2,12,"bent_upgrade_gun_6_num")
    add_bent_s(13,13,13,"bent_cxar_trophy","mcl12")
end
