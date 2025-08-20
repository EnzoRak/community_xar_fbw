function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_border" end

function p.__main()
    set_default_block("block_sunflower_maze")
    if(get_input_path_block_var_exists(get_level()-1, "sundirection", "i")) then
        local sundirection = get_input_path_block_i(get_level()-1, "sundirection")
        --choices enjoyer <3
        create_rect("XAR_STOPPER",7,7,14,7,7,15)
        create_rect("XAR_STOPPER",7,7,0,7,7,1)
        if(sundirection < 2) then
            create_rect("XAR_STOPPER",7,14,7,7,15,7)
            create_rect("XAR_STOPPER",7,0,7,7,1,7)
        else
            create_rect("XAR_STOPPER",14,7,7,15,7,7)
            create_rect("XAR_STOPPER",0,7,7,1,7,7)
        end
    end
    maze_start()
    for z = 1, 13, 2 do
        for x = 1, 13, 2 do
            for y = 1, 13, 2 do
                --vertices
                maze_add_vertex(x, y, z)
                set_pos(x, y, z, "block_sunflower_maze_hallway")
            end
        end
    end
    for z = 1, 13, 2 do
        for x = 1, 13, 2 do
            for y = 1, 13, 2 do
                if (x + 2 <= 13) then
                    maze_add_edge(x, y, z, x + 2, y, z)
                end
                if (y + 2 <= 14) then
                    maze_add_edge(x, y, z, x, y + 2, z)
                end
                if (z + 2 <= 15) then
                    maze_add_edge(x, y, z, x, y, z + 2)
                end
            end
        end
    end
    maze_end()

    for z = 1, 13, 2 do
        for x = 1, 13, 2 do
            for y = 1, 13, 2 do
                --hallways
                if (x + 2 <= 13 and maze_edge_open(x, y, z, x + 2, y, z)) then
                    set_pos(x+1, y, z, "block_sunflower_maze_hallway")
                end
                if (y + 2 <= 14 and maze_edge_open(x, y, z, x, y + 2, z)) then
                    set_pos(x, y+1, z, "block_sunflower_maze_hallway")
                end
                if (z + 2 <= 15 and maze_edge_open(x, y, z, x, y, z + 2)) then
                    set_pos(x, y, z+1, "block_sunflower_maze_hallway")
                end
            end
        end
    end
end 