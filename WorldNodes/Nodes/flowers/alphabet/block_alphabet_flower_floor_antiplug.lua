function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_ANTI_PLUG_CHILD",0,0,0,15,15,0)
    add_bent(7,7,7,"bent_base_ring_red")
    create_rect("alphabet_flower_floor_antiplug",0,0,15,15,15,15)
end