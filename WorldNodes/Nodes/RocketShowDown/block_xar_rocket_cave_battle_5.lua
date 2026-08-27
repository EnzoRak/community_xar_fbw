function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
	if randi(1,10) == 0 then
		add_bent(7,8,7, "bent_ammo_gun_7_large")
	elseif randi(1,12) == 1 then	
		add_bent(7,8,7, "bent_ammo_gun_4_large")
	end

    set_default_block("e")
    for enemySpawns = 0,7 do
        if randi(1,3) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_gremlin_minor")
		end
        if randi(1,200) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_nuclear_silo_compromised")
		end
        if randi(1,32) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_marine_hit_man")
		end
    end 
    
end
