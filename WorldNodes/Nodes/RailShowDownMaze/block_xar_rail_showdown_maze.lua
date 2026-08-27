function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_dark_concrete_red_border"
end

function p.__main()
    set_default_block("e")

    create_xar_chunk("XAR_I2_LIBRARY_WIG_MAZE")
	
    add_ment(7,7,1,"ment_monster_majorguard")
	set_pos(7,7,1, "block_xar_rail_showdown_maze_treasure_1")
	set_pos(7,7,4, "block_xar_rail_showdown_maze_air_1")

    for x = 0,15 do
    for y = 0,15 do
    for z = 0,15 do
        if( get_pos(x,y,z) == "XAR_EMPTY_BORING" ) then
			if randi(1,243) == 1 then
				add_ment(x,y,z,"ment_monster_majorguard")
				set_pos(x,y,z, "XAR_EMPTY_BORING")
			else
				set_pos(x,y,z, "block_xar_rail_showdown_maze_air_1")
			end
        end
    end end end

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

    
end
