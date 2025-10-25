
function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_blue_border" end

function p.__main()
    --temp
    --set the treasure room inside of 7,7,7
    set_default_block("block_ascend_y_air_chal_SUB")
    ment_start(7,7,7, "ment_dream_core")
    local game_time = get_game_time()
    local len = 99999*60*60
    ment_set_f("__game_end_time", game_time + len)
    ment_end()
    --idk man
    base_blue_tele.set_blue_type_down(7,7,9)
end