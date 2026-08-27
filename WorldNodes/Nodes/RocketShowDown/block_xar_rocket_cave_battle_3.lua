function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
	if randi(1,12) == 1 then
		add_bent(7,8,7, "bent_ammo_gun_6_large")
	end
    set_default_block("e")
    for enemySpawns = 0,4 do
        if randi(1,8) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_marine")
		end
        if randi(1,8) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_menace_vile")
		end
    end 
    
end
