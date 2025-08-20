--mostly taken from ment_monster_rat_greater.lua
--essentially, the damage scales with health of the player. It will never kill the player if it is by itself, however multiple can still kill, because all of them do the same damage per tick.
--special thanks to 'hubert cubes' (somerandomperson12) on discord for the sounds 
-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 2)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_chewing_gum")
    ia_ment_new_static_var_s(id, "identity_str", "I am Chewing Gum")
    ia_ment_new_static_var_s(id, "sound_hurt", "hit_chewing_gum")
    ---MMMMM
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.2)
    ia_ment_new_static_var_s(id, "sound_death", "die_chewing_gum")
    ia_ment_new_var_i(id, "health", 200000, 60.0)
    ia_ment_new_static_var_f(id, "xp_mod", 2) --High!
    ia_ment_new_static_var_f(id, "dps", 3000.0)
    ia_ment_new_static_var_b(id, "emp_immune", true) --Emp, but not freeze immune.
    local aura_radius = 8.0
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 0)
    ia_ment_new_static_var_f(id, "damage_aura_radius", aura_radius)
    ia_ment_new_static_var_b(id, "damage_aura_only_same_level", true)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_period", 0.05)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_radius", aura_radius)
    ia_ment_set_builtin_var_f(id, "__gas_cloud_trigger_dist", 64.0)
    --
    ia_ment_set_builtin_var_b(id, "__homing", true)
    ia_ment_set_builtin_var_f(id, "__homing_speed", 10.0)
    ia_ment_set_builtin_var_f(id, "__homing_min_dist", 4.0)
    ia_ment_set_builtin_var_b(id, "__collides", true)
    ia_ment_set_builtin_var_b(id, "__point_block_correct", true)
    ia_ment_set_builtin_var_b(id, "__ment_correct", true)
    --
    ia_ment_new_var_b(id, "picture_aura_has", true, 60.0)
    ia_ment_new_static_var_s(id, "picture_aura_picture", "crossbones")
    ia_ment_new_static_var_f(id, "picture_aura_radius", 1000)
    ia_ment_new_static_var_b(id, "picture_aura_only_same_level", true)
    ia_ment_new_var_f(id, "picture_aura_next_time", 0.0, 60.0)
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

function p.__on_update(inst_id, elapsed_time, elapsed_level_time)
    local damage = 0 + ga_get_i("xar.player.health.amount") + ga_get_i("xar.player.armor.amount") + ga_get_i("xar.player.shield.amount")
    --damage aura damage is curved
    -- *0.5 to do half of that every damage_aura_duration = 1 seconds
    if( ga_get_b("xar.difficulty.curve.enabled") ) then
        damage = damage * 0.01 * damage * 0.5
    else
        damage = damage * 0.5
    end
    ga_ment_set_i(inst_id, "damage_aura_damage", math.max(0,math.floor(damage)))
end
