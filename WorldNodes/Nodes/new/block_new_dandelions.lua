function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_DANDELIONS")
    for i = 0,9 do
        --never on the edge of a chunk
        local x = randi(1,14)
        local y = randi(1,14)
        --just making sure no goofy dandelion seedhead
        local g = get_pos(x,y,1)
        if(get_pos(x,y,0)=="XAR_DANDELIONS" and (g == "XAR_DANDELION_FLOWER_BLUE" or g == "XAR_DANDELION_FLOWER_YELLOW" or g == "XAR_DANDELION_FLOWER_ORANGE")) then  
            set_pos(x, y, 0, "block_pink_flower")
        end
    end
end
