function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_dark_concrete_blue_border"
end

function p.__main()
	set_default_block("e")
	create_xar_chunk("XAR_FANATIC_LATTICE")
	local fanaticLatticeDepth = 0
	pathLength = get_input_path_length()
	
	
	BTS = get_input_path_bts()
	
	for i = 0,pathLength do
		block_type = BTS[i].name
		if block_type == "XAR_FANATIC_LATTICE" or block_type == "block_xar_fanatic_l" then
			fanaticLatticeDepth = fanaticLatticeDepth + 1
		end
	end
	
	
	local clampedDepth = math.min(math.max(fanaticLatticeDepth, 0), 9) + 1
	
	
	if fanaticLatticeDepth > 9 then
		for x = 0,15 do
		for y = 0,15 do
		for z = 0,15 do
			if get_pos(x,y,z) == "XAR_FANATIC_WEED" and 
			randi(1,500) == 1 then
			
				set_pos(x,y,z, "block_xar_weapons_research_facility")
			
			end
			
		end end end
	end
	
	local enemies = {
		enemyTypes = {
		"ment_monster_gnoll", 
		"ment_monster_demon",
		"ment_monster_orc",
		"ment_monster_menace_arch_female",
		"ment_monster_menace_arch_female",
		"ment_monster_guardian_minor",
		"ment_monster_guardian_minor",
		"ment_monster_guardian",
		"ment_monster_guardian",
		"ment_monster_majorguard"
		}}
	for x = 2,15,4 do
	for y = 2,15,4 do
	for z = 2,15,4 do
		if randi(1,100 + 15 * clampedDepth - clampedDepth*clampedDepth) == 1 then
			add_ment(x,y,z,enemies.enemyTypes[clampedDepth])
		end
	end end end

end

