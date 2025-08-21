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
    ia_ment_new_static_var_b(id, "freeze_immune", false) --Emp, but not freeze immune.
    local aura_radius = 8.0
    ia_ment_new_static_var_f(id, "damage_aura_duration", 1.0)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
    --[[
    ia_ment_new_static_var_b(id, "damage_aura_has", true)
    ia_ment_new_static_var_i(id, "damage_aura_damage", 0)
    ia_ment_new_static_var_f(id, "damage_aura_radius", aura_radius)
    ia_ment_new_static_var_b(id, "damage_aura_only_same_level", true)
    ]]
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

--need a custom aura behavior basicallly
function p.__on_update(inst_id, elapsed_time, elapsed_level_time)
    local aura_length = ga_ment_get_f(inst_id, "damage_aura_duration")
    local aura_next_time = ga_ment_get_f(inst_id, "damage_aura_next_time")
    local game_time = ga_get_game_time()
    local the_time = game_time

    if( the_time > aura_next_time + 10*aura_length ) then
        --Setting the next aura time.
        local next_aura_time = the_time + aura_length*ga_randf()
        ga_ment_set_f(inst_id, "damage_aura_next_time", next_aura_time)

        --Adding an alarm.
        ga_ment_set_alarm(inst_id, next_aura_time, "damage_aura_next")
        return
    end

    if( the_time > aura_next_time - 0.1 ) then
        --Setting the next aura time.
        local next_aura_time = the_time + aura_length
        ga_ment_set_f(inst_id, "damage_aura_next_time", next_aura_time)
        --Adding an alarm.
        ga_ment_set_alarm(inst_id, next_aura_time, "damage_aura_next")

        
        local damage = 0 + ga_get_i("xar.player.health.amount") + ga_get_i("xar.player.armor.amount") + ga_get_i("xar.player.shield.amount")
        --damage aura damage is curved
        -- *0.5 to do half of that every damage_aura_duration = 1 seconds
        --however, if i damage raw, then the curve is not affected
        damage = damage * 0.5
        damage = math.floor(damage)
        local cur_level = ga_ment_get_i(inst_id, "__level")
        local lp = ga_ment_get_lp(inst_id)
        local dir = ga_get_vec_to_viewer(
            cur_level,
            lp)
        local neg_dir = std.vec_scale(dir, -1.0)
        --it needs to be raw.
        game_top2.damage_player_from_dir(true, damage, neg_dir)
        --ga_console_print("Chewing Gum Damage Aura: " .. tostring(damage) .. " damage to player.")
    end
end
