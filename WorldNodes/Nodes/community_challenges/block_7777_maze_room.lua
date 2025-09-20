-- i thought about using blue ring for this but then i realized i needed to set terminal and down and up and all that typeof stuff, realized this was much simpler, even thinking about it. so I decided to do this instead. 
function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")

    local parent_depth = 1
    local parent_maze_encoded = ""
    local level = get_level()
    if( get_input_path_block_var_exists(level-1, "maze_w_depth", "i") ) then
        parent_depth = get_input_path_block_i(level-1, "maze_w_depth")
    end
    if( get_input_path_block_var_exists(level-1, "maze_encoded", "s") ) then
        parent_maze_encoded = get_input_path_block_s(level-1, "maze_encoded")
    end
    --same
    local depth = parent_depth
    local maze_encoded = parent_maze_encoded
    chunk_set_i("room_w_depth", depth)
    chunk_set_s("maze_encoded", maze_encoded)

    local digit = " "
    digit = get_input_path_block_s(level, "open_4d_id")

    if(digit == "A") then
    elseif(digit == "B") then
        --if the maze is not at position 7,7,5, then make sure you use block_set_v(x,y,z,"maze_pos",std.vec(mazex,mazey,mazez)) to configure it. 
        set_pos(9,9,5,"block_maze_down_teleporter")
        set_pos(7,7,5,"block_7777_maze")
    elseif(digit == "C") then
        set_pos(9,9,4,"block_maze_up_teleporter")
    elseif(digit == "D") then
        set_pos(9,9,5,"block_maze_down_teleporter")
        set_pos(9,9,4,"block_maze_up_teleporter")
        set_pos(7,7,5,"block_7777_maze")
    else
        --hallway...
        return
    end

    local n = get_input_path_block_v(level, "room_pos")
    add_bent_s(2,2,2,"bent_base_txt","You are at maze vertex position "..math.floor((n.x-1)/2)..","..math.floor((n.y-1)/2)..","..math.floor((n.z-1)/2)..","..depth.." in the maze, where the last number is your 'w-depth'. The treasure is at maze vertex position 6,6,6,6")

end


function p.__type_init(id)
    --String with length (2x-1)(2y-1)(2z-1)w
    ia_block_new_var_s(id, "maze_encoded", "")
    --A,B,C,D
    ia_block_new_var_s(id, "open_4d_id", "")
    --should be equal to the parent maze depth 
    ia_block_new_var_i(id, "room_w_depth", 0)
    --for text box (you don't need this)
    ia_block_new_var_v(id,"room_pos",std.vec(0,0,0))
end
