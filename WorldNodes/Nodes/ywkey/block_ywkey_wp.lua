function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_blue" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    std.create_edges("XAR_SOLID_BORING_CONCRETE_CHECKER_BLUE")
    add_bent_s(7,7,7,"bent_base_waypoint", "Ying World Purple Cube")
    add_bent(7,7,5,"bent_base_save")
    add_ben_st(7,7,9,"bent_cxar_trophy","ywkey")
end