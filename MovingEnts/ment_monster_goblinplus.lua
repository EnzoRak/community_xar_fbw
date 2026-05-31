-------------------------------------------------
--            Type Init Function
-------------------------------------------------

function p.__type_init(id)
    game_ment_type_init.monster(id)
    ia_ment_set_builtin_var_f(id, "__respawn_length", 60*60)
    ia_ment_set_builtin_var_f(id, "__radius", 2.0)
    ia_ment_set_builtin_var_s(id, "__mesh", "MonsterGoblin")
    ia_ment_new_var_i(id, "health", 500000, 60.0 * 60.0)
    ia_ment_new_static_var_f(id, "defense", 1.0001)
    ia_ment_new_static_var_f(id, "dps", 100.0)
    ia_ment_new_static_var_s(id, "sound_hurt", "hurt_goblin")
    ia_ment_new_static_var_f(id, "sound_hurt_period", 0.5)
    ia_ment_new_static_var_s(id, "sound_death", "die_goblin")
    ia_ment_new_static_var_s(id, "identity_str", "Goblin+")
    ia_ment_new_static_var_b(id, "shoots", true)
    ia_ment_new_static_var_b(id, "shoot_proj_allow_multiple", true)
    ia_ment_new_static_var_f(id, "shoot_period", 1.0)
    ia_ment_new_static_var_s(id, "shoot_proj_type", "ment_monster_goblinplus_proj")
    ia_ment_new_static_var_f(id, "shoot_proj_speed", 10.0)
    ia_ment_new_static_var_f(id, "shoot_proj_ttl", 2.5)
    ia_ment_new_static_var_i(id, "shoot_proj_damage", 100)
    --
    -- ia_ment_set_builtin_var_b(id, "__has_custom_alpha", true) --Weird.
end

-------------------------------------------------
--              Inst Functions
-------------------------------------------------

function p.__on_add_to_live_world(inst_id)
    game_ment_add_to_live.monster(inst_id)
end

function p.__on_add_to_live_world(inst_id)
    game_ment_add_to_live.monster(inst_id)
    -- ga_print("here in goblin __on_add_to_live_world function!")
    -- level = ga_ment_get_i(inst_id, "__level")
    -- ga_print("level = " .. level)
    -- alarm_time = 20.0
    -- ga_ment_set_alarm_on_level(inst_id, level, alarm_time, "test_level")
    -- ga_exit()
end

function p.__on_alarm(inst_id, alarm_name)
    game_ment_alarms.monster(inst_id, alarm_name, {
        custom_fire = function(dir, generator)
            game_ment_shoot.bullet_pattern(dir, generator, {
                "# # #",
                " ### ",
                "#####",
                " ### ",
                "# # #",
            }, 0.15)
        end
    })
end

--Debugging.
-- function p.__on_update(inst_id)
--     local game_time = ga_get_game_time()
--     if( math.floor( game_time ) % 2 == 0) then
--         ga_ment_set_b(inst_id, "__hide", true)
--     else
--         ga_ment_set_b(inst_id, "__hide", false)
--     end
-- end

--Debugging.
-- function p.__on_render(inst_id, ment_radius)
--     local white = std.vec(1.0, 1.0, 1.0)
--     ga_render_color(white)
--     local mesh = "marker_long_2"
--     local tex = ga_mesh_get_tex(mesh)
--     local alpha = 0.5
--     ga_render_mesh_with_tex_alpha(mesh, tex, alpha)
--     -- ga_render_ment_typical(inst_id)
-- end
