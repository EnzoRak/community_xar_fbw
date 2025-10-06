function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_xar_chunk("XAR_SPACE_SOLAR_SYSTEM")
    set_pos(7,7,7,"block_sun_god_carcass")
end