--Unkillable dream core, except has a respawn time. The point is to "kill" it by sleeping for some time. 
-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    --due to recent update, this must be set in the chunk file, the container. 
    --ia_ment_set_builtin_var_f(id, "__ttl", 99999*60*60) -- slightly less than 100K hours. 

    ia_ment_set_builtin_var_f(id, "__respawn_length", 9999999*60*60) --long time?
    ia_ment_set_builtin_var_f(id, "__radius", 0.5)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_dream_core") --change?
    ia_ment_set_builtin_var_i(id, "__extra_max_levels", 9999)
    ia_ment_set_builtin_var_b(id, "__collides", true)
    ia_ment_set_builtin_var_b(id, "__solid_wrt_player", true)
    ia_ment_set_builtin_var_f(id, "__turn_speed", 0.5)
    ia_ment_set_builtin_var_b(id, "__turn_towards_player", true)
    ia_ment_set_builtin_var_b(id, "__player_can_telefrag", false)
end

--its basically a rock. 
function p.__get_can_use(id)
    return true
end

function p.__get_use_msg(id)
    if( not p.__get_can_use(id) ) then return "" end
    return "Dream Core"
end

function p.__on_use(id)
    ga_play_sound("error")
end


function p.__on_update(inst_id, elapsed_time, elapsed_level_time)
    if(ga_get_sys_f("game.time.total")>ga_ment_get_f(inst_id, "__game_end_time")) then
        ga_ment_remove(inst_id)
    end
end