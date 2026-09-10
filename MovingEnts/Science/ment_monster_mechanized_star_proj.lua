	-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster_proj(id)
    ia_ment_set_builtin_var_f(id, "__radius", 1)
    ia_ment_set_builtin_var_s(id, "__mesh", "smart")
    ia_ment_set_builtin_var_i(id, "__team_id_source", 2)
    ia_ment_set_builtin_var_i(id, "__team_id_target", 2)
    ia_ment_new_var_i(id, "health", 50000, 60.0)

    ia_ment_new_var_i(id, "damage", 2000, 1.0) --1 thousand damage.
	ia_ment_new_static_var_f(id, "dps", 15000.0)
    ia_ment_new_static_var_s(id, "identity_str", "Mechanized Star Missile")
    ia_ment_new_static_var_b(id, "freeze_immune", true)
    ia_ment_new_static_var_b(id, "counts_for_pacifist", false)
	
    ia_ment_new_var_b(id, "picture_aura_has", true, 60.0)
    ia_ment_new_static_var_s(id, "picture_aura_picture", "crossbones")
    ia_ment_new_static_var_f(id, "picture_aura_radius", 8000)
    ia_ment_new_static_var_b(id, "picture_aura_only_diff_level", true)
    ia_ment_new_var_f(id, "picture_aura_next_time", 0.0, 60.0)
	
end

-------------------------------------------------
--              Inst Functions
-------------------------------------------------

function p.__on_alarm(inst_id, alarm_name)
    game_ment_alarms.monster(inst_id, alarm_name)
end

function p.__on_add_to_live_world(inst_id)
    game_ment_add_to_live.monster(inst_id)
end

function p.__on_block_hit(
    inst_id,
    level, bp, lp,
    normal_side, normal)

    -- ga_play_sound("explosion_tube_dud") --Too annoying?
    return true
end

function p.on_closest_helper(inst_id)
    local start_level = ga_ment_get_i(inst_id, "__start_level")
    local cur_level = ga_ment_get_i(inst_id, "__level")
    local sllp = ga_ment_get_sllp(inst_id)
    local lp = ga_ment_get_lp(inst_id)

    local ls = ga_level_scale_factor(start_level, cur_level).value

    local fudge2 = 1.0
    if( start_level == cur_level ) then fudge2 = 2.0 end

    local args = {}
    args.level = cur_level
    args.pos = lp
    args.ttl_min = 0.1*ls
    args.ttl_max = 0.3*ls
    args.size_min = 0.1*ls*fudge2
    args.size_max = 0.3*ls*fudge2
    args.color = std.vec(1.0, 1.0, 0.0)
    args.fade_time_min = 1.0
    args.fade_time_max = 1.0
    args.speed_min = 1.0*ls*fudge2
    args.speed_max = 3.0*ls*fudge2
    args.tex = "particle_2"
    args.radius_min = 0.0
    args.radius_max = 0.0
    args.num = 50
    args.use_min_dist = true --No particles too close to viewer.
    ga_particle_explosion(args)

    ga_play_sound("explosion_tube_short") --Annoying. Use sparingly.

    local damage = ga_ment_get_i(inst_id, "damage")
	for missileSpam = 0,14 do
		ga_ment_start(
			start_level, sllp,
			"ment_monster_mechanized_star_proj_proj")
		ga_ment_init_set_f("__homing_speed", 24-missileSpam/3)
		ga_ment_init_set_i("damage", damage)
		ga_ment_end()
	end
end

-- Called when this entity is closest to the viewer
-- (when this entity stats to more farther away).
function p.__on_closest(inst_id)
    p.on_closest_helper(inst_id)
    ga_ment_remove(inst_id)
end
