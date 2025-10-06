function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 7,7,0, 7,7,4)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 5,7,5, 9,7,5)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 7,5,5, 7,9,5)
    set_pos(5,7,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(7,5,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(7,9,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(9,7,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(7,7,7, "block_alphabet_flower_room")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 3,3,0, 3,3,3)
    add_bent_s(3,3,5,"bent_base_txt", "This is an ^x00ff00Alphabet Flower^!.\n\nYou will have to remember a code and solve a maze.")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 11,11,0, 11,11,3)
    add_bent(11,11,5,"bent_base_ring_green")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 11,3,0, 11,3,3)
    add_bent(11,3,5,"bent_base_ring_pink_dest")
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 3,11,0, 3,11,4)
    set_pos(3,11,5,"XAR_SOLID_BORING_EXPANDER")
    set_pos(3,11,6,"XAR_ASCEND_SIMPLE")
end
