function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_yellow_x"
end

function p.__main()
    set_default_block("e")
	create_xar_chunk("XAR_RAIL_CAVE_TREASURE_1")
	for x = 2,11 do
	for y = 2,11 do
	for z = 2,11 do
		if ( get_pos(x,y,z) == "XAR_EMPTY_BORING" ) and randi (1,67) == 1 then
			add_ment(x,y,z,"ment_monster_lamprey")
		end
	end end end

	add_ment(8,8,5,"ment_monster_overclocked_watchman")
    set_pos(7,7,6, "block_xar_rocket_cave_treasure_2")
    set_pos(7,7,7, "block_xar_rocket_cave_treasure_3")

end
