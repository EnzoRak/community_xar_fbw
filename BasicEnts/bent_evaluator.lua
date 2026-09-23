function p.__get_can_use(level, bp)
    local dist = ga_block_dist_to_viewer(level, bp)
    if( dist < 1.0 ) then return false end
    return true
end

function p.__get_use_msg(level, bp)
    if( not p.__get_can_use(level, bp, dist) ) then return "" end
    return "Use to Evaluate code"
end

local function safe_eval(expr,l,b)
    -- the env is no more

    local chunk, err = load("local level,bp = ...;" .. expr)
    if not chunk then return nil, err end

    local ok, result = pcall(chunk, l, b)
    if not ok then
        return nil, result
    end
    return result
end


function p.__on_use(level, bp)
    ga_play_sound_menu("use")
    local expr = ga_bent_get_param_s(level, bp)  
    local result, err = safe_eval(expr, level, bp)
    if err then
        ga_print("Evaluation error: " .. tostring(err))
    else
        ga_print("Evaluated" .. tostring(result))
    end
end