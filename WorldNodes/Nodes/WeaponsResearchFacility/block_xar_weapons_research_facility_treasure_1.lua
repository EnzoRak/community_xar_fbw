function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_yellow_x"
end

function p.__main()
    set_default_block("e")
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
	for x = 7,9,2 do
	for y = 7,9,2 do
		add_bent(x,y,8,"bent_upgrade_gun_8_radius")

	add_bent(8,8,5, "bent_gold_once_100")
    add_bent(8,8,10,"bent_base_save")
	end end

end
