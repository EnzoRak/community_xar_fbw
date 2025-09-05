function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    local level = get_level()
    if(level>0 and get_input_path_bt(level - 1) == "block_pool_challenge")then
        if(level>1 and get_input_path_bt(level-2) == "block_pool_challenge") then
            local path = get_input_path()
            local pvp = path[get_input_path_length()-1]
            local pvpminusone = path[get_input_path_length()-2]
            base_blue_tele.set_blue_type_terminal(7,7,7)
            --[[
            add_bent_s(7,7,7,"bent_base_txt",""..pvp.x .. " " .. pvp.y .. " " .. pvp.z)
            add_bent_s(7,7,5,"bent_base_txt",""..pvpminusone.x .. " " .. pvpminusone.y .. " " .. pvpminusone.z)
            ]]--
            local sumpvpminusone = pvpminusone.x + pvpminusone.y + pvpminusone.z
            if(sumpvpminusone == 45) then
                if(pvp.x == 15 and pvp.y == 15 and pvp.z == 15) then
                    add_env_rect(0,0,0,15,15,15,"env_rect_take_ammo")
                else
                    local rand = randf()
                    if(rand<0.04) then 
                        add_bent(7,7,7,"bent_ammo_gun_0")
                    else
                        add_bent(7,7,7,"bent_ammo_gun_8")
                    end
                end
            elseif(sumpvpminusone >= 40) then
                add_ment(7,7,7,"ment_monster_pool_ball_1")
            elseif(sumpvpminusone >= 36) then
                add_ment(7,7,7,"ment_monster_pool_ball_2")
            elseif(sumpvpminusone >= 31) then
                add_ment(7,7,7,"ment_monster_pool_ball_3")
            elseif(sumpvpminusone >= 26) then
                add_ment(7,7,7,"ment_monster_pool_ball_4")
            elseif(sumpvpminusone >= 20) then
                add_ment(7,7,7,"ment_monster_pool_ball_5")
            elseif(sumpvpminusone >= 14) then
                add_ment(7,7,7,"ment_monster_pool_ball_6")
            elseif(sumpvpminusone >= 8) then
                add_ment(7,7,7,"ment_monster_pool_ball_7")
            elseif(sumpvpminusone >= 1) then
                add_ment(7,7,7,"ment_monster_pool_ball_8")
            else
                --nothing idk
            end
            return;
        end
        --this line probably doesn't matter because the won't be any other blue rings in here. 
        base_blue_tele.set_blue_type_down(15,15,15)
        create_rect("block_pool_challenge",0,0,0,15,15,15)
        return;
    end
    add_bent_s(7,7,10,"bent_base_txt","Use the blue ring to take you to the entrance room to the Pool Balls Challenge. \n\nThe treasure will be in the direct opposite corner of this massive Megachunk, where that Pink Sphere is currently.\n\n^xFF0000Note: You will lose all your ammo when you enter, but there is some EMP ammo and Dark Hole recharges at the start. \n\nI recommend having more than 120 EMP Max Ammo for this and Black Hole Drive unlocked. ^!\n\n^xFFFF00 Oh, and also you need a Yellow Key to enter the treasure room.^!")
    add_bent(7,7,6,"bent_base_ring_blue")
    add_bent(0,0,0,"bent_base_ring_pink_dest")
    create_rect("block_pool_challenge",0,0,0,15,15,15)
    set_pos(0,0,0,"block_pc_treasure")
    base_blue_tele.set_blue_type_down(15,15,15)
end
