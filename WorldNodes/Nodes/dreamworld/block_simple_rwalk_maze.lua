
function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_blue_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_DARK_CONCRETE_BLUE_BORDER")
    --i haven't really thought about how I want to design this... Technically, the start doesn't need to be set at the entrance, but it could be somewhere else, we just need to make sure that it is possible to enter. If it is not at the start, it would be balanced differently and the entrance logic would be different. 
    local out = std_walk3maze.generate_maze(0,0,0,14,14,14)
    for z = 0, 13 do
        for y = 0,13 do
            for x = 0, 13 do
                set_pos(x+1,y+1,z+1,"".. (out.maze[x][y][z] == 0 and "XAR_EMPTY_BORING" or "XAR_SOLID_BORING_DARK_CONCRETE_BLUE_BORDER"))
            end
        end
    end
    set_pos(15,15,15,"XAR_EMPTY_BORING")
    add_bent_s(15,15,15,"bent_base_txt","The entrance is under the opposite corner")
    set_pos(1,1,1, "XAR_STOPPER")
    set_pos(1,1,0, "XAR_EMPTY_BORING")
    add_bent(1,1,0, "bent_base_ring_pink_dest")
    set_pos(out.deepest.x+1, out.deepest.y+1, out.deepest.z+1, "block_rwalk_maze_treasure")
    set_pos(out.last.x+1, out.last.y+1, out.last.z+1, "block_rwalk_maze_intro")
end