function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_TUTORIAL_HAPPY_LAND")
    local BTS = get_input_path_bts()
    for i = 0,#BTS do--Notice this is len, not len-1
        block_type = BTS[i].name--this is a string.
        if(block_type == "XAR_HELL") then
            set_pos(2,2,2,"block_sadlands")
            return
        end
    end
end