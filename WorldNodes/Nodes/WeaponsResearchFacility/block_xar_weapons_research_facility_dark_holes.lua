function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()

	set_default_block("block_e")
	std.create_edges("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER")
	
	add_bent(7,7,7,"bent_buy_dark_hole_50")
	
	
end