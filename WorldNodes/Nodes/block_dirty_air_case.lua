function p.__get_is_solid() return true end
function p.__get_tex() return "block_default" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_rect("XAR_ANTI_PLUG_GLASS", 0,1,1, 15,14,14)
    create_rect("XAR_ANTI_PLUG_GLASS", 1,0,1, 14,15,14)
    create_rect("XAR_ANTI_PLUG_GLASS", 1,1,0, 14,14,15)
    create_rect("dirty_air", 1,1,1, 14,14,14)
    add_bent_s(7,7,14, "bent_base_txt", "This is a cube filled with ^x00ff00Dirty Air^!.")
    set_pos(7,7,12, "XAR_SOLID_BORING_EXPANDER")
    set_pos(6,7,12, "simple_grow")
    set_pos(8,7,12, "simple_grow")
    set_pos(7,6,12, "simple_grow")
    set_pos(7,8,12, "simple_grow")
    add_bent(7,7,10, "bent_base_ring_green")
end