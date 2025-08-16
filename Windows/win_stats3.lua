function p.get_colorblind_algorithm()
    if not ga_get_is_colorblind() then return "" end
    return "closest"
    -- return "list"
end

--Takes in a color code and an index
--and returns a modified color code.
function p.color_blind_helper(code, index)
    local original_cc = code
    local original_col = ga_color_code_to_vec(original_cc)
    local new_col = original_col
    local cc_alg = p.get_colorblind_algorithm()
    if cc_alg == "list" then
        new_col = ga_get_colorblind_bynum(index)
    elseif cc_alg == "closest" then
        new_col = ga_get_colorblind_closest(original_col)
    else
        new_col = original_col
    end
    local new_cc = ga_color_vec_to_code(new_col)
    return new_cc
end

function p.get_color_code_white()
    return p.color_blind_helper("^xffffff", 1)
end

function p.get_color_code_red()
    return p.color_blind_helper("^xff0000", 2)
end

function p.get_color_code_green()
    return p.color_blind_helper("^x00ff00", 3)
end

function p.get_color_code_yellow()
    return p.color_blind_helper("^xffff00", 4)
end

function p.get_color_code_purple()
    return p.color_blind_helper("^xff00ff", 5)
end

-------------------------------------------------

function p.calc_dmg_from_player(raw)
    local allow_powerups = false
    return game_damage.calc_damage_from_player(raw, allow_powerups)
end

function p.round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

--Will return either green or yellow,
--depending on whether num == max_num.
function p.max_color(num_var, max_num)
    num = ga_get_i(num_var)
    -- max_num = ga_get_i(max_num_var)
    if( num >= max_num ) then return p.get_color_code_green()
    else return p.get_color_code_yellow() end
end

function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg);

    game_win_top_bar.create_stats_buttons(wid, 3)

    p.create_tab_buttons(wid)
end

function p.create_tab_buttons(wid)
    local num_buttons = 10
    local delta_x = 1.0 / num_buttons
    local x = 0.0
    local y = 0.94
    local w = 0.0075
    local h = 0.02
    ga_win_widget_button_start(wid, 101, x, y, w, h, "GUN 1")
    ga_win_widget_button_start(wid, 102, x, y, w, h, "GUN 2")
    ga_win_widget_button_start(wid, 103, x, y, w, h, "GUN 3")
    ga_win_widget_button_start(wid, 104, x, y, w, h, "GUN 4")
    ga_win_widget_button_start(wid, 105, x, y, w, h, "GUN 5")
    ga_win_widget_button_start(wid, 106, x, y, w, h, "GUN 6")
    ga_win_widget_button_start(wid, 107, x, y, w, h, "GUN 7")
    ga_win_widget_button_start(wid, 108, x, y, w, h, "GUN 8")
    ga_win_widget_button_start(wid, 109, x, y, w, h, "GUN 9")
    ga_win_widget_button_start(wid, 110, x, y, w, h, "GUN 0")
    for i = 1,num_buttons do
        local center_x = (i - 1 + 0.5) * delta_x
        ga_win_widget_button_center_x_at(wid, 100 + i, center_x)
        ga_win_widget_button_set_color(wid, 100 + i, std.vec(0.0, 1.0, 1.0))
    end
    --more!!!
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)

    game_win_top_bar.create_stats_buttons_bot_line(wid)

    --Color codes.
    local cc_white  = p.get_color_code_white()
    local cc_red    = p.get_color_code_red()
    local cc_purple = p.get_color_code_purple()

    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.84, "INDIVIDUAL WEAPON STATS")

    ga_win_set_char_size(wid, 0.01, 0.02)
    ga_win_txt_center(wid, 0.80, "TYPE A WEAPON NUMBER OR USE LEFT / RIGHT ARROWS")

    -- if not ga_exists("temp.xar.stats2.win_num") then
    --     ga_create_i("temp.xar.stats2.win_num")
    --     ga_set_i("temp.xar.stats2.win_num", 1)
    -- end
    ga_init_i("temp.xar.stats3.win_num", 1)

    local win_num = ga_get_i("temp.xar.stats3.win_num")

    local min_x = 0.3
    local cur_y = 0.8
    local step_y = 0.04

    cur_y = cur_y - step_y
    cur_y = cur_y - step_y

    if win_num == 1 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #1 (Plasma)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas( game_wep_modes.get_ammo_max(1) ) )

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "REGENERATION: " ..
            p.round(1.0 / game_wep_modes.get_ammo_regen_period(1), 2) .. " per sec" )        

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(1,1)
        local mcolor = p.max_color(
            "xar.player.gun1.fire_period_level",
            game_wep_modes.get_fire_period_level_max(1))
        ga_win_txt(wid, min_x,cur_y, mcolor .. "FIRE RATE: " ..
            p.round(fire_rate,2) .. " per sec" ) 

        --Mode 1 (Primary).
        if game_wep_modes.get_equipped(1,1) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Basic High DPA): " ..
                game_str.add_commas(
                p.calc_dmg_from_player( game_wep_modes.get_curved_damage(1,1) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Basic High DPA): " ..
                game_str.add_commas( math.floor(p.round( game_wep_modes.get_dps(1,1)), 2) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Basic High DPA): " ..
                game_str.add_commas( math.floor( game_wep_modes.get_dpa(1,1) ) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun1.speed_level",
                game_wep_modes.get_vel_level_max(1))
            local speed1 = game_wep_modes.get_vel(1,1)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Basic High DPA): " .. speed1 .. " per sec")
        end

        --Mode 2 (Secondary).
        if game_wep_modes.get_equipped(1,2) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Rapid Fire): " ..
                game_str.add_commas(
                p.calc_dmg_from_player( game_wep_modes.get_curved_damage(1,2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Rapid Fire): " ..
                game_str.add_commas( math.floor( p.round( game_wep_modes.get_dps(1,2), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Rapid Fire): " ..
                game_str.add_commas( math.floor( game_wep_modes.get_dpa(1,2)) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun1.speed_level",
                game_wep_modes.get_vel_level_max(1))
            local speed2 = game_wep_modes.get_vel(1,2)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Rapid Fire): " .. speed2 .. " per sec")
        end

        --Mode 3.
        if game_wep_modes.get_equipped(1,3) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Plasma Shotgun): " ..
                game_str.add_commas(
                p.calc_dmg_from_player( game_wep_modes.get_curved_damage(1,3) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Plasma Shotgun): " ..
                game_str.add_commas( math.floor( p.round( game_wep_modes.get_dps(1,3), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Plasma Shotgun): " ..
                game_str.add_commas( math.floor( game_wep_modes.get_dpa(1,3)) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun1.speed_level",
                game_wep_modes.get_vel_level_max(1))
            local speed2 = game_wep_modes.get_vel(1,3)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Plasma Shotgun): " .. speed2 .. " per sec")
        end

        --Mode 4.
        if game_wep_modes.get_equipped(1,4) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Hyper Rapid Fire): " ..
                game_str.add_commas(
                p.calc_dmg_from_player( game_wep_modes.get_curved_damage(1,4) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Hyper Rapid Fire): " ..
                game_str.add_commas( math.floor( p.round( game_wep_modes.get_dps(1,4), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Hyper Rapid Fire): " ..
                game_str.add_commas( math.floor( game_wep_modes.get_dpa(1,4)) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun1.speed_level",
                game_wep_modes.get_vel_level_max(1))
            local speed2 = game_wep_modes.get_vel(1,4)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Hyper Rapid Fire): " .. speed2 .. " per sec")
        end

        --Mode 5.
        if game_wep_modes.get_equipped(1,5) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Lightning Rifle): " ..
                game_str.add_commas(
                p.calc_dmg_from_player( game_wep_modes.get_curved_damage(1,5) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Lightning Rifle): " ..
                game_str.add_commas( math.floor( p.round( game_wep_modes.get_dps(1,5), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Lightning Rifle): " ..
                game_str.add_commas( math.floor( game_wep_modes.get_dpa(1,5)) ) )
        end
    end

    if win_num == 2 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #2 (Cannon)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas( game_wep_modes.get_ammo_max(2) ) )

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(2,1)
        local mcolor = p.max_color(
            "xar.player.gun2.fire_period_level",
            game_wep_modes.get_fire_period_level_max(2))
        ga_win_txt(wid, min_x,cur_y, mcolor .. "FIRE RATE: " .. p.round(fire_rate,2) .. " per sec")

        --Mode 1.
        if game_wep_modes.get_equipped(2,1) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local damage = p.calc_dmg_from_player(
                game_wep_modes.get_curved_damage(2,1))
            ga_win_txt(wid, min_x,cur_y,
                "DAMAGE (Blunderbuss): " .. game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Blunderbuss): " ..
                game_str.add_commas( math.floor( p.round(game_wep_modes.get_dps(2,1), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Blunderbuss): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(2,1)) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun2.speed_level",
                game_wep_modes.get_vel_level_max(2))
            local speed1 = game_wep_modes.get_vel(2,1)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Blunderbuss): " .. speed1 .. " per sec")
        end

        --Mode 2.
        if game_wep_modes.get_equipped(2,2) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local damage = p.calc_dmg_from_player(
                game_wep_modes.get_curved_damage(2,2))
            ga_win_txt(wid, min_x,cur_y,
                "DAMAGE (Tommy Gun): " .. game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Tommy Gun): " ..
                game_str.add_commas( math.floor( p.round(game_wep_modes.get_dps(2,2), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Tommy Gun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(2,2)) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun2.speed_level",
                game_wep_modes.get_vel_level_max(2))
            local speed1 = game_wep_modes.get_vel(2,2)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Tommy Gun): " .. speed1 .. " per sec")
        end

        --Mode 3.
        if game_wep_modes.get_equipped(2,3) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local damage = p.calc_dmg_from_player(
                game_wep_modes.get_curved_damage(2,3))
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Chaining Cannon Ball): " ..
                game_str.add_commas( math.floor(damage) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Chaining Cannon Ball): " ..
                game_str.add_commas( math.floor( p.round(game_wep_modes.get_dps(2,3), 2) ) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Chaining Cannon Ball): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(2,3)) ) )

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun2.speed_level",
                game_wep_modes.get_vel_level_max(2))
            local speed2 = game_wep_modes.get_vel(2,3)
            ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY (Chaining Cannon Ball): " .. speed2 .. " per sec")
        end

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(2) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 3 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #3 (Laser)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
           game_str.add_commas( game_wep_modes.get_ammo_max(3) ) )
        cur_y = cur_y - step_y

        local fire_rate = 1.0 / game_wep_modes.get_fire_period(3,1)
        ga_win_txt(wid, min_x,cur_y, "FIRE RATE: " .. p.round(fire_rate,2) .. " per sec")
        
        --Ok to print this.
        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, cc_purple .. "SPECIAL DAMAGE FACTOR: " ..
            ga_get_i("xar.player.gun3.num_level") + 1)

        --Mode 1.
        if game_wep_modes.get_equipped(3,1) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(3,1)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Ice Laser): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Ice Laser): " ..
                game_str.add_commas( math.floor( p.round(game_wep_modes.get_dps(3,1), 2) ) ))

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Ice Laser): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(3,1)) ) )

            cur_y = cur_y - step_y
            local freeze_time = game_wep_modes.get_freeze_length(3,1)
            local mcolor = p.max_color(
                "xar.player.gun3.freeze_time_level",
                game_wep_modes.get_freeze_length_level_max(3))
            ga_win_txt(wid, min_x,cur_y, mcolor .. "FREEZE TIME: "
                .. p.round(freeze_time,2) .. " sec")
        end

        --Mode 2.
        if game_wep_modes.get_equipped(3,2) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(3,2)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Cold Beam): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Cold Beam): " ..
                game_str.add_commas( math.floor( p.round(game_wep_modes.get_dps(3,2), 2) ) ))

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Cold Beam): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(3,2)) ) )

            cur_y = cur_y - step_y
            local freeze_time = game_wep_modes.get_freeze_length(3,2)
            local mcolor = p.max_color(
                "xar.player.gun3.freeze_time_level",
                game_wep_modes.get_freeze_length_level_max(3))
            ga_win_txt(wid, min_x,cur_y, mcolor .. "FREEZE TIME: "
                .. p.round(freeze_time,2) .. " sec")
        end

        --Mode 3.
        if game_wep_modes.get_equipped(3,3) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(3,3)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Freeze Ray): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Freeze Ray): " ..
                game_str.add_commas( math.floor( p.round(game_wep_modes.get_dps(3,3), 2) ) ))

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Freeze Ray): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(3,3)) ) )

            cur_y = cur_y - step_y
            local freeze_time = game_wep_modes.get_freeze_length(3,3)
            local mcolor = p.max_color(
                "xar.player.gun3.freeze_time_level",
                game_wep_modes.get_freeze_length_level_max(3))
            ga_win_txt(wid, min_x,cur_y, mcolor .. "FREEZE TIME: "
                .. p.round(freeze_time,2) .. " sec (BUT STACKING)")
        end

        --Mode 4.
            if game_wep_modes.get_equipped(3,4) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(3,4)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Laser Disco): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Laser Disco): " .. 
                game_str.add_commas( math.floor( game_wep_modes.get_dps(3,4)) ))

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Laser Disco): " ..
                game_str.add_commas( math.floor( game_wep_modes.get_dpa(3,4)) ))
        end

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(3) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 4 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #4 (Rocket)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas( game_wep_modes.get_ammo_max(4) ) )

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(4,1)
        local mcolor = p.max_color(
            "xar.player.gun4.fire_period_level",
            game_wep_modes.get_fire_period_level_max(4))
        ga_win_txt(wid, min_x,cur_y, mcolor .. "FIRE RATE: " .. p.round(fire_rate,2) .. " per sec")

        --Mode 1 (Basic rockets)
        if game_wep_modes.get_equipped(4,1) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local damage = game_wep_modes.get_curved_direct_hit_from_player(4,1)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE DIRECT HIT (Basic): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_expl_damage(4,1)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE SPLASH (Basic): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local speed1 = game_wep_modes.get_vel(4,1)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (Basic): " .. speed1 .. " per sec")

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun4.radius_level",
                game_wep_modes.get_radius_level_max(4))
            ga_win_txt(wid, min_x,cur_y, mcolor .. "RADIUS (Basic): " ..
                game_wep_modes.get_radius(4,1) )
        end

        --Mode 2 (High velocity rockets)
        if game_wep_modes.get_equipped(4,2) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local damage = game_wep_modes.get_curved_direct_hit_from_player(4,2)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE DIRECT HIT (High Velocity): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local speed1 = game_wep_modes.get_vel(4,2)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (High Velocity): " .. speed1 .. " per sec")
        end

        --Mode 3 (Big radius)
        if game_wep_modes.get_equipped(4,3) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local damage = game_wep_modes.get_curved_direct_hit_from_player(4,3)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE DIRECT HIT (Big Radius): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_expl_damage(4,3)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE SPLASH (Big Radius): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local speed1 = game_wep_modes.get_vel(4,3)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (Big Radius): " .. speed1 .. " per sec")

            cur_y = cur_y - step_y
            local mcolor = p.max_color(
                "xar.player.gun4.radius_level",
                game_wep_modes.get_radius_level_max(4))
            ga_win_txt(wid, min_x,cur_y, mcolor .. "RADIUS (Big Radius): " ..
                game_wep_modes.get_radius(4,3) )
        end

        --Mode 4 (Kinetic)
        if game_wep_modes.get_equipped(4,4) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(4,4)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Kinetic Mode): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local speed2 = game_wep_modes.get_vel(4,4)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (Kinetic Mode): " .. speed2 .. " per sec")
        end

        --Mode 5 (Kinetic)
        if game_wep_modes.get_equipped(4,5) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(4,5)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Progressive Mode): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local speed2 = game_wep_modes.get_vel(4,5)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (Progressive Mode): " .. speed2 .. " per sec")

            cur_y = cur_y - step_y
            cur_y = cur_y - step_y
        end

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y

        if not game_can_use.main(4) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 5 then
        --THIS REALLY ONLY DESCRIBES THE PRIMARY FIRE!!!
        --SECONDARY SHOOTS MORE AMMO PER SECOND!!!

        ga_win_txt(wid, min_x,cur_y, "WEAPON #5 (Homing Rocket)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas(game_wep_modes.get_ammo_max(5)) )

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "DPA: " ..
            game_str.add_commas( math.floor(game_wep_modes.get_dpa(5,1)) ) )

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(5,1)
        local mcolor = p.max_color(
            "xar.player.gun5.fire_period_level",
            game_wep_modes.get_fire_period_level_max(5))
        ga_win_txt(wid, min_x,cur_y, mcolor .. "FIRE RATE: " .. p.round(fire_rate,2) .. " per sec")

        cur_y = cur_y - step_y
        local mcolor = p.max_color(
            "xar.player.gun5.speed_level",
            game_wep_modes.get_vel_level_max(5))
        local speed = game_wep_modes.get_vel(5,1)
        ga_win_txt(wid, min_x,cur_y, mcolor .. "VELOCITY: " .. speed .. " per sec")

        --Primary only.
        cur_y = cur_y - step_y

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "DPS (primary): " ..
            game_str.add_commas( math.floor(game_wep_modes.get_dps(5,1)) ) )

        --Secondary only.
        cur_y = cur_y - step_y

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "DPS (secondary): " ..
            game_str.add_commas( math.floor(game_wep_modes.get_dps(5,2)) ) )
        
        cur_y = cur_y - step_y
        local raw_damage = game_wep_modes.get_curved_shot_damage(5,2)
        local single_shot_damage = p.calc_dmg_from_player(raw_damage) --Allowing powerups.
        ga_win_txt(wid, min_x,cur_y, "SINGLE SHOT DAMAGE: " .. tostring(single_shot_damage))

        cur_y = cur_y - step_y
        local damage_before_cooldown = single_shot_damage * game_ment_homing_nerf.num_slots();
        ga_win_txt(wid, min_x,cur_y, "MAX MONSTER DAMAGE BEFORE COOLDOWN: " .. tostring(damage_before_cooldown))

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(5) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 6 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #6 (Minigun)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas( game_wep_modes.get_ammo_max(6) ) )

        --Ok to print this.
        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, cc_purple .. "SPECIAL DAMAGE FACTOR: " ..
            ga_get_i("xar.player.gun6.num_level") + 1)

        --Primary only.
        cur_y = cur_y - step_y

        cur_y = cur_y - step_y
        local raw_damage = game_wep_modes.get_curved_damage(6,1)
        local damage = p.calc_dmg_from_player(raw_damage)
        ga_win_txt(wid, min_x,cur_y, "DAMAGE (primary): " ..
            game_str.add_commas(damage) )

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(6,1)
        local mcolor = p.max_color(
            "xar.player.gun6.fire_period_level",
            game_wep_modes.get_fire_period_level_max(6))
        ga_win_txt(wid, min_x,cur_y, mcolor ..
            "FIRE RATE (primary): " .. p.round(fire_rate,2) .. " per sec")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "DPS (primary): " ..
            game_str.add_commas( math.floor(game_wep_modes.get_dps(6,1)) ) )

        --Secondary only.
        cur_y = cur_y - step_y

        cur_y = cur_y - step_y
        local raw_damage = game_wep_modes.get_poison_total_damage(6,2)
        local damage = p.calc_dmg_from_player(raw_damage)
        ga_win_txt(wid, min_x,cur_y, "DAMAGE (secondary): " ..
            game_str.add_commas(damage) )

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(6,2)
        local mcolor = p.max_color(
            "xar.player.gun6.fire_period_level",
            game_wep_modes.get_fire_period_level_max(6))
        ga_win_txt(wid, min_x,cur_y, mcolor ..
            "FIRE RATE (secondary): " .. p.round(fire_rate,2) .. " per sec")

        cur_y = cur_y - step_y
        local dps = game_wep_modes.get_dps(6,2)
        ga_win_txt(wid, min_x,cur_y, "DPS (secondary): " ..
            game_str.add_commas( math.floor(dps) ) )

        -- cur_y = cur_y - step_y
        -- ga_win_txt(wid, min_x,cur_y, "DPA (primary): " ..
        --     game_str.add_commas(damage) )

        cur_y = cur_y - step_y
        local speed = game_wep_modes.get_vel(6,2)
        local mcolor = p.max_color(
            "xar.player.gun6.speed_level",
            game_wep_modes.get_vel_level_max(6))
        ga_win_txt(wid, min_x,cur_y, mcolor ..
            "VELOCITY: (secondary): " .. speed .. " per sec")

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(6) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 7 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #7 (Railgun)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas( game_wep_modes.get_ammo_max(7) ) )

        cur_y = cur_y - step_y
        local fire_rate = 1.0 / game_wep_modes.get_fire_period(7,1)
        local mcolor = p.max_color(
            "xar.player.gun7.fire_period_level",
            game_wep_modes.get_fire_period_level_max(7))
        ga_win_txt(wid, min_x,cur_y, mcolor .. "FIRE RATE: " .. p.round(fire_rate, 2) .. " per sec")

        --Mode 1.
        if game_wep_modes.get_equipped(7,1) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(7,1)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Classic Railgun): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Classic Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dps(7,1)) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Classic Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(7,1))) )
        end

        --Mode 2.
        if game_wep_modes.get_equipped(7,2) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(7,2)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Rapid Railgun): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Rapid Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dps(7,2)) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Rapid Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(7,2))) )
        end

        --Mode 3.
        if game_wep_modes.get_equipped(7,3) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(7,3)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Vampire Railgun): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Vampire Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dps(7,3)) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Vampire Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(7,3)) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_white .. "HEALTH BONUS (Vampire Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_health_bonus(7,3)) ) )
        end

        --Mode 4.
        if game_wep_modes.get_equipped(7,4) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(7,4)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Super Vampire Railgun): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPS (Super Vampire Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dps(7,4)) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DPA (Super Vampire Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_dpa(7,4)) ) )

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_white .. "HEALTH BONUS (Super Vampire Railgun): " ..
                game_str.add_commas( math.floor(game_wep_modes.get_health_bonus(7,4)) ) )
        end

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(7) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 8 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #8 (EMP)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas(game_wep_modes.get_ammo_max(8)) )

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "RADIUS: " ..
            game_str.add_commas( game_wep_modes.get_radius(8,1) ) )

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "FREEZE TIME: " ..
            game_str.add_commas( game_wep_modes.get_freeze_length(8,1) ) .. " sec" )

        --Primary only.
        --Nothing to print.

        --Secondary only.
        cur_y = cur_y - step_y

        cur_y = cur_y - step_y
        local raw_damage = game_wep_modes.get_curved_damage(8,2)
        local damage = p.calc_dmg_from_player(raw_damage)
        ga_win_txt(wid, min_x,cur_y, "DAMAGE (secondary): " ..
            game_str.add_commas(damage) )

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(8) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 9 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #9 (Nuke)")

        cur_y = cur_y - step_y
        ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
            game_str.add_commas( game_wep_modes.get_ammo_max(9) ) )

        --Mode 1.
        if game_wep_modes.get_equipped(9,1) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(9,1)
            local damage = p.calc_dmg_from_player(raw_damage);
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (High Damage): " ..
                game_str.add_commas( damage ) );

            cur_y = cur_y - step_y
            local speed = game_wep_modes.get_vel(9,1)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (High Damage): " ..
                game_str.add_commas(speed) .. " per sec");

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "RADIUS (High Damage): " ..
                game_str.add_commas( game_wep_modes.get_radius(9,1) ) )
        end

        --Mode 2.
        if game_wep_modes.get_equipped(9,2) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(9,2)
            local damage = p.calc_dmg_from_player(raw_damage)
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (High Velocity and Radius): " ..
                game_str.add_commas(damage) )

            cur_y = cur_y - step_y
            local speed = game_wep_modes.get_vel(9,2)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY (High Velocity and Radius): " ..
                game_str.add_commas(speed) .. " per sec")

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "RADIUS (High Velocity and Radius): " ..
                game_str.add_commas(game_wep_modes.get_radius(9,2)) )
        end

        --Mode 3.
        if game_wep_modes.get_equipped(9,3) then
            cur_y = cur_y - step_y

            cur_y = cur_y - step_y
            local raw_damage = game_wep_modes.get_curved_damage(9,3)
            local damage = p.calc_dmg_from_player(raw_damage);
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (Nuclear Pulse Propulsion): " ..
                game_str.add_commas( damage ) );

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "RADIUS (Nuclear Pulse Propulsion): " ..
                game_str.add_commas( game_wep_modes.get_radius(9,3) ) )
        end

        cur_y = cur_y - step_y
        cur_y = cur_y - step_y
        if not game_can_use.main(9) then
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end

    if win_num == 10 then
        ga_win_txt(wid, min_x,cur_y, "WEAPON #10 (Dark Hole)")

        if game_can_use.main(0) then

            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "MAX AMMO: " ..
                game_str.add_commas( game_wep_modes.get_ammo_max(0) ) )

            cur_y = cur_y - step_y
            local speed = game_wep_modes.get_vel(0,1)
            ga_win_txt(wid, min_x,cur_y, "VELOCITY: " ..
                game_str.add_commas(speed) .. " per sec")

            cur_y = cur_y - step_y
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, "DAMAGE (direct hit): ")

            for i = 1,12 do
                cur_y = cur_y - step_y
                local raw_damage = game_wep_modes.get_curved_damage(0,1)
                -- local damage_mod = game_inv_exec.dark_hole_damage_factor(i) --Broken.
                local damage_mod = game_item_gun_0_1.dark_hole_damage_factor(i) --New way.
                --The times 2 is because a direct hit also does AOE to the target monster.
                local damage = raw_damage * damage_mod
                local curved_damage = game_difficulty_curve.curve_player_damage(damage) * 10 * 2
                local allow_powerups = false
                local adjusted_damage = game_damage.calc_damage_from_player(curved_damage, allow_powerups)

                ga_win_txt(wid, min_x,cur_y, tostring(i) .. " CHARGE: " ..
                    game_str.add_commas( math.floor(adjusted_damage) ) )
            end
        else
            cur_y = cur_y - step_y
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "YOU CANNOT USE THIS WEAPON BECAUSE YOU ")
            cur_y = cur_y - step_y
            ga_win_txt(wid, min_x,cur_y, cc_red .. "HAVE NOT PICKED UP AN UPGRADE FOR IT")
        end
    end
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    local click_sel = game_win_top_bar.buttons_process_input_helper(wid)

    game_win_top_bar.input(wid, 3)

    --Switching sub windows.
    ga_init_i("temp.xar.stats3.win_num", 1)
    num = ga_get_i("temp.xar.stats3.win_num")
    if ga_win_key_pressed(wid, "1") then num = 1 end
    if ga_win_key_pressed(wid, "2") then num = 2 end
    if ga_win_key_pressed(wid, "3") then num = 3 end
    if ga_win_key_pressed(wid, "4") then num = 4 end
    if ga_win_key_pressed(wid, "5") then num = 5 end
    if ga_win_key_pressed(wid, "6") then num = 6 end
    if ga_win_key_pressed(wid, "7") then num = 7 end
    if ga_win_key_pressed(wid, "8") then num = 8 end
    if ga_win_key_pressed(wid, "9") then num = 9 end
    if ga_win_key_pressed(wid, "0") then num = 10 end
    if( click_sel == "GUN 1" ) then num = 1 end
    if( click_sel == "GUN 2" ) then num = 2 end
    if( click_sel == "GUN 3" ) then num = 3 end
    if( click_sel == "GUN 4" ) then num = 4 end
    if( click_sel == "GUN 5" ) then num = 5 end
    if( click_sel == "GUN 6" ) then num = 6 end
    if( click_sel == "GUN 7" ) then num = 7 end
    if( click_sel == "GUN 8" ) then num = 8 end
    if( click_sel == "GUN 9" ) then num = 9 end
    if( click_sel == "GUN 0" ) then num = 10 end
    if ( ( ga_win_mouse_wheel_down(wid) or ga_win_key_pressed(wid, "LEFT")  ) and num > 1 ) then num = num - 1 end
    if ( ( ga_win_mouse_wheel_up(wid)   or ga_win_key_pressed(wid, "RIGHT") ) and num < 10 ) then num = num + 1 end
    ga_set_i("temp.xar.stats3.win_num", num)

    --Setting the tab colors correctly.
    color_green = std.vec(0.0, 1.0, 0.0)
    color_cyan = std.vec(0.0, 1.0, 1.0)
    for i = 1,10 do
        local color = color_cyan
        if( i == num ) then color = color_green end
        ga_win_widget_button_set_color(wid, 100+i, color)
    end
end
