function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
	if randi(1,16) == 1 then
		add_bent(7,8,7, "bent_ammo_gun_8")
	elseif randi(1,12) == 1 then	
		add_bent(7,8,7, "bent_ammo_gun_4_large")
	end
    set_default_block("e")
    for enemySpawns = 0,7 do
        if randi(1,6) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_goliath")
		end
        if randi(1,16) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_guardian")
		end
        if randi(1,20) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_hobgoblin")
		end
        if randi(1,6) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_orc")
		end
    end 
    
end
