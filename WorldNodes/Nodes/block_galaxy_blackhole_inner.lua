function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("grow_air")
    local blocks = {
        "XAR_TAU_CAVE_MOON",
        "XAR_SPACE_MOON_ALPHA",
        "XAR_SPACE_MOON_GAMMA",
        "XAR_MOON_ICE",
        "XAR_SMALL_DARK_HOLE_MAZE",
        "XAR_SPACE_TOP_2_FORBIDDEN_PLANET_CASE"
    }
    if randi(1,20) == 1 then
        set_pos(randi(0,15),randi(0,15),randi(0,15), blocks[randi(1,#blocks)])
    end
    if randi(1,15) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_green")
    end
    if randi(1,60) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_red")
    end
end
