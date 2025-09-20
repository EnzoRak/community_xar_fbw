function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_red" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Teleport up to the lower level"
end

function p.__on_use(level, bp)
    local s = ga_bp_to_path(level, bp)
    s = s:sub(1, -5)
    local new_last4 = s:sub(-4)
    s = s:sub(1, -13) .. new_last4
    ---777 the final offset in the chunk.
    ga_tele(s,std.vec(7,7,7))
end

function p.__on_use2(level, bp)
    if(p.__get_can_use(level,bp) == true) then
        p.__on_use(level, bp)
    end
end