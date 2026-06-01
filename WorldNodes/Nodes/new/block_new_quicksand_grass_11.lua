function p.__get_bt_to_copy() return "XAR_QUICKSAND_GRASS_11" end

function p.__main()
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
