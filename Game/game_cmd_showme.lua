--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "showme"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

function p.handler(str)
    if not ga_get_sys_b("metagame.cheat.enabled") then
        ga_console_print("^1Cheating must be enabled")
        return
    end
    ga_set_b("community_xar_fbw.showmetoggle", not ga_get_b("community_xar_fbw.showmetoggle"))
    if(ga_get_b("community_xar_fbw.showmetoggle")) then
        ga_command("set metagame.player.camera.3rdp.enabled true")
        ga_ment_start(ga_get_viewer_level(),ga_get_viewer_lp(ga_get_viewer_level()),"ment_basic_me")
        ga_ment_end()
    else 
        ga_command("set metagame.player.camera.3rdp.enabled false")
    end
    
end

function p.get_help_str()
    return
           "Usage: showme\n\n"
        .. "Shows the player location in 3rd Person view"
end
