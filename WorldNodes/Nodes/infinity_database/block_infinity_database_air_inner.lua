function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    local x,y,z = randi(1,15),randi(1,15),randi(1,15)
    set_pos(x,y,z,"infinity_database")
    base_blue_tele.set_blue_type_down(x,y,z)
    if randi(1,10) == 1 then
        add_bent(randi(1,15),randi(1,15),randi(1,15),"bent_base_ring_green")
    end
    if randi(1,20) == 1 then
        add_ment(randi(1,15),randi(1,15),randi(1,15),"ment_monster_laboratory")
    end
end