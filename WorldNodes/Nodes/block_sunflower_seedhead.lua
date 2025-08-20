function p.__get_is_solid() return true end
function p.__get_tex() return "block_sun" end

function p.__main()
    set_default_block("block_sunflower_seedhead")
    if(get_input_path_block_var_exists(get_level()-1,"sundirection","i")) then
        local sundirection = get_input_path_block_i(get_level()-1, "sundirection")
        if(sundirection ~= -1) then
            local function coolsprinkles(min_x,min_y,min_z,max_x,max_y,max_z,prob,type)
                for x = min_x,max_x do
                    for y = min_y,max_y do
                        for z = min_z,max_z do
                            if( randf() < prob ) then
                                set_pos(x,y,z, type)
                                block_set_i(x,y,z, "sundirection", sundirection)
                            end
                        end
                    end
                end 
            end
            if(sundirection == 0)then
                coolsprinkles(15,1,1,15,14,14,0.08,"block_sunflower_spot")
                create_rect("XAR_BRISTOL_ONE_WAY_BIG_X_NEG",0,1,1,0,14,14)
                set_pos(7,0,7,"XAR_BRISTOL_ONE_WAY_Y_POS")
                set_pos(7,15,7,"XAR_BRISTOL_ONE_WAY_Y_NEG")
            elseif(sundirection == 1)then
                coolsprinkles(0,1,1,0,14,14,0.08,"block_sunflower_spot")
                create_rect("XAR_BRISTOL_ONE_WAY_BIG_X_POS",15,1,1,15,14,14)
                set_pos(7,0,7,"XAR_BRISTOL_ONE_WAY_Y_POS")
                set_pos(7,15,7,"XAR_BRISTOL_ONE_WAY_Y_NEG")
            elseif(sundirection == 2)then
                coolsprinkles(1,15,1,14,15,14,0.08,"block_sunflower_spot")
                create_rect("XAR_BRISTOL_ONE_WAY_BIG_Y_NEG",1,0,1,14,0,14)
                set_pos(0,7,7,"XAR_BRISTOL_ONE_WAY_X_POS")
                set_pos(15,7,7,"XAR_BRISTOL_ONE_WAY_X_NEG")
            elseif(sundirection == 3)then
                coolsprinkles(1,0,1,14,0,14,0.08,"block_sunflower_spot")
                create_rect("XAR_BRISTOL_ONE_WAY_BIG_Y_POS",1,15,1,14,15,14)
                set_pos(0,7,7,"XAR_BRISTOL_ONE_WAY_X_POS")
                set_pos(15,7,7,"XAR_BRISTOL_ONE_WAY_X_NEG")
            end
            create_rect("XAR_MOSSY_AIR_UP_DOWN_TOP",1,1,1,14,14,14)
            set_pos(7,7,7,"block_sunflower_treasure")
        else
            --should never happen. Fill with solid
        end
    else
        --bro we might be cooked. Fill with solid.
    end
end
