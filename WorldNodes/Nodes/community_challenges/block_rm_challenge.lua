function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    
    
    --dud:
    set_blue_type_down(15,0,15)

    --worked:
    chunk_dyn_set_s("dyn_base_blue_tele_type", "terminal")
    chunk_dyn_set_i("dyn_base_blue_tele_pos_x", 15)
    chunk_dyn_set_i("dyn_base_blue_tele_pos_y", 0)
    chunk_dyn_set_i("dyn_base_blue_tele_pos_z", 15)
    
    set_default_block("XAR_PINK_SOURCE_INVISIBLE")
    add_bent(15,0,15,"bent_base_ring_pink_dest")
    add_bent(1,14,1,"bent_base_ring_green_danger")
    set_pos(1,14,1,"block_rm_treasure")
    create_rect("XAR_ANTI_PLUG_GLASS", 14,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING", 0,14,0, 1,15,0)
    create_rect("XAR_SOLID_BORING", 0,14,1, 0,15,1)
    set_pos(1,15,1, "XAR_SOLID_BORING")
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 14,1,15, 15,15,15)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 2,15,1, 13,15,1)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 0,14,2, 0,15,15)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 0,0,0, 15,13,0)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 0,0,1, 0,13,15)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 1,15,2, 13,15,15)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 2,14,0, 15,15,0)
    create_rect("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER", 14,0,1, 15,15,14)
    --[[
    Ai generated part begins here
    ]]--

    -- Track solid blocks
    local solid_blocks = {}

    -- Replace your set_pos call during maze creation
    local function mark_block(x, y, z)
        --was here before
        ---set_pos(x, y, z, "block_s")
        solid_blocks[x .. "_" .. y .. "_" .. z] = true
    end

    -- Maze generation (modified)
    maze_start()
    for z = 1, 15, 2 do
        for x = 1, 13, 2 do
            for y = 0, 14, 2 do
                maze_add_vertex(x, y, z)
                mark_block(x, y, z)
            end
        end
    end
    for z = 1, 15, 2 do
        for x = 1, 13, 2 do
            for y = 0, 14, 2 do
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

    for z = 1, 15, 2 do
        for x = 1, 13, 2 do
            for y = 0, 14, 2 do
                if (x + 2 <= 13 and maze_edge_open(x, y, z, x + 2, y, z)) then
                    mark_block(x + 1, y, z)
                end
                if (y + 2 <= 14 and maze_edge_open(x, y, z, x, y + 2, z)) then
                    mark_block(x, y + 1, z)
                end
                if (z + 2 <= 15 and maze_edge_open(x, y, z, x, y, z + 2)) then
                    mark_block(x, y, z + 1)
                end
            end
        end
    end

    -- ==== FILL REMAINING WITH GRADIENT RINGS ====
    for z = 1, 15 do
        for x = 1, 13 do
            for y = 0, 14 do
                local key = x .. "_" .. y .. "_" .. z
                if not solid_blocks[key] then
                    --Added possibility of a blue ring
                    if(randf() < 0.1) then 
                        add_bent(x, y, z, "bent_base_ring_blue")
                    else
                        -- Compute gradient
                        local dx = (x - 1) / (13 - 1)
                        local dy = (14 - y) / (14 - 0)
                        local dz = (z - 1) / (15 - 1)
                        local gradient = (dx + dy + dz) / 3
                        --i replaced "math.random() with randf"
                        local noise = (randf() - 0.5) * 0.2
                        local final_value = gradient + noise

                        if final_value >= 0.5 then
                            add_bent(x, y, z, "bent_base_ring_green")
                        else
                            add_bent(x, y, z, "bent_base_ring_red")
                        end
                    end
                end
            end
        end
    end

end
    