function p.__get_is_solid() return true end
function p.__get_tex() return "block_pink" end

function p.__main()
    --very cool ai generated fill section
    local function fill_text(str, x1, y1, z1, x2, y2, z2)
        local min_x = math.min(x1, x2)
        local max_x = math.max(x1, x2)
        local min_y = math.min(y1, y2)
        local max_y = math.max(y1, y2)
        local min_z = math.min(z1, z2)
        local max_z = math.max(z1, z2)
        
        -- Parse the string into a table of block types
        local blocks = {}
        local i = 1
        while i <= #str do
            local char = str:sub(i, i)
            if char == "{" then
                -- Extract custom block type within curly braces
                local end_pos = str:find("}", i)
                if not end_pos then
                    --uh oh
                    return
                end
                local custom_block = str:sub(i + 1, end_pos - 1)
                if custom_block == "" then
                    --other stuff might happen here though, it could also be invalid but uhh
                    return
                end
                table.insert(blocks, custom_block)
                i = end_pos + 1
            elseif char == " " then
                table.insert(blocks, "XAR_SOLID_BORING")
                i = i + 1
            elseif char:match("%a") then
                table.insert(blocks, "XAR_SOLID_BORING_LETTER_" .. char:upper())
                i = i + 1
            elseif char:match("%d") then
                table.insert(blocks, "XAR_SOLID_BORING_NUM_" .. char)
                i = i + 1
            else
                --chat we might be cooked
                return
            end
        end
        
        local len = #blocks
        if len == 0 then return end  -- Avoid empty block list
        
        for x = min_x, max_x do
            for y = min_y, max_y do
                for z = min_z, max_z do
                    local d = math.abs(x - x1) + math.abs(y - y1) + math.abs(z - z1)
                    local idx = (d % len) + 1
                    set_pos(x, y, z, blocks[idx])
                end
            end
        end
    end

    set_default_block("XAR_SOLID_BORING_PINK")
    create_rect("XAR_EMPTY_BORING", 1,1,0,14,14,14)
    create_rect("XAR_EMPTY_BORING", 1,1,15,3,3,15)
    create_rect("XAR_EMPTY_BORING", 0,1,12,0,3,14)
    create_rect("XAR_EMPTY_BORING", 1,0,12,3,0,14)
    create_rect("XAR_SOLID_BORING_PINK", 1,1,6,14,14,6)
    --backwards bepis
    fill_text("SI{XAR_SOLID_BORING_PINK}EB ", 14,1,0, 1,14,0)
    fill_text("DANIEL HATHAWAY ", 8,8,14, 8,1,1)
    --feel free to add yourself to the floor (we dont have that much room left, might need to think of a better solution later, probably a custom block that changes depending on the current level)
    fill_text("ezno wk me ", 2,13,6, 13,2,6)
    --assuming after beating that challenge, even if you found THIS SECRET, you already have easy access to bedroom, black market. The only slightly unbalanced thing is the Max Ammo Upgrade station, but oh well.
    set_pos(12,3,6,"XAR_RAINBOW_FLOWER_DEBUG_4")    
    --check for pink key
    add_env_rect( 9,1,1, 14,14,14, "ascension_check")
    --just in case
    add_env_rect( 1,1,1, 8,14,5, "ascension_check")
    add_bent_s(4,4,12,"bent_base_txt","This is the not-so-uncommon ^xFF00FFPink Flower^!\nThere is an invisible death barrier around the corner that will kill you instantly if you don't have the Pink Key. \n^x00FF00Hint: Check out my challenge at the top of the space gauntlet^!")
    add_bent(4,4,3,"bent_base_ring_green")
    if(get_input_path_length()-2 < 0) then
        add_bent_s(4,6,3,"bent_base_waypoint","Pink Flower (Useless)")
    else
        local typeoftheparentparentchunk = get_input_path_bt(get_input_path_length()-2)
        add_bent_s(4,6,3,"bent_base_waypoint","Pink Flower in " .. typeoftheparentparentchunk)
    end
    add_bent_s(4,6,5,"bent_cxar_trophy","pink_flower")
    --making it look all fancy
    set_pos(6,2,1,"XAR_ASCEND_SIMPLE")
    set_pos(5,2,0,"XAR_BLUE")
    set_pos(6,3,0,"XAR_BLUE")
    set_pos(6,1,0,"XAR_PINK_SOURCE")
    set_pos(7,2,0,"XAR_PINK_SOURCE")
end



