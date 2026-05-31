function p.__get_is_solid() return true end
function p.__get_tex() return "block_infinity_green" end

function p.__main()
    set_default_block("XAR_GLASS")
    std.create_edges("XAR_SOLID_BORING_INFINITY_GREEN")
    create_rect("XAR_SOLID_BORING",0,6,6,15,9,9)
    create_rect("XAR_SOLID_BORING",6,0,6,9,15,9)
    create_rect("XAR_SOLID_BORING",6,6,0,9,9,15)
    create_rect("XAR_ANTI_PLUG_GLASS",0,7,7,15,8,8)
    create_rect("XAR_ANTI_PLUG_GLASS",7,0,7,8,15,8)
    create_rect("XAR_ANTI_PLUG_GLASS",7,7,0,8,8,15)
    create_rect("infinity_database_space",1,1,1,14,14,14)
    local x,y,z = randi(1,14),randi(1,14),randi(1,13)
    set_pos(x,y,z,"XAR_SOLID_BORING_EXPANDER")
    set_pos(x,y,z+1,"XAR_ASCEND_SIMPLE")
    add_bent(7,7,7,"bent_base_ring_green")
    set_pos(7,7,7,"infinity_database_shrink")
    base_blue_tele.set_blue_type_terminal(7,7,7)
end
