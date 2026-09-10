function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_yellow_x"
end

function p.__main()
    set_default_block("e")
	for x = 1,14,13 do
	for y = 3,12,9 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_8_radius")
	end end end
	for x = 3,12,9 do
	for y = 1,14,13 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_9_damage")
	end end end
	for x = 1,14,13 do
	for y = 1,14,13 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_8_damage")
	end end end
	add_bent(7,7,5, "bent_gold_once_1000")
    add_bent(7,7,7,"bent_base_save")
    add_bent_s(7,7,9,"bent_cxar_trophy","wrfsecret1")
	

	add_bent_s(7,7,11,"bent_base_txt","^x0000ffThe only way to reach this point is via a Pink Ring. Now that you've proven your Inner Botany knowledge, I will tell you a shortcut to reach here faster.\n\nTo find a pink ring easily, check one of the corners in the maze containing True Guardians. It's easier when you have grown at least once after completing the maze.^!")

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

end
