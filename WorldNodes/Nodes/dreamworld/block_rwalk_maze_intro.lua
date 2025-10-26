
function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_white_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    std.create_edges("XAR_SOLID_BORING_CONCRETE_WHITE_BORDER")
    add_bent_s(7,7,7,"bent_base_txt","This is a maze generated with a random walk. Therefore it should be easier, and the branches not as deep.")
end