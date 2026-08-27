function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()

    set_default_block("e")
    for enemySpawns = 0,3 do
        if randi(1,8) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_menace")
		end
        if randi(1,6) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_marine_light")
		end
    end 
    
end
