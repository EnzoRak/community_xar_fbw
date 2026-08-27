function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_white_border"
end

function p.__main()
    set_default_block("XAR_SOLID_BORING_CONCRETE_WHITE_BORDER")
    set_pos(7,14,1, "XAR_STOPPER")
    set_pos(14,7,1, "XAR_STOPPER")
    set_pos(7,1,1, "XAR_STOPPER")
    set_pos(1,7,1, "XAR_STOPPER")
    create_rect("XAR_EMPTY_BORING", 7,8,1, 7,13,1)
    create_rect("XAR_EMPTY_BORING", 6,1,3, 8,3,5)
    set_pos(15,7,1, "XAR_EMPTY_BORING")
    set_pos(7,0,1, "XAR_EMPTY_BORING")
    create_rect("XAR_EMPTY_BORING", 7,7,2, 7,7,4)
    create_rect("XAR_EMPTY_BORING", 8,7,1, 13,7,1)
    create_rect("XAR_EMPTY_BORING", 2,7,1, 6,7,1)
    set_pos(0,7,1, "XAR_EMPTY_BORING")
    create_rect("XAR_EMPTY_BORING", 7,2,1, 7,6,1)
    set_pos(7,15,1, "XAR_EMPTY_BORING")
    set_pos(7,0,4, "XAR_ONE_WAY_Y_NEG")
    add_bent(7,2,4, "bent_base_ring_pink_dest")
    set_pos(0,8,1, "XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER")
    set_pos(7,0,2, "XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER")
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 0,6,1, 0,6,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 8,0,1, 8,0,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,5,15, 9,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,0,0, 8,0,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,5,7, 9,5,14)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 15,6,0, 15,8,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 0,7,2, 0,8,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 8,7,6, 9,9,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,15,0, 8,15,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 0,6,0, 0,8,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,0,1, 6,0,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 9,6,7, 9,8,14)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 7,5,6, 9,6,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 5,5,6, 6,9,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,15,1, 6,15,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 7,15,2, 8,15,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 6,9,7, 9,9,14)
    set_pos(15,8,1, "XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER")
    set_pos(8,15,1, "XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER")
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 7,8,6, 7,9,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 15,6,1, 15,6,2)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 5,5,7, 5,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER", 15,7,2, 15,8,2)
    set_pos(7,7,6, "block_xar_rocket_cave_acrade")
    set_pos(7,7,5, "XAR_RAIL_CAVE_DESCEND_SIMPLE")
    set_pos(7,7,1, "XAR_EMPTY_BORING")
	add_ment(7,7,1, "ment_monster_true_guardian")
    set_pos(7,7,14, "block_xar_rocket_cave_treasure_1")
	add_bent(15,7,1, "bent_base_ring_green")
	add_bent(7,15,1, "bent_base_ring_green")
	add_bent(7,0,1, "bent_base_ring_green")
	add_bent(0,7,1, "bent_base_ring_green")
    create_rect("XAR_RAIL_CAVE_BATTLE_KILO", 6,6,14, 6,8,14)
    create_rect("XAR_RAIL_CAVE_BATTLE_KILO", 6,6,7, 8,8,13)
    set_pos(7,8,14, "XAR_RAIL_CAVE_BATTLE_KILO")
    create_rect("XAR_RAIL_CAVE_BATTLE_KILO", 7,6,14, 8,6,14)
    create_rect("XAR_RAIL_CAVE_BATTLE_KILO", 8,7,14, 8,8,14)
	for z = 5,14 do
		local silverCount = 0
		local silverLastFloor = 0
		for x = 0,15 do
		for y = 0,15 do
			if (get_pos(x,y,z+1) == "block_xar_rocket_cave_treasure_1" ) then
				silverCount = silverCount + 100
			end
			if (get_pos(x,y,z-1) == "block_xar_rocket_cave_battle_silver" ) then
				silverCount = 0
				silverLastFloor = 1
			end
			if( get_pos(x,y,z) == "XAR_RAIL_CAVE_BATTLE_KILO" ) then
				if randi(1,13-(8*silverLastFloor)+(30*silverCount)) == 1 and z <= 13 then
					set_pos(x,y,z, "block_xar_rocket_cave_battle_silver")
					silverCount = silverCount + 1
				elseif z < 14 and not ( get_pos(x,y,z-1) == "block_xar_rocket_cave_acrade" ) then
					set_pos(x,y,z, "block_xar_rocket_cave_battle_kilo_" .. z-6)
				elseif z == 14 then
					set_pos(x,y,z, "block_xar_rocket_cave_battle_platform_kilo")
				else
					set_pos(x,y,z, "block_xar_rocket_cave_battle_platform_kilo")
				end
			end
		end end 
	end    
end
