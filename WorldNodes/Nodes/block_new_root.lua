function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_ROOT")
    set_pos(15,15,15, "block_community_debug")
end
