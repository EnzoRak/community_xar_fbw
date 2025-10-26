
function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_red_x" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    std.create_edges("XAR_SOLID_BORING_CONCRETE_RED_X")
    add_bent_s(7,7,9,"bent_base_txt","Use for a quadruple grow?")
    add_bent_s(7,7,7,"bent_evaluator",
    [[
        local path = ga_get_viewer_path()
        path = string.sub(path, 1, -17)
        ga_tele(path,std.block_center(std.vec(7,7,9)))
    ]])
end