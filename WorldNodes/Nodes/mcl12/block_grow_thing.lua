function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_ASCEND_SIMPLE",6,7,7,8,7,7)
    create_rect("XAR_ASCEND_SIMPLE",7,6,7,7,8,7)
    create_rect("grow_thing",7,7,6,7,7,8)
    set_pos(7,7,7,"XAR_SOLID_BORING_EXPANDER")
end
