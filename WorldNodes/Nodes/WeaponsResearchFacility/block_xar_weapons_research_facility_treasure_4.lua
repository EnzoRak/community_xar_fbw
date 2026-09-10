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
	for z = 3,13,2 do
		add_bent(1,14,z,"bent_upgrade_gun_9_damage")
	end 
	for z = 3,13,2 do
		add_bent(14,14,z,"bent_upgrade_gun_9_ammo_cap")
	end 
	for z = 3,13,2 do
		add_bent(14,1,z,"bent_upgrade_gun_9_radius")
	end 
	for z = 3,13,2 do
		add_bent(1,1,z,"bent_upgrade_gun_9_ammo_cap")
	end 
	add_bent(8,8,5, "bent_gold_once_100")
    add_bent(8,8,10,"bent_base_save")
    add_bent_s(8,8,12,"bent_cxar_trophy","wrf")

end
