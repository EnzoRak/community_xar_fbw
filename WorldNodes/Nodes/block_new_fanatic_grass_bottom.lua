function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_FANATIC_GRASS_BOTTOM")
    for i = 0,15 do
        for j = 0,15 do
            if(get_pos(i,j,0)=="XAR_FANATIC_GRASS_BOTTOM") then  
                if(randf()>0.7) then
                    set_pos(i, j, 0, "block_pink_flower")
                end
            end
        end
    end
end
