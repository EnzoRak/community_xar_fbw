function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
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
	if randi(1,3) == 1 then
		if randi(1,12) == 1 then
			add_ment(7,8,7,"ment_monster_collapsed_star")
		elseif randi(1,16) == 1 then
			add_ment(7,8,7,"ment_monster_marine_commando")
		elseif randi(1,10) == 1 then
			add_bent(7,8,7,"bent_ammo_gun_7_large")
		end
		for unstableEnemies = 0,3 do
			if randi(1,8) == 1  then
				add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_unstable_energy")
			end
			if randi(1,24) == 1 then
				add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_unstable_atom")
			end
			if randi(1,12) == 1 then
				add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_unstable_light")
			end
			if randi(1,24) == 1 then
				add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_unstable_waveform")
			end
		end
	end
end
