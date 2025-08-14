--a basic moving entity that follows the player around, to show where they are
--used for the showme command
function p.__type_init(id)
    ia_ment_set_builtin_var_b(id, "__disable_saving", true)
    ia_ment_set_builtin_var_f(id, "__ttl", -1.0)
    ia_ment_set_builtin_var_f(id, "__radius", 1.0)
    --maybe replace this mesh later
    ia_ment_set_builtin_var_s(id, "__mesh", "sphere_pink")
    ia_ment_set_builtin_var_b(id, "__solid_wrt_player", false)
    ia_ment_set_builtin_var_b(id, "__collides", false)
    --monster,  targeting the player
    ia_ment_set_builtin_var_i(id, "__team_id_source", 2)
    ia_ment_set_builtin_var_i(id, "__team_id_target", 1)
    --from rat. this is good enough for following (mostly)
    ---maybe replace this later (if you know how pls lemme know it the github issues section)
    ia_ment_set_builtin_var_b(id, "__homing", true)
    ia_ment_set_builtin_var_f(id, "__homing_speed", 10.0)
    ia_ment_set_builtin_var_f(id, "__homing_min_dist", 0)
end

--no beuno
function p.__on_update(id,elapsed_time,elapsed_level_time) 
    if (ga_ment_get_i(id, "__level") ~= ga_get_viewer_level()) or not ga_get_b("community_xar_fbw.showmetoggle") then
        ga_ment_remove(id)
        ga_command("set metagame.player.camera.3rdp.enabled false")
        ga_set_b("community_xar_fbw.showmetoggle", not ga_get_b("community_xar_fbw.showmetoggle"))
    end
end