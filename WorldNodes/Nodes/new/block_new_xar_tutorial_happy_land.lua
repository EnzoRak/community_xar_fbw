function p.__get_bt_to_copy() return "XAR_TUTORIAL_HAPPY_LAND" end

function p.__main()
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