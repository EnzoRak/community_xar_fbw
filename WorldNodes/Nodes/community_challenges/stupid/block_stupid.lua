function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    local bt = get_input_path_bts()
    local dipth = 0
    for i=#bt-1,0,-1 do
        local b = bt[i].name
        if b == "block_stupid" then
            dipth = dipth + 1
        elseif b ~= "block_stupid_treasure" then
            break
        end
    end
    if dipth == 0 then
        add_bent(15,15,15,"bent_base_ring_pink_dest")
    end
    set_default_block("e")
    create_rect("XAR_ANTI_PLUG_GLASS", 0,0,0, 14,15,15)
    create_rect("e", 7,7,13, 7,7,15)
    --create_rect("e", 7,7,0, 7,7,2)
    --cxar.add_txt(7,7,7,"stupid")
    add_bent_s(7,7,7,"bent_base_txt","THISI S THE ^xff0000S^xffff00T^x00ff00U^x00ffffP^x0000ffI^xff00ffD^! CHALLENGE BY ^xffffffWK^!!!!!\n\nthe goal is to get from the shrink ring to the yellow block\ncome on, it can't be that bad, can it? ^x0f0000OH GOD NO.^!")
    set_pos(7,7,0,"stupid_treasure")
    set_pos(7,7,15,"stupid_enter")
    add_bent(7,7,15,"bent_base_ring_green")
    create_rect("stupid_cheese", 15,0,0, 15,15,15)

    maze_start()
    for x = 1,13,2 do
        for y = 1,13,2 do
            for z = 1,13,2 do
                maze_add_vertex(x,y,z)
                set_pos(x,y,z,"e")
            end
        end
    end
    for x = 1,13,2 do
        for y = 1,13,2 do
            for z = 1,13,2 do
                if (x+2 <= 13) then
                    maze_add_edge(x,y,z, x+2,y,z)
                end
                if (y+2 <= 13) then
                    maze_add_edge(x,y,z, x,y+2,z)
                end
                if (z+2 <= 13) then
                    maze_add_edge(x,y,z, x,y,z+2)
                end
            end
        end
    end
    maze_end()
    for x = 1,13,2 do
        for y = 1,13,2 do
            for z = 1,13,2 do
                if (x+2 <= 13) then
                    if maze_edge_open(x,y,z, x+2,y,z) then
                    set_pos(x+1,y,z,"e")
                    end
                end
                if (y+2 <= 13) then
                    if maze_edge_open(x,y,z, x,y+2,z) then
                    set_pos(x,y+1,z,"e")
                    end
                end
                if (z+2 <= 13) then
                    if maze_edge_open(x,y,z, x,y,z+2) then
                    set_pos(x,y,z+1,"e")
                    end
                end
            end
        end
    end
end