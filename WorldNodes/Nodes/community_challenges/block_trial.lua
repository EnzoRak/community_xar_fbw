function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    local level = get_level()
    if get_input_path_block_b(level, "locked") then
        set_default_block("XAR_SOLID_BORING")
        return
    end
    local tier = get_input_path_block_i(level, "tier")
    srand(tier)
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 0,0,1, 15,15,15)
    create_rect("block_trial_walls", 1,1,2, 14,14,14)
    --Start creating the maze.
    maze_start()
    --Adding vertices to the maze.
    --The first for loop starts x at 0 and
    --goes to 15 inclusive, stepping by 2
    --each time.
    for x = 1,14,2 do
    for y = 1,14,2 do
    for z = 2,12,2 do
        maze_add_vertex(x,y,z)
        set_pos(x,y,z,"trial_air")
    end
    end
    end
    --Adding edges to the maze.
    --Only some of these will remain
    --in the final minimal spanning tree.
    for x = 1,14,2 do
    for y = 1,14,2 do
    for z = 2,12,2 do
        if (x+2 <= 14) then
            maze_add_edge(x,y,z, x+2,y,z)
        end
        if (y+2 <= 14) then
            maze_add_edge(x,y,z, x,y+2,z)
        end
    end
    end
    end
    for z = 2,12,2 do
        local x = math.floor(randi(1,13)/2)*2+1
        local y = math.floor(randi(1,13)/2)*2+1
        maze_add_edge(x,y,z, x,y,z+2)
        if z == 12 then
            set_pos(x,y,z+2, "trial_treasure")
        end
    end
    --Finish creating the maze.
    maze_end()
    --The graph (minimal spanning tree)
    --for the maze has been created.
    --An edge (between two vertices) is called "open"
    --if it is in the final minimal spanning tree.
    for x = 1,14,2 do
    for y = 1,14,2 do
    for z = 2,12,2 do
        if (x+2 <= 15) then
            if maze_edge_open(x,y,z, x+2,y,z) then
                set_pos(x+1,y,z,"trial_air")
            end
        end
        if (y+2 <= 15) then
            if maze_edge_open(x,y,z, x,y+2,z) then
                set_pos(x,y+1,z,"trial_air")
            end
        end
        if maze_edge_open(x,y,z, x,y,z+2) then
            set_pos(x,y,z+1,"XAR_STOPPER")
        end
    end
    end
    end
    add_bent_s(7,7,0, "bent_base_txt", "Current Tier: " .. tier .. "\n\nNote: More interesting content will be added in the trials in the future.")
    add_bent(7,8,0, "bent_base_ring_green")
    set_pos(7,7,1, "XAR_STOPPER")
end


function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    if not ga_block_get_b(level, bp, "locked") then
        return ""
    end
    local unlock_time = ga_block_get_f(level, bp, "unlock_time")
    local left = unlock_time - ga_get_game_time()
    if left <= 0 then
        return "Locked (Use to unlock)"
    end
    local secs = tostring(math.floor(left)%60)
    local time_left = math.floor(left/60) .. ":" .. (#secs == 1 and "0" or "") .. secs
    return "Locked ("..time_left..")"
end

function p.__on_use(level, bp)
    if not ga_block_get_b(level, bp, "locked") then
        return
    end
    local unlock_time = ga_block_get_f(level, bp, "unlock_time")
    local left = unlock_time - ga_get_game_time()
    if left <= 0 then
        ga_block_set_b(level, bp, "locked", false)
    end
end

function p.__on_use2(level, bp)
    if(p.__get_can_use(level,bp) == true) then
        p.__on_use(level, bp)
    end
end

function p.__type_init(id)
    ia_block_new_var_i(id, "tier", 0)
    ia_block_new_var_f(id, "unlock_time", 0)
    ia_block_new_var_b(id, "locked", false)
    ia_block_set_builtin_var_i(id, "__revert_length_bottom", 360000000) -- 100 thousand hours
end