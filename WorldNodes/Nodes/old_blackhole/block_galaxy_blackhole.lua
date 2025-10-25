function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_red_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_CONCRETE_RED_BORDER")
    create_rect("XAR_SOLID_BORING_BLACK", 0,1,1, 15,14,14)
    create_rect("XAR_SOLID_BORING_BLACK", 1,0,1, 14,15,14)
    create_rect("XAR_SOLID_BORING_BLACK", 1,1,0, 14,14,15)
    create_rect("galaxy_blackhole_inner_kilo", 1,1,1, 14,14,14)
    create_sprinkles(1,1,15, 14,14,15, 0.5, "galaxy_blackhole_enter")
    set_pos(randi(1,14),randi(1,14),randi(1,14), "XAR_SPACE_SUN")
    --set_pos(7,7,7, "pink_out")
    set_pos(15,15,15, "XAR_EMPTY_BORING")
    add_bent(15,15,15, "bent_base_ring_pink_dest")
    set_pos(0,0,15, "XAR_EMPTY_BORING")
    add_bent_s(0,0,15, "bent_base_txt", "This is a ^x00ff00Supermassive Black Hole^!.")
end