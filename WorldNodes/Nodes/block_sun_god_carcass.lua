function p.__get_is_solid() return true end
function p.__get_tex() return "block_sun" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_xar_chunk("XAR_SPACE_SUN")
    set_pos(8,8,8,"XAR_SOLID_BORING")
end