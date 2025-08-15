function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_QUICKSAND_GRASS_11")
    for i = 0, 15 do
        for j = 0, 15 do
            --oneinsixteen? avg 15 per chunk
            if(randf()<0.0625) then 
                if(get_pos(i,j,0)=="XAR_QUICKSAND_GRASS_11") then  
                    set_pos(i, j, 0, "block_pink_flower")
                end
            end
        end
    end
end
