function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
    set_default_block("XAR_DESERT_AIR")
	create_xar_chunk("XAR_DESERT_ABOVE")
	-- bug fix: guy really used z instead of 0 and then i got an error because of that
	for x = 0,15 do
	for y = 0,15 do
		if ( get_pos(x,y,0) == "XAR_DESERT_ABOVE" ) and randi (1,128) == 1 and randi (1,128) == 1 then
			set_pos(x,y,0, "block_xar_rocket_cave_redux")
		end
	end end 

end
