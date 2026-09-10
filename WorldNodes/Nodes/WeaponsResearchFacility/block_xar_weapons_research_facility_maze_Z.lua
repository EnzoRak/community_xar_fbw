function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_GLASS", 15,1,1, 15,14,14)
    create_rect("XAR_GLASS", 0,1,1, 0,14,14)
	create_rect("XAR_GLASS", 1,15,1, 14,15,14)
    create_rect("XAR_GLASS", 1,0,1, 14,0,14)
    create_rect("XAR_SOLID_BORING", 15,1,0, 15,14,0)
    create_rect("XAR_SOLID_BORING", 1,0,0, 15,0,0)
    create_rect("XAR_SOLID_BORING", 0,15,1, 0,15,15)
    create_rect("XAR_SOLID_BORING", 1,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING", 1,15,0, 15,15,0)
    create_rect("XAR_SOLID_BORING", 1,15,15, 14,15,15)
    create_rect("XAR_SOLID_BORING", 15,1,15, 15,15,15)
    create_rect("XAR_SOLID_BORING", 0,1,15, 0,14,15)
    create_rect("XAR_SOLID_BORING", 15,0,1, 15,0,14)
    create_rect("XAR_SOLID_BORING", 15,15,1, 15,15,14)
    create_rect("XAR_SOLID_BORING", 0,0,0, 0,15,0)
    create_rect("XAR_SOLID_BORING", 0,0,1, 0,0,15)
	
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