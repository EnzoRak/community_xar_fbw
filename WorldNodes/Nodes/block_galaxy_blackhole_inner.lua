function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    local blocks = {
        ""
    }
    if randi(1,2) == 1 then
        set_pos(randi(0,15),randi(0,15),randi(0,15), blocks[randi(1,#blocks)])
    end
end
