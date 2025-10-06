function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_purple_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_CONCRETE_PURPLE_BORDER")
    set_pos(7,7,7,"ywkey_entrance")
    set_pos(15,15,15,"XAR_EMPTY_BORING")
    set_pos(7,7,15,"ywkey_reqkey")
    add_bent_s(15,15,15,"bent_base_txt","^xff0000WARNING:^x00ff00 Yellow Key is required!\n\n^!Maybe you should come back later...")
    create_rect("XAR_YW_SMALL_ISLAND_AIR",1,1,1,14,14,5)
    create_rect("XAR_EMPTY_BORING",7,7,5,7,7,14)
    set_pos(7,7,6,"ywkey_wp")
    create_rect("XAR_YING_FOREST",1,1,1,14,14,1)
    for x = 1,14 do
        for y = 1,14 do
            if randi(1,10) == 1 then
                set_pos(x,y,1,"XAR_ORANGE")
            end
            if randi(1,15) == 1 then
                set_pos(x,y,1,"XAR_SMALL_WHITE_FLOWER")
            end
            if randi(1,30) == 1 then
                set_pos(x,y,1,"XAR_YING_FLOWER")
            end
        end
    end
end