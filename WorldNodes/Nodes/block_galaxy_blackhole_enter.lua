function p.__get_is_solid() return true end
function p.__get_tex() return "block_black" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_BLACK")
    create_rect("XAR_SOLID_BORING", 6,6,0, 9,9,15)
    create_rect("XAR_EMPTY_BORING", 7,7,0, 8,8,15)
    create_rect("XAR_ONE_WAY_Z_NEG", 7,7,15, 8,8,15)
end