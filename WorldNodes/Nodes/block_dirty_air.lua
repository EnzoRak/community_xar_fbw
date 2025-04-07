function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("dirty_air")
    if randi(1,2) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_health_20p")
    end
    if randi(1,50) == 1 then
        add_bent_s(randi(0,15),randi(0,15),randi(0,15), "bent_base_waypoint", "Dirty Air")
    end
    if randi(1,30) == 1 then
        set_pos(randi(0,15),randi(0,15),randi(0,15), "dirt")
    end
    if randi(1,30) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_green")
    end
    if randi(1,60) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_red")
    end
    if randi(1,30) == 1 then
        add_ment(randi(0,15),randi(0,15),randi(0,15), "ment_monster_mosquito_biblical")
    end
    if randi(1,600) == 1 then
        add_ment(randi(0,15),randi(0,15),randi(0,15), "ment_monster_scourge")
    end
    if randi(1,15) == 1 then
        add_ment(randi(0,15),randi(0,15),randi(0,15), "ment_monster_imp")
    end
end
