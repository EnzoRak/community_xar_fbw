function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("galaxy_blackhole_inner")
    if randi(1,5) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15), "bent_base_ring_green")
    end
    local blocks = {
        "XAR_PLANET_CLAY",
        "XAR_SMALL_MINIGUN_PLANET",
    }
    if randi(1,50) == 1 then
        set_pos(randi(0,15),randi(0,15),randi(0,15), blocks[randi(1,#blocks)])
    end
end