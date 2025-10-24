function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    local typeoftheparentchunk = get_input_path_bt(get_input_path_length()-1)
    if(typeoftheparentchunk == "XAR_DANDELIONS") then
        create_rect("XAR_DANDELIONS", 0,0,0, 15,15,0)
        create_rect("XAR_DANDELION_AIR",0,0,1, 15,15,15)
    elseif(typeoftheparentchunk == "XAR_QUICKSAND_GRASS_11") then
        create_rect("XAR_QUICKSAND_GRASS_11", 0,0,0, 15,15,0)
    elseif(typeoftheparentchunk == "XAR_FANATIC_GRASS_BOTTOM") then
        create_xar_chunk("XAR_FANATIC_GRASS_BOTTOM")
        for i = 5,9 do
            for j = 5,9 do
                for k = 0,8 do
                    local thecurrentblock = get_pos(i,j,k)  
                    if (thecurrentblock == "XAR_SOLID_BORING_DARK_GREEN_BORDER" or thecurrentblock == "XAR_FANATIC_GRASS_HEALTH" or thecurrentblock == "XAR_FANATIC_WEED_AMMO") then 
                        --sorry, wouldn't wanna be you
                        create_rect("XAR_FANATIC_GRASS_BOTTOM")
                        return
                    end
                end
            end
        end
        for i = 0,15 do
            for j = 0,15 do
                for k = 0,15 do
                    local thecurrentblock = get_pos(i,j,k)   
                    if not (thecurrentblock == "XAR_SOLID_BORING_DARK_GREEN_BORDER" or thecurrentblock == "XAR_FANATIC_GRASS_HEALTH" or thecurrentblock == "XAR_FANATIC_WEED_AMMO") then 
                        set_pos(i, j, k, "XAR_EMPTY_BORING")
                    end
                end
            end
        end
    end
    --create the flower, no bs
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 7,7,0, 7,7,6)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 5,7,5, 9,7,5)
    create_rect("XAR_SOLID_BORING_DARK_GREEN_BORDER", 7,5,5, 7,9,5)
    set_pos(5,7,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(7,5,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(7,9,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(9,7,6, "XAR_SOLID_BORING_DARK_GREEN_BORDER")
    set_pos(7,7,7, "block_pink_flower_room")
end
