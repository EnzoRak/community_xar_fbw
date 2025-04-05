function p.__get_is_solid() return true end
function p.__get_tex() return "block_light_green_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_LIGHT_GREEN_BORDER")
    create_rect("XAR_EMPTY_BORING", 1,1,1, 14,14,12)
    create_rect("XAR_EMPTY_BORING", 7,7,13, 7,7,15)
    set_pos(15,15,15, "XAR_EMPTY_BORING")
    add_bent(15,15,15, "bent_base_ring_pink_dest")
    set_pos(7,7,15, "XAR_ANTI_PLUG_GLASS")
    set_pos(7,7,14, "gl_cube_info")
    add_bent(7,7,14, "bent_base_ring_green_danger")
    set_pos(7,7,13, "XAR_BRISTOL_ONE_WAY_Z_NEG")
    set_pos(7,7,5, "pink_out")
    add_ment(7,7,6, "ment_monster_sliver_major")
    set_pos(0,0,0, "gl_cube")
    set_pos(7,7,4, "XAR_SOLID_BORING_EXPANDER")
    set_pos(6,7,4, "simple_grow")
    set_pos(8,7,4, "simple_grow")
    set_pos(7,6,4, "simple_grow")
    set_pos(7,8,4, "simple_grow")
    add_bent(7,7,3, "bent_base_ring_green")
end