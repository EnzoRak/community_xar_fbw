function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_border" end

function p.__main()
    set_default_block("block_xar_weapons_research_facility_pre3")
	for x = 0,15 do
	for y = 0,15 do
		set_pos(x,y,0,"block_xar_weapons_research_facility_pre4")
	end end
end