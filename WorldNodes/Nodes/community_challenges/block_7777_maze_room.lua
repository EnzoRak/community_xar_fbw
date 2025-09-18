-- i thought about using blue ring for this but then i realized i needed to set terminal and down and up and all that typeof stuff, realized this was much simpler, even thinking about it. so I decided to do this instead. 
function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")

    --[[
    for x = 3, 12, 1 do       
        for y = 3, 12, 1 do
            for z = 3, 12, 1 do
                add_bent(x,y,z,"bent_gold_1000")
            end
        end
    end
    add_bent_s(2,2,2,"bent_base_txt","^x00FF00Repeatedly press your telekinesis button to clear all the gold!^!")
    add_bent_s(12,12,12,"bent_base_txt","^xFFFFFFMessage from me: \n\n\"As above, so below.\"\nThanks for playing through this challenge, hope you enjoyed!^!")
    --https://en.wikipedia.org/wiki/Emerald_Tablet#%D8%AD%D9%82%D9%8C%D9%91%20%D9%84%D8%A7%20%D8%B4%D9%83%D9%8E%D9%91%20%D9%81%D9%8A%D9%87%20%D8%B5%D9%8E%D8%AD%D9%8A%D8%AD%D8%8C%20%D8%A5%D9%86%D9%91%20%D8%A7%D9%84%D8%A3%D8%B9%D9%84%D9%89%20%D9%85%D9%86%20%D8%A7%D9%84%D8%A3%D8%B3%D9%81%D9%84%20%D9%88%D8%A7%D9%84%D8%A3%D8%B3%D9%81%D9%84%20%D9%85%D9%86%20%D8%A7%D9%84%D8%A3%D8%B9%D9%84%D9%89%D8%8C
    set_pos(1,1,14,"XAR_ASCEND_TEMPLE_ABOVE")
    --minus 1000 negative aura.
    add_bent(8,0,8,"bent_pic_magician")
    ]]
end


function p.__type_init(id)
    --String with length (2x-1)(2y-1)(2z-1)w
    ia_block_new_var_s(id, "maze_encoded", "")
    --A,B,C,D
    ia_block_new_var_s(id, "open_4d_id", "")
    --should be equal to the parent maze depth 
    ia_block_new_var_i(id, "room_w_depth", 0)
end
