function p.__get_is_solid() return true end
function p.__get_tex() return "block_dan_house_library" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_LIBRARY_LIBRARY")
    set_pos(7,7,8,"block_alphabet_flower_upper")
    set_pos(7,7,7,"block_alphabet_flower")
end
