function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_white_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    std.create_edges("XAR_SOLID_BORING_DARK_CONCRETE_WHITE_BORDER")
    add_bent_s(7,7,9,"bent_base_txt", "You found a secret! You can use this to increase the tier without having to wait an hour.")
end