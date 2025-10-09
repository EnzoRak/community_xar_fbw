function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_blue" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Complete Trial"
end

function p.__on_use(level, mybp)
    local lv = level-1 -- dangerous!!!
    local vcp = std.vec(0,0,0) -- dangerous!!!
    local bp = std.vec(7,7,5)
    ga_chunk_set_i(lv, vcp, "tier", ga_chunk_get_i(lv, vcp, "tier")+1)
    ga_chunk_set_f(lv, vcp, "unlock_time", ga_get_game_time()+3600) -- so the treasure worked properly
    ga_chunk_set_b(lv, vcp, "locked", true)
    ga_tele(ga_get_viewer_path():sub(1,-9), std.vec(9,9,9))
end

function p.__on_use2(level, bp)
    if(p.__get_can_use(level,bp) == true) then
        p.__on_use(level, bp)
    end
end