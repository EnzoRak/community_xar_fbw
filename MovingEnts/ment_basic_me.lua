--a basic moving entity that follows the player around, to show where they are
--used for the showme command
function p.__type_init(id)
    ia_ment_set_builtin_var_b(id, "__disable_saving", true)
    ia_ment_set_builtin_var_f(id, "__ttl", 0.0)
    ia_ment_set_builtin_var_f(id, "__radius", 1.0)
    --maybe replace this mesh later
    ia_ment_set_builtin_var_s(id, "__mesh", "sphere_pink")
    ia_ment_set_builtin_var_b(id, "__solid_wrt_player", false)
    ia_ment_set_builtin_var_b(id, "__collides", false)
end