--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "open_window"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

function p.handler(str)
    --We are assuming game and main_menu window stacks are empty.
    --So the player is playing the game normally and unpaused.
    --Indeed, this is the only time that input binds are executed.
    --Could verify the game is unpaused with ga_get_game_paused()
    local strs = game_str.split(str)
    if( #strs == 0 ) then return end --Uh oh!
    local str1 = strs[1]
    if( str1 == "hud_1" ) then
        --A little hackish.
        ga_command("set menu.in_package true")
    elseif( str1 == "hud_2" ) then
        if( not game_genesis.enabled() ) then
            ga_window_push("win_stats2")
        end
    elseif( str1 == "hud_3" ) then
        if( not game_genesis.enabled() ) then
            ga_window_push("win_stats3")
        end
    elseif( str1 == "hud_4" ) then
        if( not game_genesis.enabled() ) then
            ga_window_push("win_stats4")
        end
    elseif( str1 == "hud_5") then
        ga_window_push("win_stats5")
    elseif( str1 == "hud_6" ) then
        ga_window_push("win_stats6")
    elseif( str1 == "hud_7" ) then
        ga_window_push("win_stats7")
    elseif( str1 == "fractalbase" ) then
        ga_window_push("win_fractalbase")
    end
    --Could complain if bad args.
end

function p.get_help_str()
    return
           "Usage: open_window\n\n"
        .. "Opens a window (such as a stats window for weapons). "
end
