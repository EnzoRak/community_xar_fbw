function p.__get_is_solid() return true end
function p.__get_tex() return "block_stopper" end

function p.__main()
    set_default_block("i3v2_ocean")
    std.create_edges("XAR_SOLID_BORING_YELLOW_BLACK_STRIPED")
end