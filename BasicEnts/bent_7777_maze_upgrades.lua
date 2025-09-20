function p.__get_can_use(level, bp)
    local dist = ga_block_dist_to_viewer(level, bp)
    if( dist < 1.0 ) then return false end
    return true
end

function p.__get_use_msg(level, bp)
    if( not p.__get_can_use(level, bp, dist) ) then return "" end
    return "Use to get all upgrades"
end

local function safe_eval(expr, level, bp)
    local env = {
        math = { abs = math.abs, floor = math.floor, ceil = math.ceil },
        string = { len = string.len, sub = string.sub },

        level = level,
        bp = bp,

        -- engine tables/functions
        game_upgrades = game_upgrades,
        game_bent = game_bent,
        ga_play_sound = ga_play_sound,
        ga_play_sound_menu = ga_play_sound_menu,

        -- make 'p' table itself visible
        p = p,
    }

    local chunk, err = load(expr, "user_chunk", "t", env)
    if not chunk then return nil, err end

    local ok, result = pcall(chunk)
    if not ok then
        return nil, result
    end
    return result
end


function p.__on_use(level, bp)
    ga_play_sound_menu("use")
    local expr = ga_bent_get_param_s(level, bp)  -- your multi-line upgrade string
    local result, err = safe_eval(expr, level, bp)
    if err then
        ga_print("Evaluation error: " .. tostring(err))
    else
        ga_print("Evaluated")
    end
end