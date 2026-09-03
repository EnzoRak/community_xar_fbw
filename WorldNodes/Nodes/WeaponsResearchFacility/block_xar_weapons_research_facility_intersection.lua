function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_x" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_GLASS", 10,6,15, 14,14,15)
    create_rect("XAR_GLASS", 1,0,1, 14,0,5)
    create_rect("XAR_GLASS", 6,10,0, 9,14,0)
    create_rect("XAR_GLASS", 15,1,1, 15,14,5)
    create_rect("XAR_GLASS", 1,1,15, 5,14,15)
    create_rect("XAR_GLASS", 10,6,0, 14,14,0)
    create_rect("XAR_GLASS", 0,1,6, 0,5,14)
    create_rect("XAR_GLASS", 0,6,10, 0,14,14)
    create_rect("XAR_GLASS", 1,15,1, 14,15,5)
    create_rect("XAR_GLASS", 0,1,1, 0,14,5)
    create_rect("XAR_GLASS", 15,1,6, 15,5,14)
    create_rect("XAR_GLASS", 15,10,6, 15,14,9)
    create_rect("XAR_GLASS", 0,10,6, 0,14,9)
    create_rect("XAR_GLASS", 15,6,10, 15,14,14)
    create_rect("XAR_GLASS", 1,0,6, 5,0,14)
    create_rect("XAR_GLASS", 6,1,15, 14,5,15)
    create_rect("XAR_GLASS", 6,1,0, 14,5,0)
    create_rect("XAR_GLASS", 10,15,6, 14,15,9)
    create_rect("XAR_GLASS", 6,10,15, 9,14,15)
    create_rect("XAR_GLASS", 6,0,10, 14,0,14)
    create_rect("XAR_GLASS", 6,15,10, 14,15,14)
    create_rect("XAR_GLASS", 1,1,0, 5,14,0)
    create_rect("XAR_GLASS", 10,0,6, 14,0,9)
    create_rect("XAR_GLASS", 1,15,6, 5,15,14)
    create_rect("XAR_SOLID_BORING", 1,0,0, 15,0,0)
    create_rect("XAR_SOLID_BORING", 15,1,15, 15,15,15)
    create_rect("XAR_SOLID_BORING", 0,1,15, 0,15,15)
    create_rect("XAR_SOLID_BORING", 1,0,15, 14,0,15)
    create_rect("XAR_SOLID_BORING", 1,15,0, 14,15,0)
    create_rect("XAR_SOLID_BORING", 0,0,0, 0,15,0)
    create_rect("XAR_SOLID_BORING", 15,15,1, 15,15,14)
    create_rect("XAR_SOLID_BORING", 1,15,15, 14,15,15)
    create_rect("XAR_SOLID_BORING", 15,1,0, 15,15,0)
    create_rect("XAR_SOLID_BORING", 0,15,1, 0,15,14)
    create_rect("XAR_SOLID_BORING", 0,0,1, 0,0,15)
    create_rect("XAR_SOLID_BORING", 15,0,1, 15,0,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,6,6, 0,9,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 9,0,7, 9,0,8)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,6,0, 9,6,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,9,7, 0,9,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,6,15, 6,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 9,7,0, 9,9,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,9,0, 8,9,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,15,9, 9,15,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,15,7, 6,15,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 9,7,15, 9,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,6,7, 15,6,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,6,15, 9,6,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,9,15, 8,9,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 9,15,7, 9,15,8)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,9,7, 15,9,8)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,6,7, 0,6,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,7,9, 15,9,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,7,9, 0,8,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,0,6, 9,0,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,6,0, 6,9,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,6,6, 15,9,6)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,0,7, 6,0,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,0,9, 9,0,9)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,15,6, 9,15,6)
	if randi(1,2) == 1 then
		for x = 6,9,3 do
		for y = 6,9,3 do
		for z = 6,9,3 do
			add_bent(x,y,z, "bent_ammo_gun_0")
		end end end
	else
		for x = 6,9,3 do
		for y = 6,9,3 do
		for z = 6,9,3 do
			add_bent(x,y,z, "bent_ammo_gun_7_small")
		end end end
	end
end
