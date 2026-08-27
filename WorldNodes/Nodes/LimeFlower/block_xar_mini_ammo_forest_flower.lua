function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
	set_default_block("XAR_MINI_AMMO_FOREST_GUERRILLA_AIR_CHUNK")
    --Generating the chunk as if
    --it was of type XAR_JACKFRUIT_SOLID_YELLOW.

    --0.1% chance an air block is a treasure chunk
    local upgs = {
        --"gun_0_ammo_cap",
        --"gun_0_damage",
        --"gun_0_proj_speed",
        --"gun_1_ammo_cap",
        --"gun_1_ammo_regen",
        --"gun_1_damage",
        --"gun_1_fire_speed",
        --"gun_1_proj_speed",
        --"gun_2_ammo_cap",
        --"gun_2_damage",
        --"gun_2_fire_speed",
        --"gun_2_num_shots",
        --"gun_2_proj_speed",
        --"gun_3_ammo_cap",
        --"gun_3_damage",
        --"gun_3_time",
        --"gun_4_ammo_cap",
        --"gun_4_damage",
        --"gun_4_fire_speed",
        --"gun_4_proj_speed",
        --"gun_4_radius",
        --"gun_5_ammo_cap",
        --"gun_5_damage",
        --"gun_5_fire_speed",
        --"gun_5_proj_speed",
        --"gun_6_ammo_cap",
        --"gun_6_damage",
        --"gun_6_fire_speed",
        --"gun_6_proj_speed",
        --"gun_7_ammo_cap",
        --"gun_7_damage",
        --"gun_7_fire_speed",
        --"gun_8_ammo_cap",
        --"gun_8_damage",
        --"gun_8_radius",
        --"gun_8_time",
        --"gun_9_ammo_cap",
        --"gun_9_damage",
        --"gun_9_proj_speed",
        --"gun_9_radius",
        "health_cap",
        "health_regen",
        --"shield"
    }
	create_rect("XAR_QUICKSAND_GRASS_1", 0,0,0, 15,15,0)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 13,13,0, 13,13,2)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 3,3,0, 3,3,1)
    set_pos(6,8,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 9,8,5, 10,8,5)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 3,13,0, 3,13,2)
    set_pos(10,8,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(8,10,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 13,3,0, 13,3,2)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 8,9,5, 8,10,5)
    set_pos(8,6,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 8,6,5, 8,7,5)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 8,8,0, 8,8,4)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 6,8,5, 7,8,5)
	add_bent(13,13,3, "bent_base_ring_green")
    add_bent(13,3,3, "bent_base_ring_pink_dest")
    set_pos(3,3,2, "XAR_SOLID_BORING_EXPANDER")
	add_bent(3,3,4,"bent_upgrade_gun_6_damage")
    set_pos(8,8,7, "block_xar_minigun_flower_fruit")
    set_pos(3,3,3, "XAR_ASCEND_SIMPLE")

	add_bent(3,13,3,"bent_base_save")
	add_bent_s(3,13,6, "bent_base_txt", "Woah! You found a Lime!\n\nThere is plentiful of Minigun upgrades inside.\n\n Prepare for a tough fight!")
end
