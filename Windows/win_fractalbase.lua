local last_menu = 0
local menu = 1

-- constants
local PROJ,HIT = 0,1 -- projectile, hitscan

-- the order MUST stay the same
p.enemy_data = { -- a big list of data, maybe make a better system?
    -- enemy format
    -- {<identity_str>, {<hp uncurved>, <dmg uncurved>, <PROJ|HIT>}, <basic info>, <info when killed by enemy>, <lore>}
    -- <identity_str> MUST be identical to the identity string of the enemy
    {"Goblin", {32, 1, PROJ}, "its a gobin", "gobin weak how you die", "Long ago, they had a war with the imps in the Ying World.  The goblins banished the imps from the trees and into these cement cubes. The fractal air is filled with these prisons. When the imps were banished, however, they took much of the gold from the Ying World with them.  In other parts of the fractal-verse, goblins and imps live peacefully together, but still only imps have gold."},
    {"Imp", {32, 1, PROJ}, "its a ip", "ip weak how you die", "Long ago, they had a war with the goblins in the Ying World.  The goblins banished the imps from the trees and into these cement cubes. The fractal air is filled with these prisons. When the imps were banished, however, they took much of the gold from the Ying World with them.  In other parts of the fractal-verse, goblins and imps live peacefully together, but still only imps have gold."},
}

p.map = {} -- performance reasons.
for i = 1,#p.enemy_data do p.map[p.enemy_data[i][1]] = i end

-- 0: undiscovered, 1: basic, 2: death, 3: all

local cur_search_str = ""

local enemy_options = {}

local tween = 0

function p.list(wid, u)
    if last_menu ~= menu or u or menu < 0 then last_menu = menu else return end

    if menu == 1 then
        local discovered = ga_get_s("community_xar_fbw.fractalbase.enemies_discovered")
        if #discovered < #p.enemy_data then
            discovered = discovered .. ("0"):rep(#p.enemy_data - #discovered)
            ga_set_s("community_xar_fbw.fractalbase.enemies_discovered", discovered)
        end

        enemy_options = {}

        for i = 1,#p.enemy_data do
            if discovered:sub(i,i) ~= "0" and string.find(p.enemy_data[i][1], cur_search_str) then enemy_options[#enemy_options+1] = p.enemy_data[i][1] end
        end

        local min_y = 0.15
        local max_y = 0.80
        local char_w = 0.015
        local char_h = 0.03
        local num_lines = 15
        local col = {x=0.0, y=0.5, z=0.5}
        ga_win_widget_large_list_start(wid, min_y, max_y, char_w, char_h, col, num_lines, enemy_options)
    end

    ga_win_widget_text_input_set_enable_enter(wid, false)
end

function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Return To Game (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)

    game_win_top_bar.create_stats_buttons(wid, 8)

    local num_buttons = 2
    local delta_x = 1.0 / num_buttons
    local x = 0.0
    local y = 0.94
    local w = 0.0075
    local h = 0.02
    ga_win_widget_button_start(wid, 101, x, y, w, h, "ENEMIES")
    ga_win_widget_button_start(wid, 102, x, y, w, h, "LOCATIONS")

    for i = 1,num_buttons do
        local center_x = (i - 1 + 0.5) * delta_x
        ga_win_widget_button_center_x_at(wid, 100 + i, center_x)
        ga_win_widget_button_set_color(wid, 100 + i, std.vec(0.0, 1.0, 1.0))
    end

    local min_y = 0.9
    local w = 0.01
    local h = 0.02
    ga_win_widget_text_input_start(wid, min_y, w, h)

    p.list(wid)
end

function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)

    game_win_top_bar.create_stats_buttons_bot_line(wid)
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end

    ga_win_widget_text_input_process_input(wid)
    local new_search_str = ga_win_widget_text_input_get_text(wid)
    if( new_search_str ~= cur_search_str ) then
        cur_search_str = new_search_str
        p.list(wid, true)
    end

    local sel_num = ga_win_widget_large_list_process_input(wid)
    if( sel_num >= 0 ) then
        local sel_str = ga_win_widget_large_list_get_entry(wid, sel_num)
        win_fractalbase_enemy.enemy = p.map[sel_str]
        ga_window_push("win_fractalbase_enemy")
    end

    local click_sel = game_win_top_bar.buttons_process_input_helper(wid)

    game_win_top_bar.input(wid, 8)

    if( click_sel == "ENEMIES" ) then menu = 1 end
    if( click_sel == "LOCATIONS" ) then menu = 2 end

    p.list(wid)

    color_green = std.vec(0.0, 1.0, 0.0)
    color_cyan = std.vec(0.0, 1.0, 1.0)
    for i = 1,2 do
        local color = color_cyan
        if( i == menu ) then color = color_green end
        ga_win_widget_button_set_color(wid, 100+i, color)
    end
end