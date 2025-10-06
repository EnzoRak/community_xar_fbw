function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_blue" end

function p.__main()
    set_default_block("XAR_ANTI_PLUG_GLASS")
    create_rect("XAR_EMPTY_BORING",1,1,0,14,14,14)
    std.create_edges("XAR_SOLID_BORING_CONCRETE_CHECKER_BLUE")
    local level = get_level()
    local code = get_input_path_block_s(level-1, "code")
    add_bent_s(7,7,7,"bent_base_txt", "Your code is:\n\n^xff00ff" .. code .. "^!\n\nThe maze is 8x8x8.")
    add_bent(13,13,13,"bent_base_ring_pink_source")
    add_bent(8,8,0,"bent_base_ring_green_danger")
end