function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
	if randi(1,32) == 1 then
		add_bent(7,8,7, "bent_ammo_gun_8")
	end
    set_default_block("e")
    for enemySpawns = 0,7 do
        if randi(1,5) == 1 then
			add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_lamprey_blue")
		end
    end 
    
end
