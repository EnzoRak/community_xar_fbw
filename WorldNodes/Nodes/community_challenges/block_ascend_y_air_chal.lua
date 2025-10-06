function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("block_ascend_y_air_chal_SUB")
    add_bent_s(7,7,7,"bent_base_txt","^xFF00FFThe Yellow Air Challange^!\n\nGet lucky with your ring picks to ascend out of the deep yellow air!\n\n\n^xFFFF00Note: The Yellow Rings always trigger first before transforming into the ring it behaved like. This is for your convenience so you don't have to memorize which one was which.^!")
    add_bent(7,7,3,"bent_base_ring_blue")
    base_blue_tele.set_blue_type_down(7,7,7)
    set_pos(7,7,0,"block_ascend_y_air_chal_treasure")
end