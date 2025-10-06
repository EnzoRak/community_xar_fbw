--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "look_vec"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

--[[
function p.__update()
end
]]

function p.handler(str)
    ga_console_print(str)
    local strs = game_str.split(str)
    if( #str == 0 ) then return end --Uh oh!
    local x = strs[1]
    local y = strs[2]
    local z = strs[3]
    --ga_console_print("x" .. x.."y" ..y .."z" ..z)
    ga_camera_set_look(std.normalize(std.vec(x,y,z)),std.vec(0,1,0))
end

function p.get_help_str()
    return
           "Usage: look_vec x y z\n\n"
        .. "Changes player camera based on facing direction."
end
