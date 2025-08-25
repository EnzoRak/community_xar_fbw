-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__radius", 3.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_oracle")
    --needs a buff on god
    ia_ment_new_var_i(id, "health", 50000, 60.0)
    ia_ment_new_static_var_f(id, "dps", 10.0)
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_mystic")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.7)
    ia_ment_new_static_var_s(id, "sound_death", "die_mystic")
    ia_ment_set_builtin_var_b(id, "__player_can_telefrag", false)
    --[[
    ia_ment_new_static_var_s(id, "die_drop_bent", "bent_upgrade_gun_0_proj_speed")
    ia_ment_new_static_var_s(id, "die_drop_box_txt", "Hole Projectile Speed Upgrade")
    ia_ment_new_static_var_b(id, "die_drop_box_allow", true)
    ia_ment_new_static_var_i(id, "die_drop_extra_levels", 1)
    ]]
    ia_ment_new_static_var_s(id, "identity_str", "Oracle")
    ia_ment_new_var_i(id, "damage", 10, 60.0)
    --
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 10)
    ia_ment_new_static_var_f(id, "damage_aura_radius", -1.0)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
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

function p.__on_die(inst_id)
    game_ment_die.main(inst_id)
end

--[[
-------------------------------------------------
--           Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    game_ment_type_init.helper_default_shooting_secondary(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 3.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "MonsterInnerCore")
    ia_ment_set_builtin_var_b(id, "__player_can_telefrag", false) --Weird. To prevent cheese.
    -- ia_ment_new_var_i(id, "health", 5000000, 60.0)
    ia_ment_new_var_i(id, "health", 100000000, 60.0) --100 million.
    ia_ment_new_static_var_f(id, "dps", 300.0)
    ia_ment_new_static_var_f(id, "xp_mod", 10) --Extremely high (super bosses).
    ia_ment_new_static_var_s(id, "sound_death", "die_i_am_eternal")
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_very_deep_ahh")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.6)
    ia_ment_new_static_var_b(id, "emp_immune", true)
    ia_ment_new_static_var_b(id, "freeze_immune", true)
    ia_ment_new_static_var_s(id, "die_drop_bent", "bent_credits")
    ia_ment_new_static_var_s(id, "die_drop_box_txt", "Key to the Universe")
    ia_ment_new_static_var_b(id, "die_drop_box_allow", true)
    ia_ment_new_static_var_i(id, "die_drop_extra_levels", 2)
    ia_ment_new_static_var_s(id, "identity_str", "Inner Core")
    ia_ment_new_static_var_b(id, "shoots", true)
    ia_ment_new_static_var_f(id, "shoot_period", 1.0)
    ia_ment_new_static_var_b(id, "shoot_period_lvlinv", true)
    ia_ment_new_static_var_s(id, "shoot_proj_type", "ment_monster_vulcan_proj")
    ia_ment_new_static_var_f(id, "shoot_proj_speed", 1000000.0)
    ia_ment_new_static_var_f(id, "shoot_proj_ttl", 5.0)
    ia_ment_new_static_var_i(id, "shoot_proj_damage", 300)
    ia_ment_new_static_var_b(id, "secondary_shoots", true)
    ia_ment_new_static_var_f(id, "secondary_shoot_period", 12.0)
    ia_ment_new_static_var_b(id, "secondary_shoot_period_lvlinv", true)
    ia_ment_new_static_var_f(id, "secondary_accuracy", 0.2)
    ia_ment_new_static_var_s(id, "secondary_shoot_proj_type", "ment_monster_inner_core_proj")
    ia_ment_new_static_var_f(id, "secondary_shoot_proj_speed", 100.0)
    ia_ment_new_static_var_f(id, "secondary_shoot_proj_ttl", 20.0)
    ia_ment_new_static_var_i(id, "secondary_shoot_proj_damage", 1)
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 1000)
    ia_ment_new_static_var_f(id, "damage_aura_radius", 3.0)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
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

function p.xar_process_got_hit(args, exceptions)
    --This ment is not affected by the player having any
    --powerups, such as an increased damage modifier.
    exceptions.no_damage_powerups = true
    ret = game_ment_hit.process_final(args, exceptions)
    return ret
end

function p.__on_die(inst_id)
    game_ment_die.main(inst_id)
end

]]