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
		"gun_7_damage",
        --"gun_7_fire_speed",
        --"gun_8_ammo_cap",
        --"gun_8_damage",
        --"gun_8_radius",
        --"gun_8_time",
        --"gun_9_ammo_cap",
        --"gun_9_damage",
        --"gun_9_proj_speed",
        --"gun_9_radius",
        --"health_cap",
        --"health_regen",
        --"shield"
    }
    add_bent(8,7,10,"bent_base_save")
	add_bent(8,7,8,"bent_base_ring_green")
	set_pos(8,7,7, "XAR_LARGE_WHITE_FLOWER")
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_RED_BORDER", 8,7,0, 8,7,6)
	for x = 0,15 do
	for y = 0,15 do
		set_pos(x,y,15, "XAR_ASCEND_SIMPLE")
	end end
	for z = 1,15,2 do
		add_bent(14,1,z,"bent_ammo_gun_4_large")
	end
	for z = 1,15,2 do
		add_bent(14,7,z,"bent_ammo_gun_9")
		add_bent(14,9,z,"bent_ammo_gun_9")
	end
	for z = 1,15,4 do
		add_bent(14,14,z,"bent_ammo_gun_6_huge")
	end
	for x = 1,3,2 do
	for y = 12,14,2 do
	for z = 1,11,2 do
		add_bent(x,y,z,"bent_ammo_gun_7_large")
	end end end
	add_bent_s(2,13,6,"bent_base_txt","^x00ff00Message from your friend K:\n\nWhen a simple maze cotnains enemies, ones ability to navigate it significantly decreases.\n\nThese peons take away your attention, and your focus will stray away from what's actually important. Sometimes its simply not worth to fight.\n\nTake Unstable Waveform for an example. They're slow, and only damage you when in close contact. You're simply better off freezing them and running away. Sometimes.^!")
	add_bent_s(2,13,10,"bent_base_txt","You got the Rail Rift Trophy!\n\nWell, there isn't actually a trophy here, but it's fun to play make believe.")
	add_bent(2,13,12, "bent_armor_1000p_once")
	add_bent(2,13,8, "bent_gold_once_1000")
	add_bent(2,13,4, "bent_ammo_gun_0")
	add_bent(2,13,2, "bent_ammo_gun_0")
	add_bent(2,13,14,"bent_base_ring_pink_source")
	for x = 1,5,2 do
	for y = 1,5,2 do
	for z = 6,14,2 do
		if z <= 10 then
			add_bent(x,y,z,"bent_upgrade_gun_7_damage")
		else
			add_bent(x,y,z,"bent_upgrade_gun_7_fire_speed")
		end
	end end end
end
