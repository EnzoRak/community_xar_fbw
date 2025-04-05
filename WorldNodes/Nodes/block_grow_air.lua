function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("grow_air")
    if randi(1,15) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_red")
    end
end
