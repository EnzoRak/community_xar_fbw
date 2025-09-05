function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    add_env_rect(14,14,15,15,15,15,"env_rect_death_key_yellow")
    add_env_rect(14,15,14,15,15,14,"env_rect_death_key_yellow")
    add_env_rect(15,14,14,15,14,14,"env_rect_death_key_yellow") 
    create_rect("XAR_SOLID_BORING_YOU_ARE_HERE",0,0,0,15,15,15)
    create_rect("XAR_STOPPER",14,14,14,15,15,15)
    --replace?
    create_rect("XAR_EMPTY_BORING",1,1,0,14,14,14)
    create_rect("XAR_RAINBOW_FLOWER_SOLID",1,0,2,1,0,14)
    create_rect("XAR_RAINBOW_FLOWER_SOLID",0,1,2,0,1,14)
    create_rect("XAR_RAINBOW_FLOWER_SOLID",2,1,2,2,1,14)
    create_rect("XAR_RAINBOW_FLOWER_SOLID",1,2,2,1,2,14)
    create_rect("XAR_RAINBOW_FLOWER_INVISIBLE",1,1,1,14,14,1)
    --the necessary secret in question
    create_rect("XAR_GUNS",1,1,0,14,14,0)
    for x = 3, 12, 1 do       
        for y = 3, 12, 1 do
            for z = 3, 12, 1 do
                add_bent(x,y,z,"bent_gold_1000")
            end
        end
    end
    add_bent_s(2,2,2,"bent_base_txt","^x00FF00Repeatedly press your telekinesis button to clear all the gold!^!")
    add_bent(7,7,7,"bent_base_ring_green")
    add_bent(5,5,5,"bent_base_waypoint_out_only")
    add_bent_s(10,10,10,"bent_base_txt","Note: You should set a waypoint somewhere in I3 with easy access to a Pink Ring in case you decide to come back for ^xFF00FFthe secret.^!")
    add_bent_s(12,12,12,"bent_base_txt","^xFFFFFFMessage from me: \n\n\"As above, so below.\"\nThanks for playing through this challenge, hope you enjoyed!^!")
    --https://en.wikipedia.org/wiki/Emerald_Tablet#%D8%AD%D9%82%D9%8C%D9%91%20%D9%84%D8%A7%20%D8%B4%D9%83%D9%8E%D9%91%20%D9%81%D9%8A%D9%87%20%D8%B5%D9%8E%D8%AD%D9%8A%D8%AD%D8%8C%20%D8%A5%D9%86%D9%91%20%D8%A7%D9%84%D8%A3%D8%B9%D9%84%D9%89%20%D9%85%D9%86%20%D8%A7%D9%84%D8%A3%D8%B3%D9%81%D9%84%20%D9%88%D8%A7%D9%84%D8%A3%D8%B3%D9%81%D9%84%20%D9%85%D9%86%20%D8%A7%D9%84%D8%A3%D8%B9%D9%84%D9%89%D8%8C
    set_pos(1,1,14,"XAR_ASCEND_TEMPLE_ABOVE")
end