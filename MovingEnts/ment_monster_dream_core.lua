--Unkillable dream core, except has a respawn time. The point is to "kill" it by sleeping for some time. 
-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    ia_ment_set_builtin_var_f(id, "__ttl", 99999*60*60) -- slightly less than 100K hours. 

    ia_ment_set_builtin_var_f(id, "__radius", 3.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_monster_dream_core") --change?
    ia_ment_set_builtin_var_f(id, "__ttl", -1.0)
    ia_ment_set_builtin_var_i(id, "__extra_max_levels", 9999)
    ia_ment_set_builtin_var_b(id, "__collides", true)
    ia_ment_set_builtin_var_b(id, "__solid_wrt_player", true)
    ia_ment_set_builtin_var_f(id, "__turn_speed", 0.5)
    ia_ment_set_builtin_var_b(id, "__turn_towards_player", true)
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
