-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    ia_ment_set_builtin_var_f(id, "__radius", 0.8333)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_evaluator")
    ia_ment_set_builtin_var_b(id, "__turning_disabled", true)
    ia_ment_set_builtin_var_b(id, "__mesh_fixed_frame", true)
    ia_ment_set_builtin_var_f(id, "__ttl", -1.0)
    ia_ment_set_builtin_var_i(id, "__extra_max_levels", 9999)
    ia_ment_set_builtin_var_b(id, "__radius_lvlinv", true)
    ia_ment_new_var_s_perm(id, "on_use", "return")
    ia_ment_new_var_s_perm(id, "on_update", "return")
end

-------------------------------------------------
--              Inst Functions
-------------------------------------------------


local function safe_eval(expr,id)
    local env = {
        math = { abs = math.abs, floor = math.floor, ceil = math.ceil },
        string = { len = string.len, sub = string.sub },

        id = id,
        elapsed_time = elapsed_time,
        elapsed_level_time = elapsed_level_time,

        -- engine tables/functions
        game_upgrades = game_upgrades,
        game_bent = game_bent,
        ga_play_sound = ga_play_sound,
        ga_play_sound_menu = ga_play_sound_menu,
        ga_console_print = ga_console_print,
        ga_print = ga_print,
        ga_get_b = ga_get_b,
        ga_window_push = ga_window_push,

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


function p.__on_update(id, elapsed_time, elapsed_level_time)
    local expr = ga_ment_get_s(id, "on_update")  
    local result, err = safe_eval(expr,id)
    if(ga_ment_get_i(id,"__level") > ga_ment_get_i(id,"__start_level")) then
        ga_ment_set_f(id,"__radius",0.0001)
    else
        ga_ment_set_f(id,"__radius",0.8333)
    end
end


function p.__get_can_use(id)
    return true
end

function p.__get_use_msg(id)
    if( not p.__get_can_use(id) ) then return "" end
    return "Use to Evaluate code"
end

function p.__on_use(id)
    ga_play_sound_menu("use")
    local expr = ga_ment_get_s(id, "on_use") 
    local result, err = safe_eval(expr,id)
    if err then
        ga_print("Evaluation error: " .. tostring(err))
    else
        ga_print("Evaluated")
    end
end

