function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_red_x"
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
        "gun_6_damage",
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
        --"health_cap",
        --"health_regen",
        --"shield"
    }
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 15,0,1, 15,0,14)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 15,15,1, 15,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 1,0,15, 15,0,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 0,15,1, 0,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 0,1,15, 0,14,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 0,0,0, 0,15,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 0,0,1, 0,0,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 15,1,0, 15,15,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 15,1,15, 15,14,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 1,15,15, 14,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 1,0,0, 15,0,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_RED_X", 1,15,0, 14,15,0)
	for z = 2,12,2 do
		add_bent(14,2,z,"bent_ammo_gun_2_large_once")
	end
	for z = 6,12,2 do
		add_bent(14,4,z,"bent_ammo_gun_3_large_once")
	end 
	for z = 2,12,2 do
		add_bent(14,6,z,"bent_ammo_gun_6_large")
	end 
	for z = 6,12,2 do
		add_bent(14,8,z,"bent_ammo_gun_7_large_once")
	end
	for z = 6,12,2 do
		add_bent(14,10,z,"bent_ammo_gun_8_once")
	end
	for z = 6,12,2 do
		add_bent(14,12,z,"bent_ammo_gun_9_once")
	end
	add_bent_s(1,14,6,"bent_base_txt","^x00ff00Message from your friend K:\n\nI've never seen this Lime in my journey inside the Fractal Block World. Looking back, perhaps I simply missed this obvious Lime? The Fractal Block World is so big and vast, I wouldn't be surprised if my memory was hazy. I don't remember the first time I did a Noob Maze!\n\nWell, you could also say I just wasn't paying attention.\n\nAfter all, if you don't know what you're looking for, you won't know what to search for.\n\nGosh, why am I being so philosophical right now?!^!")
	add_bent_s(1,14,10,"bent_base_txt","You got the Lime Trophy!\n\nWell, there isn't actually a trophy here, but it's fun to play make believe.")
	add_bent(1,14,12, "bent_armor_600p_once")
	add_bent(1,14,4, "bent_gold_once_1000")
    add_bent_s(1,14,8,"bent_base_waypoint","Lime Finish!!!")
	add_bent(1,14,14,"bent_base_ring_pink_source")
	for x = 1,7,2 do
	for y = 2,4,2 do
	for z = 2,12,2 do
		if x <= 5 then
			add_bent(x,y,z,"bent_upgrade_" .. upgs[randi(1,#upgs)])
		elseif x == 7 and z > 11 then
			add_bent(x,y,z,"bent_upgrade_gun_6_num")
		end
	end end end
	for x = 1,7,2 do
	for y = 6,8,2 do
	for z = 8,12,2 do
		add_bent(x,y,z,"bent_upgrade_gun_6_ammo_cap")
	end end end
end
