function p.__get_is_solid() return true end
function p.__get_tex() return "block_mushroom_yellow" end

function p.__main()
    set_default_block("block_sunflower_spot")
    local i = get_level()
    if i < 2 then return end
    if get_input_path_bt(i-2) == "block_sunflower_spot" then return end
    if(get_input_path_block_var_exists(get_level(),"sundirection","i")) then
        local sundirection = get_input_path_block_i(get_level(), "sundirection")
        for i = 0, 15 do
            for j = 0, 15 do
                for k = 0, 15 do
                    block_set_i(i,j,k, "sundirection", sundirection)
                end
            end
        end
        if(sundirection<2) then
            srand(seed_yz())
        else
            srand(seed_xz())
        end
        --if somebody less bad at programming can rewrite this logic pls do so.
        local function coolsprinkles(min_x,min_y,min_z,max_x,max_y,max_z,prob,type)
            for x = min_x,max_x do
                for y = min_y,max_y do
                    for z = min_z,max_z do
                        if( randf() < prob ) then
                            set_pos(x,y,z, type)
                            add_bent(x,y,z,"bent_base_ring_green")
                            if(get_input_path_bt(i-1) == "block_sunflower_spot") then
                                if(sundirection == 0)then
                                    create_rect("block_sunspot_hallway",0,y,z,14,y,z)
                                elseif(sundirection == 1)then
                                    create_rect("block_sunspot_hallway",1,y,z,15,y,z)
                                elseif(sundirection == 2)then
                                    create_rect("block_sunspot_hallway",x,0,z,x,14,z)
                                elseif(sundirection == 3)then
                                    create_rect("block_sunspot_hallway",x,1,z,x,15,z)
                                end
                            end
                        end
                    end
                end
            end 
        end
        if(sundirection == 0)then
            coolsprinkles(15,1,1,15,14,14,0.05,"XAR_MOSSY_AIR_ASCEND_RECURSIVE_TOP")
        elseif(sundirection == 1)then
            coolsprinkles(0,1,1,0,14,14,0.05,"XAR_MOSSY_AIR_ASCEND_RECURSIVE_TOP")
        elseif(sundirection == 2)then
            coolsprinkles(1,15,1,14,15,14,0.05,"XAR_MOSSY_AIR_ASCEND_RECURSIVE_TOP")
        elseif(sundirection == 3)then
            coolsprinkles(1,0,1,14,0,14,0.05,"XAR_MOSSY_AIR_ASCEND_RECURSIVE_TOP")
        end
    end
end

function p.__type_init(id)
    ia_block_new_var_i(id, "sundirection", -1)
end
