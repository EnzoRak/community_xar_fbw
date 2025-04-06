function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("grp_air")
    if randi(1,60) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_red")
    end
    if randi(1,100) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_pink_source")
    end
    if randi(1,30) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_green")
    end
end
