function p.__get_is_solid() return true end
function p.__get_tex() return "block_planet_small_minigun" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_SMALL_MINIGUN_PLANET")

    local sundirection = -1
    if (get_input_parent_adj_bt(1,0,0) == "XAR_SPACE_SUN") then
        sundirection = 0
    elseif (get_input_parent_adj_bt(-1,0,0) == "XAR_SPACE_SUN") then
        sundirection = 1
    elseif (get_input_parent_adj_bt(0,1,0) == "XAR_SPACE_SUN") then
        sundirection = 2
    elseif (get_input_parent_adj_bt(0,-1,0) == "XAR_SPACE_SUN") then
        sundirection = 3
    end
    --[[
    if(get_input_path_block_var_exists(get_level(),"sundirection","i")) then
        add_bent_s(15,15,15,"bent_base_txt","" .. sundirection)
    end
    ]]
    for i = 0,15 do
        for j = 0,15 do
            if(randf() < 0.1 and get_pos(i,j,15) == "XAR_YING_FOREST") then
                set_pos(i,j,15,"block_sunflower")
                block_set_i(i,j,15, "sundirection", sundirection)
            end
        end
    end
end
