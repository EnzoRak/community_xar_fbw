function p.__get_is_solid() return true end
function p.__get_tex() return "block_i3_green" end

function p.__main()
    set_default_block("e")
    set_pos(8,7,8,"i3v2_above_green")
    set_pos(7,7,8,"i3v2_above_yellow")
    create_rect("i3v2_below",7,7,7,8,7,7)
end