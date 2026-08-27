function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
    set_default_block("e")
    for x = 1,14 do
    for y = 1,14 do
		set_pos(x,y,1, "XAR_SOLID_BORING_CONCRETE_WHITE_BORDER")
	end end
    
end
