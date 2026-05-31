function p.get_the_time(inst_id)
    local type_name = ga_ment_get_type(inst_id)
    local game_time = ga_get_game_time()
    local lvlinv = ga_ment_get_static_b(type_name, "shoot_period_lvlinv")
    local the_time = 0.0
    if( lvlinv ) then the_time = game_time
    else
        local start_level = ga_ment_get_i(inst_id, "__start_level")
        the_time = ga_get_level_time(start_level)
    end
    return the_time
end

function p.add_alarm(inst_id, next_shoot_time)
    local type_name = ga_ment_get_type(inst_id)
    --lvlinv = "level invariant".
    local lvlinv = ga_ment_get_static_b(type_name, "shoot_period_lvlinv")
    if( lvlinv ) then
        --A game time alarm.
        ga_ment_set_alarm(inst_id, next_shoot_time, "shoot_next")
    else
        --A level time alarm.
        local start_level = ga_ment_get_i(inst_id, "__start_level")
        ga_ment_set_alarm_on_level(inst_id, start_level, next_shoot_time, "shoot_next")
    end
end

function p.set_shoot_time(inst_id, random_start)
    -- ga_print("game_ment_shoot.set_shoot_time")

    -- game_time = ga_get_game_time()
    local the_time = p.get_the_time(inst_id) --Note: this might be the level time!
    -- --
    local shoot_length = ga_ment_get_f(inst_id, "shoot_period")

    -- ga_print("  shoot_length = " .. tostring(shoot_length))
    -- ga_print("  game_time    = " .. tostring( ga_get_game_time() ))

    --Setting the next aura time.
    local next_shoot_time = 0.0
    if random_start then
        next_shoot_time = the_time + shoot_length*ga_randf()
        else
        next_shoot_time = the_time + shoot_length
    end
    -- ga_print("setting shoot_time to " .. tostring(next_shoot_time))
    ga_ment_set_f(inst_id, "shoot_time", next_shoot_time)

    -- ga_print("  next_shoot_time = " .. tostring(next_shoot_time))

    --Adding an alarm.
    p.add_alarm(inst_id, next_shoot_time)
end

--This is what an alarm should call.
--Also, add to live would should call this.
function p.shoot_maybe(inst_id, add_to_live, params)
    local type_name = ga_ment_get_type(inst_id)
    -- ga_print("game_ment_shoot.shoot_maybe " .. type_name)
    
    if( not ga_ment_static_b_exists_and_true(type_name, "shoots") ) then return end

    if( ga_ment_var_exists(inst_id, "shoot_tigger_dist") ) then
        --Seeing if close enough to shoot.
        local trigger_dist = ga_ment_get_f(inst_id, "shoot_tigger_dist")
        local ment_start_level = ga_ment_get_i(inst_id, "__start_level")
        local ment_sllp = ga_ment_get_sllp(inst_id)
        local vec_to_viewer = ga_get_vec_to_viewer(ment_start_level, ment_sllp)
        local dist_to_viewer = std.length(vec_to_viewer)
        if( dist_to_viewer > trigger_dist) then
            --Not shooting.
            p.set_shoot_time(inst_id, true) --This sets an alarm.
            return
        end
    end

    local shoot_length = ga_ment_get_f(inst_id, "shoot_period")
    local shoot_time = ga_ment_get_f(inst_id, "shoot_time")
    -- -- --
    local the_time = p.get_the_time(inst_id)

    if( the_time > shoot_time + 3*shoot_length ) then
        --The current time is significantly greater than the shoot time.
        -- ga_print("setting a random shoot time\n")
        p.set_shoot_time(inst_id, true) --This sets an alarm.
        return --Adding this  July 2022.
    end
    if( the_time > shoot_time - 0.1 ) then
        --The normal case.
        --Has surpassed the shoot time.
        p.shoot_execute(inst_id, params) --This sets an alarm.
        return --Adding this July 2022.
    end
    --Should do nothing.
    --Normally when this happens, we should have
    --shoot_time < game_time + shoot_length.
    --Otherwise, something is fishy (changed the clock?).
    if( the_time < shoot_time - 2*shoot_length ) then
        --The current time is significantly less than the shoot time.
        -- ga_print("game_ment_shoot.shoot_maybe: fishy case")
        --The fishy case.
        p.set_shoot_time(inst_id, true) --This sets an alarm.
        return --Adding this July 2022.
    end

    --Remaining case:
    --the_time is between shoot_time - 0.1 and shoot_time + 2*shoot_length. 
    if( add_to_live ) then
        --Adding an alarm.
        -- ga_print("adding an alarm to shoot (in add_to_live)")
        p.add_alarm(inst_id, shoot_time)
    end
end

function p.shoot_execute(inst_id, params)
    -- ga_print("shoot_execute")

    --Just in case.
    local type_name = ga_ment_get_type(inst_id)
    if( not ga_ment_static_b_exists_and_true(type_name, "shoots") ) then
        --The ment does not shoot.
        return
    end

    --Important to get now, before
    --restting the shoot time.
    local shoot_time = ga_ment_get_f(inst_id, "shoot_time")

    -- ---------------------------------------------
    -- --     Setting alarm to shoot again
    -- ---------------------------------------------

    -- ga_print("game_ment_shoot.shoot_execute: " .. type_name)

    --Adding a new alarm.
    --Important to do this at the beginning.
    local random_start = false
    p.set_shoot_time(inst_id, random_start)

    -- ---------------------------------------------
    -- --     Determining if should shoot
    -- ---------------------------------------------

    --Returning if old projectile still exists.
    local can_shoot_multiple = ga_ment_b_exists_and_true(inst_id, "shoot_proj_allow_multiple")
    if( not can_shoot_multiple ) then
        local proj_inst_id = ga_ment_get_i(inst_id, "shoot_proj_inst_id")
        if( proj_inst_id >= 0 ) then
            local exists = ga_ment_exists(proj_inst_id)
            if( exists ) then
                --There could be a problem.
                local force_it = ga_ment_b_exists_and_true(inst_id, "shoot_allow_multiple_proj")
                if not force_it then
                    --Cannot shoot because projectile still exists.
                    -- ga_print("cannot shoot because proj still exists")
                    return
                end
            end
        end
    end

    --Getting "the_time" and shoot_time.
    local start_level = ga_ment_get_i(inst_id, "__start_level")
    local the_time = p.get_the_time(inst_id)
    if (the_time < shoot_time - 0.1) then
        -- ga_print("cannot shoot because it is not at the shoot time yet")
        return
    end
    -- ga_print("it is time to shoot!")

    --Emp.
    --Checking if EMP stunned before shooting.
    if( ga_ment_b_exists_and_true(inst_id, "emp_stunned") ) then return end
    if( ga_ment_b_exists_and_true(inst_id, "frozen") ) then return end
    --Got past the check.

    --Shoot radius.
    local dist_to_viewer = ga_ment_get_var_special_dist_to_viewer(inst_id)
    local shoot_radius = ga_ment_get_f(inst_id, "shoot_radius")
    if( dist_to_viewer > shoot_radius ) then return end

    --Only same level.
    local only_diff_level = ga_ment_get_b(inst_id, "shoot_only_different_level")
    if( only_diff_level ) then
        local viewer_level = ga_get_viewer_level()
        if( start_level == viewer_level ) then return end
    end

    -- ---------------------------------------------
    -- --          Spawning the projectile
    -- ---------------------------------------------
    -- --Mar 21, 2020.

    --Ready to actualyl fire.

    local proj_type = ga_ment_get_s(inst_id, "shoot_proj_type")
    local shoot_speed = ga_ment_get_f(inst_id, "shoot_proj_speed")
    local towards_viewer = ga_ment_get_var_special_vec_to_viewer(inst_id)
    --For the mothership monster, one way respace the
    --towards_viewer variable were with the last vector
    --for a visible line of sight from the mothership to the vieower!!!
    -- --
    std.normalize(towards_viewer)
    local shoot_vel = {}
    local shoot_vel = std.vec_scale(towards_viewer, shoot_speed)
    local proj_ttl = ga_ment_get_f(inst_id, "shoot_proj_ttl")

    local shoot_damage = ga_ment_get_i(inst_id, "shoot_proj_damage")

    local sllp = ga_ment_get_sllp(inst_id)
    if params and params.custom_fire then
        params.custom_fire(towards_viewer, function(dir)
            ga_ment_start(start_level, sllp, proj_type)
            ga_ment_init_set_v("__vel", std.vec_scale(dir, shoot_speed))
            ga_ment_init_set_f("__ttl", proj_ttl)
            ga_ment_init_set_i("damage", shoot_damage) --Don't need to worry about damage_no_powerups.
            ga_ment_init_set_i("parent_inst_id", inst_id) --Make built in by the engine?
    
            local alt_attack_icon = ga_ment_get_s(inst_id, "shoot_alt_attack_icon")
            if( alt_attack_icon ~= "" ) then
                ga_ment_init_set_s("alt_attack_icon", alt_attack_icon)
            end
    
            if ga_ment_b_exists_and_true(inst_id, "hive_attack") then
                ga_ment_init_set_b("hive_attack", true)
                local delay = ga_ment_get_f(inst_id, "hive_attack_delay")
                ga_ment_init_set_f("hive_attack_delay", delay)
            end
    
            ga_ment_end()
        end)
    else
        ga_ment_start(
            start_level, sllp,
            proj_type)
        ga_ment_init_set_v("__vel", shoot_vel)
        ga_ment_init_set_f("__ttl", proj_ttl)
        ga_ment_init_set_i("damage", shoot_damage) --Don't need to worry about damage_no_powerups.
        ga_ment_init_set_i("parent_inst_id", inst_id) --Make built in by the engine?

        local alt_attack_icon = ga_ment_get_s(inst_id, "shoot_alt_attack_icon")
        if( alt_attack_icon ~= "" ) then
            ga_ment_init_set_s("alt_attack_icon", alt_attack_icon)
        end

        if ga_ment_b_exists_and_true(inst_id, "hive_attack") then
            ga_ment_init_set_b("hive_attack", true)
            local delay = ga_ment_get_f(inst_id, "hive_attack_delay")
            ga_ment_init_set_f("hive_attack_delay", delay)
        end

        local proj_inst_id = ga_ment_end()

        ga_ment_set_i(inst_id, "shoot_proj_inst_id", proj_inst_id)
    end
end

function p.bullet_pattern(look, proj_generator, pattern, increment)
    local worldup = std.vec(0,0,1)
    if look.z > 0.999 then worldup = std.vec(0,1,0) end
    local function tween(a,b,t)
        return std.vec(a.x + (b.x-a.x)*t, a.y + (b.y-a.y)*t, a.z + (b.z-a.z)*t)
    end
    local right = std.normalize(std.cross(worldup, look))
    local left = std.vec(-right.x, -right.y, -right.z)
    local up = std.normalize(std.cross(look, right))
    local down = std.vec(-up.x, -up.y, -up.z)
    local off = (#pattern+1)//2
    local off2 = (#pattern[1]+1)//2
    local dim = #pattern[1]
    for i = 1, #pattern do
        for j = 1,dim do
            if not pattern[i]:sub(j,j):find("%s") then
                local t = (j-off2)*increment
                local ty = (i-off)*increment
                local dirlook = nil
                if ty < 0 then
                    dirlook = tween(look, down, -ty)
                else
                    dirlook = tween(look, up, ty)
                end
                dirlook = std.normalize(dirlook)
                local dir = nil
                if t < 0 then
                    dir = tween(dirlook, left, -t)
                else
                    dir = tween(dirlook, right, t)
                end
                dir = std.normalize(dir)
                proj_generator(dir)
            end
        end
    end
end