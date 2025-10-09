function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_orange_border" end

function p.__main()
    set_default_block("mcl12")
    base_blue_tele.set_blue_type_down(7,7,7)
    set_pos(7,7,7,"empty_terminal")
    if randi(1,10) == 1 then
        set_pos(randi(0,15),randi(0,15),randi(0,15),"anomaly")
    end
end
