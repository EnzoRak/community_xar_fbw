function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    if randi(1,2)==1 then
        add_ment(randi(2,13),randi(2,13),randi(2,13),"ment_monster_hornet")
    end
    add_ment(randi(2,13),randi(2,13),randi(2,13),"ment_monster_plague")
    if randi(1,10)==1 then
        add_ment(7,7,7,"ment_monster_menace_vile")
    end
end