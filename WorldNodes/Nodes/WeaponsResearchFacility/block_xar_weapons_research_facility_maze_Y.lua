function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_GLASS", 6,1,15, 14,5,15)
    create_rect("XAR_GLASS", 1,1,0, 14,14,0) --Floor
	
	
	--Ceiling
    create_rect("XAR_GLASS", 6,10,15, 9,14,15)
    create_rect("XAR_GLASS", 6,1,15, 14,5,15)
    create_rect("XAR_GLASS", 1,1,0, 14,14,0)
    create_rect("XAR_GLASS", 10,6,15, 14,14,15)
    create_rect("XAR_GLASS", 1,1,15, 5,14,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,6,15, 9,6,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 9,7,15, 9,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,6,15, 6,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,9,15, 8,9,15)
	
    create_rect("XAR_GLASS", 15,1,1, 15,14,14)
    create_rect("XAR_GLASS", 0,1,1, 0,14,14)
    create_rect("XAR_SOLID_BORING", 0,0,0, 0,15,0)
    create_rect("XAR_SOLID_BORING", 15,1,15, 15,15,15)
    create_rect("XAR_SOLID_BORING", 1,0,0, 15,0,0)
    create_rect("XAR_SOLID_BORING", 1,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING", 0,1,15, 0,15,15)
    create_rect("XAR_SOLID_BORING", 1,15,0, 15,15,0)
    create_rect("XAR_SOLID_BORING", 1,15,15, 14,15,15)
    create_rect("XAR_SOLID_BORING", 0,15,1, 0,15,14)
    create_rect("XAR_SOLID_BORING", 0,0,1, 0,0,15)
    create_rect("XAR_SOLID_BORING", 15,0,1, 15,0,14)
    create_rect("XAR_SOLID_BORING", 15,1,0, 15,14,0)
    create_rect("XAR_SOLID_BORING", 15,15,1, 15,15,14)
	
	if randi(1,10) == 1 then
		add_bent(7,7,7, "bent_ammo_gun_0")
	elseif randi(1,8) == 1 then
		add_bent(7,7,7, "bent_health_mega")
	elseif randi(1,16) == 1 then
		add_bent(7,7,7, "bent_ammo_gun_7_small")
	elseif randi(1,16) == 1 then
		add_bent(7,7,7,"bent_base_save")
	end
end