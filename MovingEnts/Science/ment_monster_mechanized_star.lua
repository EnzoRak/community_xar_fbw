-------------------------------------------------
--       Other.
-------------------------------------------------

function p.xar_get_level_mod_damage_in(delta)
    if( delta == 0 ) then return 0.01 end
    return 1.0
end

-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 4.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "MonsterMechanizedStar")
    ia_ment_new_var_i(id, "health", 8000000, 60.0)
    ia_ment_new_static_var_f(id, "xp_mod", 8) --Very High!
    ia_ment_new_static_var_b(id, "xp_only_different_level", true)
    ia_ment_new_static_var_f(id, "dps", 15000.0)
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_machine_on_low")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.9)
    ia_ment_new_static_var_s(id, "sound_death", "die_club_dryer_long")
    ia_ment_new_static_var_s(id, "die_drop_bent", "bent_upgrade_gun_8_radius")
    ia_ment_new_static_var_s(id, "die_drop_box_txt", "EMP Radius Upgrade")
    ia_ment_new_static_var_b(id, "die_drop_box_allow", true)
    ia_ment_new_static_var_i(id, "die_drop_extra_levels", 1)
    ia_ment_new_static_var_s(id, "identity_str", "Mechanized Star")
    ia_ment_new_static_var_b(id, "shoots", true)
    ia_ment_new_static_var_f(id, "shoot_period", 12.0)
    ia_ment_new_static_var_b(id, "shoot_period_lvlinv", true)
    ia_ment_new_static_var_b(id, "shoot_only_different_level", true)
    ia_ment_new_static_var_s(id, "shoot_proj_type", "ment_monster_mechanized_star_proj")
    ia_ment_new_static_var_f(id, "shoot_proj_speed", 48.0)
    ia_ment_new_static_var_f(id, "shoot_proj_ttl", 1.0)
    ia_ment_new_static_var_i(id, "shoot_proj_damage", 15000)
end

-------------------------------------------------
--              Inst Functions
-------------------------------------------------

function p.__on_add_to_live_world(inst_id)
    game_ment_add_to_live.monster(inst_id)
end

function p.__on_alarm(inst_id, alarm_name)
    game_ment_alarms.monster(inst_id, alarm_name)
end
