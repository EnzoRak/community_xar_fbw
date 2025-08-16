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

function p.get_color_code_green()
    return p.color_blind_helper("^x00ff00", 2)
end

function p.get_color_code_yellow()
    return p.color_blind_helper("^xffff00", 3)
end

function p.get_color_code_purple()
    return p.color_blind_helper("^xff00ff", 4)
end

-------------------------------------------------

function p.round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function p.to5(num)
    str = "" .. num
    if( num < 10 ) then return str .. "    " end
    if( num < 100 ) then return str .. "   " end
    if( num < 1000 ) then return str .. "  " end
    return str .. " "
end

function p.to5max(num, max_num)
    str = ""
    if( num >= max_num ) then
        str = str .. p.get_color_code_green()
    else
        str = str .. p.get_color_code_yellow()
    end
    str = str .. num .. "^!"
    if( num < 10 ) then return str .. "    " end
    if( num < 100 ) then return str .. "   " end
    if( num < 1000 ) then return str .. "  " end
    return str .. " "
end

-------------------------------------------------

function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)

    game_win_top_bar.create_stats_buttons(wid, 2)
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)
    
    local cc_purple = p.get_color_code_purple()

    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.88, "UPGRADES")

    min_x = 0.2
    min_y = 0.06

    ga_win_set_char_size(wid, 0.01, 0.02)
    ga_win_txt(wid, min_x, min_y+0.76,
        "CAP = Max Ammo, REG = Ammo Regen, RTE = Fire Rate, DMG = Damage")
    ga_win_txt(wid, min_x, min_y+0.72,
        "VEL = Velocity, RAD = Radius, FZE = Freeze Time, NUM = \"Number\"")

    --min_x = 0.33
    min_x = 0.3

    cur_y = 0.7
    ga_win_txt(wid, min_x, cur_y,
        "GUN    CAP  REG  RTE  DMG  VEL  RAD  FZE  NUM")

    cur_y = cur_y - 0.04
    line = "1.     "
        .. p.to5( ga_get_i("xar.player.gun1.ammo_level") )
        .. p.to5( ga_get_i("xar.player.gun1.ammo_regen_level") )
        .. p.to5max( ga_get_i("xar.player.gun1.fire_period_level"),
            game_wep_modes.get_fire_period_level_max(1) )
        .. p.to5( ga_get_i("xar.player.gun1.damage_level") )
        .. p.to5max( ga_get_i("xar.player.gun1.speed_level"),
            game_wep_modes.get_vel_level_max(1) )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "2.     "
        .. p.to5( ga_get_i("xar.player.gun2.ammo_level") )
        .. "     "
        -- .. "X    "
        .. p.to5max( ga_get_i("xar.player.gun2.fire_period_level"),
            game_wep_modes.get_fire_period_level_max(2) )
        .. p.to5( ga_get_i("xar.player.gun2.damage_level") )
        .. p.to5max( ga_get_i("xar.player.gun2.speed_level"),
            game_wep_modes.get_vel_level_max(2) )
        .. "     "
        .. "     "
        -- .. "X    "
        .. p.to5max( ga_get_i("xar.player.gun2.num_level"),
            game_wep_modes.get_num_level_max(2) )
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "3.     "
        .. p.to5( ga_get_i("xar.player.gun3.ammo_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        .. p.to5( ga_get_i("xar.player.gun3.damage_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        .. p.to5max( ga_get_i("xar.player.gun3.freeze_time_level"),
            game_wep_modes.get_freeze_length_level_max(3) )
        -- .. "X    "
        .. cc_purple .. p.to5( ga_get_i("xar.player.gun3.num_level") ) .. "^!"
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04;
    line = "4.     "
        .. p.to5( ga_get_i("xar.player.gun4.ammo_level") )
        .. "     "
        -- .. "X    "
        .. p.to5max( ga_get_i("xar.player.gun4.fire_period_level"),
            game_wep_modes.get_fire_period_level_max(4) )
        .. p.to5( ga_get_i("xar.player.gun4.damage_level") )
        .. p.to5( ga_get_i("xar.player.gun4.speed_level") )
        .. p.to5max( ga_get_i("xar.player.gun4.radius_level"),
            game_wep_modes.get_radius_level_max(4) )
        .. "    "
        -- .. "X   "
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "5.     "
        .. p.to5( ga_get_i("xar.player.gun5.ammo_level") )
        .. "     "
        -- .. "X    "
        .. p.to5max( ga_get_i("xar.player.gun5.fire_period_level"),
            game_wep_modes.get_fire_period_level_max(5) )
        .. p.to5( ga_get_i("xar.player.gun5.damage_level") )
        .. p.to5max( ga_get_i("xar.player.gun5.speed_level"),
            game_wep_modes.get_vel_level_max(5) )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "6.     "
        .. p.to5( ga_get_i("xar.player.gun6.ammo_level") )
        .. "     "
        -- .. "X    "
        .. p.to5max( ga_get_i("xar.player.gun6.fire_period_level"),
            game_wep_modes.get_fire_period_level_max(6) )
        .. p.to5( ga_get_i("xar.player.gun6.damage_level") )
        .. p.to5max( ga_get_i("xar.player.gun6.speed_level"),
            game_wep_modes.get_vel_level_max(6) )
        .. "     "
        .. "     "
        -- .. "X    "
        .. cc_purple .. p.to5( ga_get_i("xar.player.gun6.num_level") ) .. "^!"
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "7.     "
        .. p.to5( ga_get_i("xar.player.gun7.ammo_level") )
        .. "     "
        -- .. "X    "
        .. p.to5max( ga_get_i("xar.player.gun7.fire_period_level"),
            game_wep_modes.get_fire_period_level_max(7) )
        .. p.to5( ga_get_i("xar.player.gun7.damage_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "8.     "
        .. p.to5( ga_get_i("xar.player.gun8.ammo_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
        .. p.to5( ga_get_i("xar.player.gun8.damage_level") )
        .. "     "
        -- .. "X    "
        .. p.to5( ga_get_i("xar.player.gun8.radius_level") )
        .. p.to5( ga_get_i("xar.player.gun8.freeze_time_level") )
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "9.     "
        .. p.to5( ga_get_i("xar.player.gun9.ammo_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
        .. p.to5( ga_get_i("xar.player.gun9.damage_level") )
        .. p.to5( ga_get_i("xar.player.gun9.speed_level") )
        .. p.to5( ga_get_i("xar.player.gun9.radius_level") )
        .. "     "
        -- .. "X    "
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    line = "0.     "
        .. p.to5( ga_get_i("xar.player.gun0.ammo_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
        .. p.to5( ga_get_i("xar.player.gun0.damage_level") )
        .. p.to5( ga_get_i("xar.player.gun0.speed_level") )
        .. "     "
        -- .. "X    "
        .. "     "
        -- .. "X    "
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = 0.24
    min_x = 0.1

    health_lev = ga_get_i("xar.player.health.level")
    local max_shield = ga_get_i("xar.player.shield.max")
    local max_health = ga_get_i("xar.player.health.max")
    line = "Health Level = "
        .. game_str.add_commas(health_lev)
        .. " (max shield = "
        .. (game_str.add_commas(max_shield))
        .. ", max health = "
        .. (game_str.add_commas(max_health))
        .. ")";
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    health_regen_lev = ga_get_i("xar.player.health.regen_level")
    line = "Health Regen Level = "
        .. game_str.add_commas(health_regen_lev)
        .. " (+"
        .. game_str.add_commas( p.round( 2.0 * 1.0 / ga_get_f("xar.player.health.regen"), 2) )
        .. " shield per sec, +"
        .. game_str.add_commas( p.round( 1.0 / ga_get_f("xar.player.health.regen"), 2 ) )
        .. " health per sec)"
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    extra_health_regen_lev =
        ga_get_i("xar.player.health.extra_regen_level")
    extra_health_per_sec = 1.0 / ga_get_f("xar.player.health.extra_regen")
    -- ga_print("extra_health_per_sec = " .. tostring(extra_health_per_sec))
    fixed_extra_health_per_sec = 0.0
    if( extra_health_per_sec > 0.0 ) then fixed_extra_health_per_sec = extra_health_per_sec end
    -- ga_print("fixed_extra_health_per_sec = " .. tostring(fixed_extra_health_per_sec))
    line = ">100% Health Regen Level = "
        .. game_str.add_commas(extra_health_regen_lev)
        .. " (+"
        .. game_str.add_commas( p.round(fixed_extra_health_per_sec, 2) )
        -- .. game_str.add_commas( extra_health_regen_lev / 8.0 )
        .. " health per sec if 100% <= health < 200%)"
    ga_win_txt(wid, min_x, cur_y, line)

    cur_y = cur_y - 0.04
    armor_regen_lev = ga_get_i("xar.player.armor.regen_level")
    fixed_extra_armor_per_sec = 0.0
    armor_regen = ga_get_f("xar.player.armor.regen")
    if( armor_regen > 0.0 ) then fixed_extra_armor_per_sec = 1.0 / armor_regen end
    line = "Armor Regen Level = "
        .. cc_purple
        .. game_str.add_commas(armor_regen_lev)
        .. "^!"
        .. " (+"
        .. game_str.add_commas( p.round(fixed_extra_armor_per_sec, 2) )
        .. " armor per sec)"
    ga_win_txt(wid, min_x, cur_y, line)
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    game_win_top_bar.input(wid, 2)
end
