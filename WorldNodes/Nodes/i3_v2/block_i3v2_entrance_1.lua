function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_green_border" end

function p.__main()
    --create_xar_chunk("XAR_GROUP_3_ENTRANCE_1")
    block_i3v2_mega.__main(true)
    set_pos(7,7,8,"XAR_GROUP_3_ENTRANCE_2")
    create_rect("XAR_APPLE_TREE_STEM_2",7,7,9,7,7,11)
    set_pos(7,7,12,"e")
    add_bent(7,7,12,"bent_base_ring_green")
    create_rect("e",6,6,13,8,8,15)
end