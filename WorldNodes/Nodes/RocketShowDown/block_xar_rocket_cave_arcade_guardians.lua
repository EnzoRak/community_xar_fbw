function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING", 1,15,0, 15,15,0)
    create_rect("XAR_SOLID_BORING", 1,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING", 15,0,1, 15,0,14)
    create_rect("XAR_SOLID_BORING", 15,1,0, 15,14,0)
    create_rect("XAR_SOLID_BORING", 1,0,0, 15,0,0)
    create_rect("XAR_SOLID_BORING", 0,0,1, 0,0,15)
    create_rect("XAR_SOLID_BORING", 15,1,15, 15,15,15)
    create_rect("XAR_SOLID_BORING", 0,0,0, 0,15,0)
    create_rect("XAR_SOLID_BORING", 1,15,15, 14,15,15)
    create_rect("XAR_SOLID_BORING", 15,15,1, 15,15,14)
    create_rect("XAR_SOLID_BORING", 0,15,1, 0,15,15)
    create_rect("XAR_SOLID_BORING", 0,1,15, 0,14,15)
	if randi (1,4) == 1 then
		add_ment(7,7,7, "ment_monster_lamprey_red")
	else
		add_ment(7,7,7, "ment_monster_lamprey")
	end
end