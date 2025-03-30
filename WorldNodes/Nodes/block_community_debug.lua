function p.__get_is_solid() return true end
function p.__get_tex() return "block_default" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_rect("XAR_MOSSY_AIR_UP_DOWN_TOP", 1,1,1, 14,14,14)
end
