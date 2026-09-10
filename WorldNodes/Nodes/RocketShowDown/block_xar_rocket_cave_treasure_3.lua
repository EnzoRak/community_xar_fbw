function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_border"
end

function p.__main()

    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,9,0, 9,9,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 9,7,0, 9,8,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 6,6,0, 6,9,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 7,6,0, 9,6,0)
    create_rect("XAR_SOLID_BORING", 1,0,15, 15,15,15)
    create_rect("XAR_SOLID_BORING", 15,1,1, 15,15,14)
    create_rect("XAR_SOLID_BORING", 6,10,0, 9,15,0)
    create_rect("XAR_SOLID_BORING", 1,15,1, 14,15,14)
    create_rect("XAR_SOLID_BORING", 0,0,1, 0,15,15)
    create_rect("XAR_SOLID_BORING", 0,0,0, 5,15,0)
    create_rect("XAR_SOLID_BORING", 10,6,0, 15,15,0)
    create_rect("XAR_SOLID_BORING", 1,0,1, 15,0,14)
    create_rect("XAR_SOLID_BORING", 6,0,0, 15,5,0)
    add_bent(7,7,7,"bent_base_save")
	add_bent(2,13,13,"bent_base_ring_pink_source")
	add_bent_s(13,13,13,"bent_base_txt","^x00ff00Did you have fun? Going back to the simpler times when you only had a Plasma weapon.\n\nWell, it probably didn't take you very long to get back your Cannon, then Laser, etc. Still, it's nice to look back.\n\nAnd see, how far we have come.^!")
	add_bent_s(2,13,11,"bent_base_txt","These ^xff00ffPink Rings^! will bring you to the outside of this Rocket Showdown Cave.")
	add_bent_s(13,13,11,"bent_cxar_trophy","rocketshowdowncave")
	for x = 11,13,2 do
	for y = 11,13,2 do
	for z = 3,9,2 do
		add_bent(x,y,z,"bent_upgrade_gun_4_damage")
	end end end
	for x = 2,13,11 do
	for z = 3,9,2 do
		if x == 13 then
			add_bent(x,2,z,"bent_upgrade_gun_8_radius")
		else
			add_bent(x,2,z,"bent_upgrade_gun_9_damage")
		end
	end end 
end