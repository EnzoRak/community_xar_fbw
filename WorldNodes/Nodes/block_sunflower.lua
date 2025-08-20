function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()

    set_default_block("XAR_EMPTY_BORING")
    local sundirection = get_input_path_block_i(get_level(), "sundirection")
    if (sundirection ~= -1) then
        create_rect("XAR_YING_TREE_INNER", 7, 7, 0, 7, 7, 5)
        -- helper function to set_pos either normally or flipped
        local function directedset_pos(x, y, z, block)
            if sundirection == 0 or sundirection == 1 then
                set_pos(y, x, z, block)
            else
                set_pos(x, y, z, block)
            end
        end
        local function directedcreate_rect(x1, y1, z1, x2, y2, z2, block)
            if sundirection == 0 or sundirection == 1 then
                create_rect(block, y1, x1, z1, y2, x2, z2)
            else
                create_rect(block, x1, y1, z1, x2, y2, z2)
            end
        end
        local offset = (sundirection % 2 == 1) and 6 or 8
        -- now just use the unified functions
        directedset_pos(7, offset, 5, "block_sunflower_seedhead")
        directedcreate_rect(7, offset, 3, 7, offset, 4, "block_sunflower_maze")
        directedcreate_rect(7, offset, 6, 8, offset, 6, "block_sunflower_maze")
        directedset_pos(9, offset, 5, "block_sunflower_maze")
        directedset_pos(7, offset, 7, "block_sunflower_maze")
        directedset_pos(5, offset, 5, "block_sunflower_maze")
        directedcreate_rect(6, offset, 4, 6, offset, 6, "block_sunflower_maze")
        directedcreate_rect(8, offset, 4, 8, offset, 5, "block_sunflower_maze")
        --sunfloor (idk man)
        for x = 0, 15, 2 do
            for y = 0, 15, 2 do
                set_pos(x,y,0,"block_sunflower")
                block_set_i(x,y,0, "sundirection", sundirection)
            end
        end
        add_bent_s(7,7,9,"bent_base_txt","This is a ^xFFFF00Sunflower^!. You can shrink and enter by going through 2 8x8x8 mazes, with some maps of the mazes inside, or by going throught the seedy tunnels in the face of the flower seed part. Obviously that second option has more difficult enemies.")
        add_bent(5, 7, 1, "bent_base_ring_green")
        add_bent(7, 5, 1, "bent_base_ring_green")
        add_bent(7, 9, 1, "bent_base_ring_green")
        add_bent(9, 7, 1, "bent_base_ring_green")
    else
        --Wilted Flower?
        create_xar_chunk("XAR_SMALL_YELLOW_FLOWER")
        add_bent_s(8,8,10,"bent_base_txt","A ^xFFFF00Sunflower^! should have shown up here, but it wilted instead, and turned into just a regular ol' Small Yellow Flower.\n Maybe try to find a place closer to a ^xFFFF00Sun^!?\n\nHint: My Sunflowers can only face to the side, never up or down or diagonally.")
    end
    --var doesn't exist sometimes?
    --add_bent_s(15,15,15,"bent_base_txt","" .. get_input_path_block_i(get_level(),"sundirection"))
end

function p.__type_init(id)
    ia_block_new_var_i(id, "sundirection", -1)
end
