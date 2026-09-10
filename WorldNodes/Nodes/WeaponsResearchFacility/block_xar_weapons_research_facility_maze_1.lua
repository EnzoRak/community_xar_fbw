function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_dark_concrete_orange_border"
end


function p.__main()
    set_default_block("block_xar_weapons_research_facility_maze_2")
	for x = 0,15 do
	for y = 0,15 do
		set_pos(x,y,4,"block_xar_weapons_research_facility_pre5")
		set_pos(x,y,0,"XAR_DESCEND_SIMPLE")
		set_pos(x,y,3,"XAR_ASCEND_SIMPLE_2")
		for z = 1,2 do
			set_pos(x,y,z,"XAR_EMPTY_BORING")
		end
	end end

	set_pos(0,0,5,"block_xar_weapons_research_facility_maze_2_alt")
end


