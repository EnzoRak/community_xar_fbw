function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("infinity_database_space_inner")
    if randi(1,5) == 1 then
        local x,y,z = randi(1,14),randi(1,14),randi(1,14)
        set_pos(x,y,z,"XAR_SOLID_BORING_EXPANDER")
        set_pos(x,y,z+1,"XAR_ASCEND_SIMPLE")
    end
    if randi(1,10) == 1 then
        add_bent(randi(1,15),randi(1,15),randi(1,15),"bent_base_ring_green")
    end
    if randi(1,20) == 1 then
        add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_overlord")
    end
    srand(seed_yz())
    if randi(1,4) == 1 then
        local x,y = randi(0,15),randi(0,15)
        create_rect("infinity_database_pillar",0,x,y,15,x,y)
    end
end