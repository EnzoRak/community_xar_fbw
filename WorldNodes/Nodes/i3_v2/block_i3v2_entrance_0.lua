function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_green_border" end

function p.__main()
    create_xar_chunk("XAR_GROUP_3_ENTRANCE_0")
    create_rect("i3v2_mega",0,0,7,15,15,7)
    set_pos(7,7,7,"i3v2_entrance_1")
end