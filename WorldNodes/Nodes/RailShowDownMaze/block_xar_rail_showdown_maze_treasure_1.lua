function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_yellow_x"
end

function p.__main()
    set_default_block("e")

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
	for z = 5,11,2 do
		add_bent(1,1,z,"bent_ammo_gun_3_large")
	end
	for z = 1,15,2 do
		add_bent(14,1,z,"bent_ammo_gun_4_large")
	end
	for z = 1,15,2 do
		add_bent(14,14,z,"bent_ammo_gun_6_large")
	end
	for z = 5,11,2 do
		add_bent(1,14,z,"bent_ammo_gun_7_large")
	end
	add_bent(7,7,13, "bent_health_mega_once")
	add_bent(9,7,13, "bent_health_mega_once")
	add_bent(7,9,13, "bent_health_mega_once")
	add_bent(5,7,13, "bent_health_mega_once")
	add_bent(7,5,13, "bent_health_mega_once")
	add_bent(7,7,15, "bent_armor_600p_once")
	add_bent(7,7,11,"bent_upgrade_gun_7_fire_speed")
	add_bent(9,7,11,"bent_upgrade_gun_7_fire_speed")
	add_bent(7,9,11, "bent_upgrade_gun_7_fire_speed")
	add_bent(5,7,11, "bent_upgrade_gun_7_fire_speed")
	add_bent(7,5,11, "bent_upgrade_gun_7_fire_speed")
	add_bent(7,7,5, "bent_gold_once_100")
    add_bent(7,7,7,"bent_base_save")
end
