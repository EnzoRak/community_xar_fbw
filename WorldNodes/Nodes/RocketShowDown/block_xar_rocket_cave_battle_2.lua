function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()

    set_default_block("e")
	if randi(1,12) == 1 then
		add_bent(7,8,7, "bent_ammo_gun_4_large")
	end
    for enemySpawns = 0,2 do
        if randi(1,7) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_demon")
		end
        if randi(1,4) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_menace")
		end
        if randi(1,120) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_goon_despicable")
		end
    end 
    
end
