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
                add_bent(x,y,z,"bent_upgrade_gun_3_time")
            end
        end
    end
    
    add_bent(7,7,7,"bent_base_ring_green")
    add_bent(5,5,5,"bent_base_waypoint_out_only")
    add_bent_s(10,10,10,"bent_base_txt","Note: You should set a waypoint somewhere in I3 with easy access to a Pink Ring in case you decide to come back for ^xFF00FFthe secret on the floor.^!")
end