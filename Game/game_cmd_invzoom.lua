--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "invzoom"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

--SOMEBODY PLS FIX THE FLASHES I CANT FIX THE FLASHES
--we might be able to increase the maximum number of levels above to be over 5 if we can somehow target the destination block
function p.__update()
    --impotent
    local rate = 0.97
    if ga_get_b("community_xar_fbw.invzooming") then
        if(ga_get_f("community_xar_fbw.curr_back_dist") <= ga_get_f("community_xar_fbw.max_back_dist")) then
            ga_shrink()
            ga_command("set metagame.player.camera.3rdp.back_dist ".. tostring(ga_get_f("community_xar_fbw.curr_back_dist")*16))
            ga_set_f("community_xar_fbw.curr_back_dist",ga_get_f("community_xar_fbw.curr_back_dist")*16)
        end
        local newone = ga_get_f("community_xar_fbw.curr_back_dist")*rate
        ga_command("set metagame.player.camera.3rdp.back_dist "..tostring(newone))
        ga_set_f("community_xar_fbw.curr_back_dist",newone)
    end
end

function p.handler(str)
    if not ga_get_sys_b("metagame.cheat.enabled") then
        ga_console_print("^1Cheating must be enabled")
        return
    end
    local strs = game_str.split(str)
    local num = 200
    if( #strs > 0 ) then
        num = tonumber(strs[1])
    end --Uh oh!
    ga_set_f("community_xar_fbw.max_back_dist",num)
    --base distance?
    local bd = 3200
    if( #strs > 1 ) then
        bd = tonumber(strs[2])
    end --Uh oh!
    if(ga_get_b("community_xar_fbw.invzooming")) then
        ga_command("set metagame.player.camera.3rdp.enabled false")
        ga_command("set metagame.player.camera.3rdp.back_dist 5")
        ga_command("set community_xar_fbw.curr_back_dist 5")
    else 
        if(ga_get_b("community_xar_fbw.zooming")) then
            ga_command("czoom")
        end
        ga_command("set metagame.player.camera.3rdp.enabled true")
        ga_command("set metagame.player.camera.3rdp.back_dist "..tostring(bd))
        ga_set_f("community_xar_fbw.curr_back_dist",bd)
    end
    --people are telling me this makes more sense
    ga_set_b("community_xar_fbw.invzooming", not ga_get_b("community_xar_fbw.invzooming"))
end

function p.get_help_str()
    return
           "Usage: invzoom \ninvzoom base_dist min_dist\n\n"
        .. "Exponentially zooms a 3rd person camera from the player at base_dist.\n\nAccurate to 5 levels above. "
        --at least for this first versino, it will work this way. 
end
