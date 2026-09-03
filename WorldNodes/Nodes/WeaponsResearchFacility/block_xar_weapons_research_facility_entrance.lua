function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 0,0,0, 6,15,2)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 8,8,0, 15,15,2)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 7,0,0, 15,7,2)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 7,9,0, 7,15,2)
	set_pos(7,8,0,"block_xar_weapons_research_facility_cave_0")
	set_pos(7,8,1,"block_xar_weapons_research_facility_maze_1")
	set_pos(7,8,2,"block_xar_weapons_research_facility_pre")
	set_pos(7,8,3,"XAR_ASCEND_SIMPLE")
	add_bent(7,8,2,"bent_base_ring_green")
	
	add_bent_s(7,8,7,"bent_base_txt","After you shrink twice, keep going down and solve the maze. It will be populated by One Balls.\n\nFurther down will be a maze with many True Guardians. Don't stay in the open for too long.\n\nAt the end of that, you will be able to access the Weapon Research Facility, populated by various monsters.")
end