function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_MOSSY_AIR_TOP")


    for i = 0,15 do
        for j = 0,15 do
            for k = 0,15 do
                local thestringinquestion = get_pos(i,j,k) 
                if(thestringinquestion == "XAR_MOSSY_AIR_CUBE" or thestringinquestion == "XAR_EMPTY_BORING") then
                    return
                    --if there is mossy air cube, it is surrounded by recursive mossy air grows. If there is a shrink, there is a empty boring underneath. 
                end
            end
        end
    end

    add_bent_s(7,7,7,"bent_base_txt","If you shrink here you will be in Mossy Air. Some changes were made so now there are combination codes you can enter by shrinking in certain places, and more content as well.")
end