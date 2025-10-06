-------------------------------------------------
--            Type Init Function
-------------------------------------------------
--it works here i think
function p.xar_get_level_mod_damage_in(delta)
    --not that arbitrary i hope
    local a=1.772182
    local b=0.102768
    local function quickmaths(mathable)
        return a*b^mathable
    end
    local modifier = quickmaths(delta)
    --ga_print(tostring(modifier))
    --ga_console_print(tostring(modifier))
    return modifier
end

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__radius", 2.1)
    ia_ment_set_builtin_var_s(id, "__mesh", "ment_sun")
    --needs a buff on god
    ia_ment_new_var_i(id, "health", 144144144, 60.0)
    ia_ment_new_static_var_f(id, "dps", 50.0)
    --temp?
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_mystic")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.7)
    ia_ment_new_static_var_s(id, "sound_death", "die_mystic")
    ia_ment_new_static_var_s(id, "identity_str", "Sun God")

    ia_ment_new_static_var_f(id, "damage_aura_duration", 3.0)
    ia_ment_new_static_var_f(id, "damage_aura_radius", -1.0)
    ia_ment_new_static_var_b(id, "damage_aura_only_same_level", false)
    ia_ment_new_var_f(id, "damage_aura_next_time", 0.0, 60.0)
    
    --[[guys this might not be good]]
    --the issue is can't use viewer level here because THAT is not constant either. 
    ia_ment_new_var_v(id, "placementbp", std.vec_zero(), 60.0)

    --9+10
    ia_ment_new_static_var_f(id, "xp_mod", 21) --Very High!
    --apparently the way xp works is that if there is no xp_override, then it is based off of dps and xp_mod
    ia_ment_new_static_var_f(id, "dps", 3000000.0)

    ia_ment_new_var_b(id, "picture_aura_has", true, 60.0)
    ia_ment_new_static_var_s(id, "picture_aura_picture", "crossbones")
    ia_ment_new_static_var_f(id, "picture_aura_radius", 128)
    ia_ment_new_static_var_b(id, "picture_aura_only_same_level", false)
    ia_ment_new_var_f(id, "picture_aura_next_time", 0.0, 60.0)

    ia_ment_set_builtin_var_i(id, "__extra_min_levels", 1) --Ok?
    ia_ment_set_builtin_var_i(id, "__extra_max_levels", 1234) --Ok?

    
    ia_ment_set_builtin_var_b(id, "__player_can_telefrag", false) --Weird. To prevent cheese.
    --
    ia_ment_set_builtin_var_b(id, "__collides", false)
    ia_ment_set_builtin_var_b(id, "__solid_wrt_player", false)
    --ia_ment_set_builtin_var_b(id,"__radius_lvlinv", true)
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

function p.on_die(inst_id)
    --[[
    local function croptolevel(str, level)
        local cutoff = (4 * level) - 1
        if cutoff < 1 then return "" end
        if cutoff > #str then return str end
        return string.sub(str, 1, cutoff)
    end
    ]]
    local chunkid = ga_ment_get_chunk_id(inst_id)
    --dude imagine if this worked
    
    --local superpath = croptolevel(ga_chunk_id_to_path(chunkid),ga_ment_get_i(inst_id, "__start_level"))
    --[[
    ga_console_print(superpath)
    ga_print(superpath)
    ga_console_print("welcome ohio")
    ga_print("welcome ohio")
    ]]
    --ga_block_change_perm(ga_ment_get_i(inst_id, "__start_level")-1,ga_vcp_to_bp(ga_ment_get_i(inst_id, "__start_level")-1,ga_chunk_id_to_vcp(ga_path_to_chunk_id(superpath))),"block_replacement_solar_system")
    --tfw this works
    if(ga_get_viewer_level()<ga_ment_get_i(inst_id,"__start_level")) then
        --ga_console_print("welcome kansas")
        ga_block_change_perm(ga_ment_get_i(inst_id,"__start_level")-1, std.lp_to_bp(ga_chunk_id_and_offset_to_lp(chunkid,ga_ment_get_v(inst_id,"__offset"))),"block_replacement_solar_system")
    else
        --ga_console_print("welcome ohio")
        ga_block_change_perm(ga_ment_get_i(inst_id,"__start_level"), ga_ment_get_v(inst_id,"placementbp"),"block_sun_god_carcass")
    end
    game_ment_die.default(inst_id)
end

--since damage aura doesn't take the level damage mod into account 
function p.__on_update(inst_id,elapsed_time,elapsed_level_time)

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
        local aura_radius = ga_ment_get_f(inst_id, "damage_aura_radius")
        local start_level = ga_ment_get_i(inst_id, "__start_level")
        if( aura_radius > 0 ) then
            --Doing a radius check.
            local sllp = ga_ment_get_sllp(inst_id)
            local viewer_lp = ga_get_viewer_lp(start_level)
            local dist_to_viewer = std.dist(sllp, viewer_lp)
            if( dist_to_viewer > aura_radius ) then return end
        end

        if( ga_ment_b_exists_and_true(inst_id, "damage_aura_only_same_level") ) then
            player_level = ga_get_viewer_level()
            if( start_level ~= player_level ) then return end
        end
        
        --change this later
        local damage = 10000

        local function modifierfromdelta(indelta) 
            local dist = ga_ment_get_var_special_dist_to_viewer(inst_id)
            local modified = (2.8^indelta) / math.max(1,(dist * dist))
            return modified
        end

        local source_start_lev = ga_ment_get_i(inst_id, "__start_level")
        local target_start_lev = ga_get_viewer_level()
        --or is it the other way around?
        local delta = source_start_lev - target_start_lev
        local modifier = modifierfromdelta(delta)
        --unlike chewing gum, not raw damage
        --ga_print(tostring(modifier*damage))
        --ga_console_print(tostring(modifier*damage))
        local damage = math.floor(modifier * damage)


        
        local cur_level = ga_ment_get_i(inst_id, "__level")
        local lp = ga_ment_get_lp(inst_id)
        local dir = ga_get_vec_to_viewer(
            cur_level,
            lp)
        local neg_dir = std.vec_scale(dir, -1.0)
        
        --not raw this time
        game_top2.damage_player_from_dir(true, damage, neg_dir)

        --Setting the next aura time.
        local next_aura_time = the_time + aura_length
        ga_ment_set_f(inst_id, "damage_aura_next_time", next_aura_time)
        --Adding an alarm.
        ga_ment_set_alarm(inst_id, next_aura_time, "damage_aura_next")
    end
end