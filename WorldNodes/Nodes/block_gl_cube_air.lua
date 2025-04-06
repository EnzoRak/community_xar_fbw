function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    add_ment(randi(0,15),randi(0,15),randi(0,15), "ment_monster_guardian")
end