function p.__get_is_solid() return true end
function p.__get_tex() return "block_pink" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_PINK")
    create_rect("XAR_EMPTY_BORING", 0,1,1, 15,14,14)
    create_rect("XAR_EMPTY_BORING", 1,0,1, 14,15,14)
    create_rect("XAR_EMPTY_BORING", 1,1,0, 14,14,15)
    add_bent(7,7,6, "bent_base_ring_pink_source")
    set_pos(7,7,8, "pink_out")
end
