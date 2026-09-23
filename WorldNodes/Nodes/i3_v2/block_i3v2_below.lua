function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_green_border" end

function p.__main()
    create_xar_chunk("XAR_GROUP_3_BELOW")
    create_rect("i3v2_giga",1,1,7,14,14,7)
    set_pos(7,7,7,"i3v2_entrance_0")
end