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
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,0,1, 15,0,14)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,15,1, 15,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,0,15, 15,0,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,15,1, 0,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,1,15, 0,14,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,0,0, 0,15,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,0,1, 0,0,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,1,0, 15,15,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,1,15, 15,14,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,15,15, 14,15,15)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,0,0, 15,0,0)
	create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 1,15,0, 14,15,0)
	for y = 2,4,2 do
	for z = 9,13,2 do
		add_bent(14,y,z,"bent_ammo_gun_9")
	end end
	add_bent_s(7,7,7,"bent_base_txt","Welcome to the Jackfruit Checkpoint!\n\nHave some free Nukes for your troubles!")
	add_bent_s(7,7,9,"bent_base_txt","^x00ff00Message from your friend K:\n\nI've modified Jackfruits to make them contain more Health Upgrades, and even RejuvenX in these treasure chunks! However, it seem's like it also attracted many nasty monsters! I'm sure you have a strong EMP weapon to boot.\n\nYou may have noticed these so called Flowery monsters. They CANNOT be stunned by EMP. And they will SWARM you and they are near impossible to wipe out. They only way to not get killed by them is to RUN AWAY.\n\nIf you don't know already, you can use Laser Disco to kill a weaker monster to freeze a room of Floweries.^!")
	add_bent_s(7,7,11,"bent_base_txt","You got the Jackfruit Checkpoint Trophy!\n\nWell, there isn't actually a trophy here, but it's fun to play make believe.")
	add_bent(7,7,13, "bent_armor_600p_once")
	add_bent(9,7,13, "bent_health_mega_once")
	add_bent(7,9,13, "bent_health_mega_once")
	add_bent(5,7,13, "bent_health_mega_once")
	add_bent(7,5,13, "bent_health_mega_once")
	add_bent(7,7,5, "bent_gold_once_10")
	for x = 1,7,2 do
	for y = 2,4,2 do
	for z = 4,12,2 do
		if x <= 5 then
			add_bent(x,y,z,"bent_upgrade_" .. upgs[randi(1,#upgs)])
		elseif x == 7 and z > 7 then
			add_bent(x,y,z,"bent_upgrade_spice")
		end
	end end end
	for jackfruitTreasureEnemies = 0,48 do
		if randi(1,10) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_lamprey_green")
		end
		if randi(1,4) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_vulcan_war")
		end
    end
end
