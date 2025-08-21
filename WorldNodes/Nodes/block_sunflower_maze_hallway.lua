function p.__get_is_solid() return false end
function p.__get_tex() return "" end

--i know its hallway for vertices also but idk man a better name
function p.__main()
    --this is safe, but basically useless at this pointin the game. can ascend and descend. It is very dusty, which is good.
    --I also thought about using XAR_HAPPY_LAND_IAN_3B but it has waypoints deep inside, so not safe
    --This should also make shrinking a decision, since growing is slightly harder.
    set_default_block("XAR_HAPPY_LAND_AIR")
    if(get_input_path_block_i(get_level(), "map")==1) then
        --invisible map lol, but there won't be anything else in the room, so it should be pretty obvious that its the map room
        --i actually hope this works, cause nowhere in the documentation does it say the maze seed is based off of srand
        srand(seed_from_last_of_type("block_sunflower_maze"))
        --oh here we go again
        --no we are not marking the current position of the player, l bozo
        --(even though i could)
        --somebody pls do this for me
        maze_start()
        for z = 1, 13, 2 do
            for x = 1, 13, 2 do
                for y = 1, 13, 2 do
                    --vertices
                    maze_add_vertex(x, y, z)
                    set_pos(x, y, z, "XAR_SOLID_BORING")
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
                        set_pos(x+1, y, z, "XAR_SOLID_BORING")
                    end
                    if (y + 2 <= 14 and maze_edge_open(x, y, z, x, y + 2, z)) then
                        set_pos(x, y+1, z, "XAR_SOLID_BORING")
                    end
                    if (z + 2 <= 15 and maze_edge_open(x, y, z, x, y, z + 2)) then
                        set_pos(x, y, z+1, "XAR_SOLID_BORING")
                    end
                end
            end
        end
    else
        local n = randf()
        --only one place
        local x = randi(2,13)
        local y = randi(2,13)
        local z = randi(2,13) 
        if(n < 0.9) then
            --roaming vs trapped
            local m = randf()
            --determiner
            local o = randf()
            if(m<0.7) then
                --trapped monster, so you can't access the drops
                create_rect("XAR_ANTI_PLUG_GLASS",x-1,y-1,z-1,x+1,y+1,z+1)
                set_pos(x,y,z,"XAR_EMPTY_BORING") 
                --for the kind of trapped monster. they all have to be drop boxed, or not drop anything at all
                if(o < 0.3) then
                    add_ment(x,y,z,"ment_monster_beholder_minor")
                elseif(o <0.5) then
                    add_ment(x,y,z,"ment_monster_jug_tough")
                elseif(o < 0.75) then
                    add_ment(x,y,z,"ment_monster_disciple")
                elseif(o<0.9) then
                    add_ment(x,y,z,"ment_monster_nuclear_launch_facility")
                else 
                    --ooooh
                    add_ment(x,y,z,"ment_monster_first_mate")
                end
            else
                --roaming monster, such as a projectile?
                if(o<0.1) then
                    add_ment(x,y,z,"ment_monster_rat_minor")
                elseif(o > 0.8) then
                    ment_start(x,y,z,"ment_monster_menace_proj")  
                    ment_set_f("__homing_speed", 5.0)
                    ment_set_f("__radius", 1.0)
                    ment_end()
                elseif(o>0.4) then
                    --doesn't actually make the screen darker.
                    for i = 1, 10 do
                        ment_start(x,y,z,"ment_monster_yin_yang_orange_proj")
                        ment_set_f("__radius", 2.0)
                        ment_set_s("__mesh", "cannon1")
                        ment_set_f("__homing_speed", 2.0)
                        ment_end()
                    end
                else
                    ment_start(x,y,z,"ment_monster_science_core_proj_proj")
                    ment_set_f("__radius", 3.0)
                    ment_set_f("__homing_speed", 4.0)
                    ment_end()
                end
            end
        else
            --map. Also, im too lazy to make the map another block type, so its gonna be in this block.
            create_rect("XAR_EMPTY_BORING",x-2,y-2,z-2,x+2,y+2,z+2)
            set_pos(x,y,z,"block_sunflower_maze_hallway")
            block_set_i(x,y,z, "map", 1)
            add_bent_s(7,7,7,"bent_base_txt","There is a map of the current maze somewhere in this room. It is surrounded by Empty Boring blocks instead of Happy Land Air. \n\nThis map does not show the entrances and exits of the maze, however they will correspond to the actual positions on the maze, if you know what I mean.\n\nAlso, it will not show your current position.")
        end
        --only one green ring, which might not even show up
        x = randi(0,15)
        y = randi(0,15)
        z = randi(0,15)
        if(get_pos(randi(0,15),randi(0,15),randi(0,15)) == "XAR_HAPPY_LAND_AIR") then
            add_bent(x,y,z,"bent_base_ring_green")
        end
        --no escape
        base_blue_tele.set_blue_type_terminal(0,0,0)
    end
end 

function p.__type_init(id)
    ia_block_new_var_i(id, "map", -1)
end

