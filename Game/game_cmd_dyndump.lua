--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "dyndump"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

function p.handler(str)
    ga_console_print("dyndump hopefully")
    ga_print("dyndump hopefully")
    ga_dyn_dump()
end

function p.get_help_str()
    return
           "Usage: dyndump\n\n"
        .. "calls ga_dyn_dump()"
end
