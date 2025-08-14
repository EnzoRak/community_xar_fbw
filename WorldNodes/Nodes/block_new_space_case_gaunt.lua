function p.__get_is_solid() return true end
function p.__get_tex() return "block_black" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_SPACE_CASE_GAUNT")
    set_pos(7,8,14, "block_community_challenges")
end
