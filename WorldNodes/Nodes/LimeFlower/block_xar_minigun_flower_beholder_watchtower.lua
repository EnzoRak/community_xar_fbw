function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_red_border"
end

function p.__main()
    set_default_block("XAR_MINI_AMMO_FOREST_GUERRILLA_AIR_CHUNK")


    --Replacing the yellow block in the yellow flower
    --with a meme block.
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
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 15,0,1, 15,0,14)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 15,15,1, 15,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 1,0,15, 15,0,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 0,15,1, 0,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 0,1,15, 0,14,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 0,0,0, 0,15,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 0,0,1, 0,0,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 15,1,0, 15,15,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 15,1,15, 15,14,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 1,15,15, 14,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 1,0,0, 15,0,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER", 1,15,0, 14,15,0)
	add_ment(7,7,7,"ment_monster_beholder")
	add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_spider_great")
	add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_spider_great")
	add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_spider_great")
	add_bent(randi(0,15),randi(0,15),randi(0,15),"bent_base_ring_green")
	add_bent(randi(0,15),randi(0,15),randi(0,15),"bent_base_ring_green")
	add_bent(randi(0,15),randi(0,15),randi(0,15),"bent_base_ring_green")
end
