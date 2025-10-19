--This is called by the engine when the game is loaded.
function p.__load_game()
    local cmd_name = "dynls"
    game_command_system.add_command(cmd_name, p.handler)
    game_command_system.add_help(cmd_name, p.get_help_str())
end

function p.handler(str)
    local strs = game_str.split(str)
    local recursive = false
    local path_args = {}

    -- Extract "r" flag and path arguments
    for _, s in ipairs(strs) do
        if s == "r" then
            recursive = true
        else
            table.insert(path_args, s)
        end
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
    ga_dyn_init_s(str1, "test69")

    -- Print nodes
    p.printnodes(str1, 0, recursive)

    if ga_dyn_get_s(str1) == "test69" then
        ga_dyn_remove(str1)
    end
end



function p.printnodes(path, recursiveits, recursive)
    recursiveits = recursiveits or 0
    local prependendspaces = string.rep(" ", recursiveits * 2)

    ga_console_print("Internal nodes of " .. path .. ":")

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
        ga_console_print(prependendspaces .. name)
        -- Only recurse if recursive flag is true
        if recursive then
            local child_path = path .. (path:sub(-1) == "." and "" or ".") .. name
            p.printnodes(child_path, recursiveits + 1, recursive)
        end
    end


    -- Gather and print leaf nodes
    ga_console_print("Leaf nodes of " .. path .. ":")
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
