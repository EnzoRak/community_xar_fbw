function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_GLASS")
    std.create_edges("XAR_SOLID_BORING_INFINITY_GREEN")
    create_rect("XAR_STOPPER",0,6,6,15,9,9)
    create_rect("XAR_STOPPER",6,0,6,9,15,9)
    create_rect("XAR_STOPPER",6,6,0,9,9,15)
    create_rect("XAR_EMPTY_BORING",1,1,1,14,14,14)
    add_bent(1,7,7,"bent_base_ring_green")
    add_bent(14,7,7,"bent_base_ring_green")
    add_bent(7,1,7,"bent_base_ring_green")
    add_bent(7,14,7,"bent_base_ring_green")
    add_bent(7,7,1,"bent_base_ring_green")
    add_bent(7,7,14,"bent_base_ring_green")
    add_bent(13,13,13,"bent_base_ring_pink_source")
    add_bent_s(2,2,2,"bent_cxar_trophy","inf_data")
end
