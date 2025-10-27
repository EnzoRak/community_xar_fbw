--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "dyntree"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

function p.handler(str)
    local strs = game_str.split(str)
    local path_args = {}

    for _, s in ipairs(strs) do
        table.insert(path_args, s)
    end

    -- Determine path
    local str1
    if #path_args == 0 then
        str1 = "dyn."
    else
        str1 = path_args[1]
        if not str1:find("^dyn%.") then
            str1 = "dyn." .. str1
        end
    end

    -- Initialize dyn path
    if(ga_dyn_exists(str1)== true) then
        p.printnodes(str1, 0)
        return
    end
    --else
    --ga_dyn_init_s(str1, "test69")
    -- Print nodes
    p.printnodes(str1, 0)
    --if ga_dyn_get_s(str1) == "test69" then
    --    ga_dyn_remove(str1)
    --end
end



function p.printnodes(path, recursiveits)
    recursiveits = recursiveits or 0
    local prependendspaces = string.rep(" ", recursiveits * 2)

    -- Gather all children first
    local children = {}
    ga_dyn_node_itr_start(path)
    while true do
        local name = ga_dyn_node_itr_next()
        if name == "" then break end
        table.insert(children, name)
    end

    -- Iterate children
    for _, name in ipairs(children) do
        ga_console_print(prependendspaces .. "^2" .. name)
        local child_path = path .. (path:sub(-1) == "." and "" or ".") .. name
        p.printnodes(child_path, recursiveits + 1)
    end


    -- Gather and print leaf nodes
    local leaves = {}
    ga_dyn_leaf_itr_start(path)
    while true do
        local name = ga_dyn_leaf_itr_next()
        if name == "" then break end
        table.insert(leaves, name)
    end

    for _, name in ipairs(leaves) do
        ga_console_print(prependendspaces .. string.format("%-35s%s", name, " "))
    end
end



function p.get_help_str()
    return
           "Usage: dynls dynpath\n\n"
        .. "gets the leaves (values) and branches (internal nodes) from the current dynpath\n"
        .. "supply the argument 'r' to recursively list all sub-nodes as well.\n"
end
