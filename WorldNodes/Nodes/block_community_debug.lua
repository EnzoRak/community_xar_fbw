function p.__get_is_solid() return true end
function p.__get_tex() return "block_default" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_rect("grp_air", 0,1,1, 15,14,14)
    create_rect("grp_air", 1,0,1, 14,15,14)
    create_rect("grp_air", 1,1,0, 14,14,15)
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
    add_bent(2,12,2, "bent_health_max")

    -- Put your new blocks here!
    set_pos(2,2,2, "community_debug")
    set_pos(2,2,4, "galaxy_blackhole")
    set_pos(2,2,6, "gl_cube")
    set_pos(2,2,8, "dirty_air_case")
end
