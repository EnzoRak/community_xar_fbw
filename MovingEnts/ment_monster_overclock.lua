--if the player is seen by monster and is smaller, half fire period, unless it is less than 0.04, then shoot twice, double player discrete change from last position
--if player is larger and seen, double fire period, half discrete change from last position 
--at least that's the plan
--ill do this later?
-------------------------------------------------
--              Damage AND Health
-------------------------------------------------

function p.xar_get_level_mod_damage_in(delta)
    if delta == 0 then return 1.0 end
    return (1.0 / 50.0)
end

-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 3.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "MonsterOverlord")
    ia_ment_new_var_i(id, "health", 1000, 60.0)
    ia_ment_new_static_var_f(id, "dps", 50.0)
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_overlord")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.75)
    ia_ment_new_static_var_s(id, "sound_death", "die_overlord")
    ia_ment_new_static_var_s(id, "identity_str", "Overlord")
    ia_ment_new_static_var_b(id, "shoots", true)
    ia_ment_new_static_var_f(id, "shoot_period", 1.0)
    ia_ment_new_static_var_b(id, "shoot_period_lvlinv", true)
    ia_ment_new_static_var_b(id, "shoot_only_different_level", true)
    ia_ment_new_static_var_s(id, "shoot_proj_type", "ment_monster_vulcan_proj")
    ia_ment_new_static_var_f(id, "shoot_proj_speed", 1000000.0)
    ia_ment_new_static_var_f(id, "shoot_proj_ttl", 1.0)
    ia_ment_new_static_var_i(id, "shoot_proj_damage", 50)
    --
    ment_monster_overseer.create_shrink_warning_secondary(id)
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
