function p.__get_is_solid() return true end
function p.__get_tex() return "block_default" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_rect("grp_air", 1,1,1, 14,14,14) -- have to do this because icarus
    --create_rect("grp_air", 0,1,1, 15,14,14)
    --create_rect("grp_air", 1,0,1, 14,15,14)
    --create_rect("grp_air", 1,1,0, 14,14,15)
    set_pos(14,14,14, "XAR_SOLID_BORING_EXPANDER")
    set_pos(13,14,14, "simple_grow")
    set_pos(14,13,14, "simple_grow")
    add_bent(14,14,13, "bent_base_ring_green")
    add_bent_s(13,13,7, "bent_base_waypoint", "Community Xar debug room! :D")
    add_bent(13,13,9, "bent_base_ring_blue")
    add_bent_s(13,13,11, "bent_base_txt", "This blue ring will take you to Mylantis!")
    add_bent(13,13,5, "bent_base_ring_pink_dest")
    add_bent(13,13,3, "bent_base_save")
    add_bent(13,11,11, "bent_sleep_hour")

    add_bent(1,14,13, "bent_debug_spawn_block")

    -- Put your new blocks here!
    --can we have a ledge kinda thing just like the xar debug room, these invisible blocks dont have floors. 
    -- i did the thing
    local blocks = {
        --"community_debug",
        "galaxy_blackhole",
        "gl_cube",
        "dirty_air_case",
        "pink_flower",
        "alphabet_flower",
        "sunflower",
        "ywkey_entrance",
        "sun_microsystem",
        "twoworld_container",
        "truecenter",
        "dreamworld",
        "sadlands",
        "mcl12_containment_base",
        "infinity_database_container",
        {"infx_enter",val=4},

        "test_time"
    }
    
    for j = 1, #blocks do
        local i = j-1
        local block = blocks[j]
        local x = i%14+1
        local y = 1--(math.floor(i/6)%6+1)
        local z = 2*(i//14+1)
        if type(block) == "table" then
            set_pos(x,y,z,block[1])
            for i,v in pairs(block) do
                if i ~= 1 then
                    block_set_i(x,y,z, i, v)
                end
            end
        else
            set_pos(x,y,z,block)
        end
        if x == 1 then
            create_rect("XAR_SOLID_BORING",1,y,z-1,14,y,z-1)
        end
        --bug fix. Apparently, the sunflower's call to create_xar_chunk("XAR_SMALL_YELLOW_FLOWER") requires there to be a block underneath, in this specific case, for chunk generation. Litterally have no idea why this is the case now. Damn Daniel. An interesting note, the small yellow flower no longer generates the blocks structure, but still generates the air when this happens. However, since the floor has to be a XAR block, I decided XAR_SOLID_BORING was good enough.   
        --set_pos(x,y,z-1,"XAR_SOLID_BORING")
    end
end
