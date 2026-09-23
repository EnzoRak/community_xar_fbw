--I changed the code due to popular demand,
--but let it be known I like the old code.
function p.input(str)
    ga_debug_push("game_movement.input")
    p.input_meat(str)
    ga_debug_pop("game_movement.input")
end

function p.input_meat(str)
    local strs = game_str.split(str)
    --strs[1] should be "move".
    local kind = strs[2] --Could be "forward" or "bake", etc.
    local action = strs[3] --Can be "start", "stop", or "toggle".
    local var = "xar.movement." .. kind
    if not ga_exists(var) then
        ga_print("*** Error: global not found in game_movement.input_meat: " .. var)
        return
    end
    if      ( action == "start"     ) then ga_set_b(var, true)
    elseif  ( action == "stop"      ) then ga_set_b(var, false)
    elseif  ( action == "toggle"    ) then ga_toggle_b(var)
    end
end

function p.add_impulse(x,y,z)
    local impulse = ga_get_v("xar.movement.extra_impulse")
    std.vec_add_eq(impulse, std.vec(x,y,z))
    ga_set_v("xar.movement.extra_impulse", impulse)
end

function p.update_discrete()
    --Debugging.
    --Xar movement works by having a function called for a key DOWN event,
    --and another function called for a key UP event.
    --However, the brute force way of doing movement would be to simply
    --query if the appropriate key is up/down each update.
    -- if( ga_get_is_action_down("PACKAGE_MOVE_FORWARD") ) then
    --     ga_print("PACKAGE_MOVE_FORWARD is down")
    -- else
    --     ga_print("PACKAGE_MOVE_FORWARD is up")
    -- end

    if( not game_create_start_pos.found_starting_pos() ) then
        --We could not find a valid starting position for the player.
        --We don't want the player walking around causing trouble.
        return
    end

    --Rolling.
    p.update_discrete_roll()

    --Translation movement.

    local lpd = ga_get_sys_v("game.player.move.last_pos_diff")
    local time_step = 0.04
    local speed = std.length(lpd) / time_step

    --Extra impulse.
    local extra_impl = ga_get_v("xar.movement.extra_impulse")
    lpd.x = lpd.x + extra_impl.x
    lpd.y = lpd.y + extra_impl.y
    lpd.z = lpd.z + extra_impl.z
    ga_set_v("xar.movement.extra_impulse", std.vec_zero())

    --Setting drag and magnitude of acceleration.
    -- primary_speed_cutoff = 6.0 --Not being used!
    local drag  = game_air_drag_and_acc.get_air_drag()
    local m_acc = game_air_drag_and_acc.get_air_acc()
    -- if(
        -- ga_get_b("xar.movement.rocket") )
    -- then
        --Debugging:
        -- drag = 0.98
        -- m_acc = 0.5
        --
        -- drag = 0.98
        -- m_acc = 0.2
    -- else
        -- drag = 0.95
        -- m_acc = 0.1
    -- end

    -- if ga_get_b("xar.movement.brake") then
    --     drag = 0.8
    -- end

    --Getting the acc due the pressing keys.

    local vec_look = ga_get_sys_v("game.player.camera.look")
    local vec_up   = ga_get_sys_v("game.player.camera.up")
    local vec_left = ga_get_sys_v("game.player.camera.left")

    local use_true_up = ga_get_sys_b("game.player.move.fly.use_true_up")
    local use_z_axis = ga_get_b("xar.movement.move_on_z_axis")
    if( use_true_up and use_z_axis ) then
        vec_up = std.vec(0.0, 0.0, 1.0)
    end

    local acc = {x=0.0, y=0.0, z=0.0}
    if ga_get_b("xar.movement.forward") then
        acc.x = acc.x + vec_look.x
        acc.y = acc.y + vec_look.y
        acc.z = acc.z + vec_look.z
    end
    if ga_get_b("xar.movement.back") then
        acc.x = acc.x - vec_look.x
        acc.y = acc.y - vec_look.y
        acc.z = acc.z - vec_look.z
    end
    if ga_get_b("xar.movement.left") then
        acc.x = acc.x + vec_left.x
        acc.y = acc.y + vec_left.y
        acc.z = acc.z + vec_left.z
    end
    if ga_get_b("xar.movement.right") then
        acc.x = acc.x - vec_left.x
        acc.y = acc.y - vec_left.y
        acc.z = acc.z - vec_left.z
    end
    if ga_get_b("xar.movement.up") then
        acc.x = acc.x + vec_up.x
        acc.y = acc.y + vec_up.y
        acc.z = acc.z + vec_up.z
    end
    if ga_get_b("xar.movement.down") then
        acc.x = acc.x - vec_up.x
        acc.y = acc.y - vec_up.y
        acc.z = acc.z - vec_up.z
    end

    --Normalizing acc vector.
    if ( std.length(acc) < 0.0001 ) then
        acc = {x=0.0, y=0.0, z=0.0}
    else
        std.normalize(acc)
    end

    local speed_mod = 0.15
    acc.x = acc.x * m_acc * speed_mod
    acc.y = acc.y * m_acc * speed_mod
    acc.z = acc.z * m_acc * speed_mod

    if game_hud_water.in_water() then
        drag = drag * 0.975
        drag = drag * 2^(std.length_sq(lpd) * -0.02)
        --game_msg.add(tostring(std.length_sq(lpd)))
        --game_msg.add(tostring(2^(std.length_sq(lpd) * -0.02)))
    end

    --Scaled lpd.
    local slpd = {}
    slpd.x = lpd.x * drag
    slpd.y = lpd.y * drag
    slpd.z = lpd.z * drag

    --Setting the travel.
    local travel = {}
    travel.x = slpd.x + acc.x
    travel.y = slpd.y + acc.y
    travel.z = slpd.z + acc.z
    ga_move_set_desired_travel(travel)
end

--Rolling.
function p.update_discrete_roll()
    --The number roll_add is either -1,0, or 1.
    local roll_add = 0
    if ga_get_b("xar.movement.spin_cw") then roll_add = roll_add + 1.0 end
    if ga_get_b("xar.movement.spin_ccw") then roll_add = roll_add - 1.0 end

    --Getting the roll drag (customizable).
    local var = "movement.roll.drag"
    ga_package_init_f(var, 0.70) --Default num.
    local roll_angular_drag = ga_package_get_f(var)

    --Getting the roll acc (customizable)
    local var = "movement.roll.acc"
    ga_package_init_f(var, 0.01) --Default num.
    local roll_angular_acc = ga_package_get_f(var)

    --Computing the current roll value.
    local roll_value = ga_get_f("xar.movement.roll_value")
    roll_value = roll_value * roll_angular_drag
    roll_value = roll_value + (roll_add * roll_angular_acc)
    ga_set_f("xar.movement.roll_value", roll_value)

    --Telling the engine the current roll value.
    --This is how much the engine should rotate
    --the camera of the player.
    ga_move_set_roll(roll_value)
end
