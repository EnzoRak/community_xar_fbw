function p.__get_is_solid() return true end
function p.__get_tex() return "block_infinity_green" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_SPACE_ROOT")
    set_pos(15,15,15, "block_truecenter")
end
