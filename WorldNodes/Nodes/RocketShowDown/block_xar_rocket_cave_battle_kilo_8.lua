function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()


    set_default_block("block_xar_rocket_cave_battle_8")
    for x = 0,15 do
    for y = 0,15 do
    for z = 0,15 do
        if randi(1,3) == 1 then
			set_pos(x,y,z, "XAR_SOLID_BORING_CONCRETE_WHITE_BORDER")
			if randi(1,2) == 1 and z > 0 then
				set_pos(x,y,z-1, "XAR_SOLID_BORING_CONCRETE_WHITE_BORDER")
			end

		elseif randi(1,256) == 1 then
			add_ment(x,y,z,"ment_monster_enforcer")
		end
    end end end
    
end
