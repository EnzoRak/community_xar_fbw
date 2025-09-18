function p.__get_mesh() return "" end

function p.payload(level, bp)
    local center = std.block_center(bp)
    
    ga_srand(ga_block_seed_pos(level,bp))
    if(ga_randf()<0.5) then
        ga_bent_remove_perm(level, bp)
        ga_bent_add(level,bp,"bent_base_ring_red",3600)
        ga_grow2(center)
        ga_play_sound("grow")
    else
        ga_bent_remove_perm(level, bp)
        ga_bent_add(level,bp,"bent_base_ring_green",3600)
        ga_shrink2(center)
        ga_play_sound("shrink")
    end
end

function p.__on_touch(level, bp)
    local dist = ga_block_dist_to_viewer(level, bp)
    --this is actually terrible if imma be honest right now. 
    if (dist > 0.4) then return end
    
    p.payload(level, bp)
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Grow/Shrink ???"
end

function p.__on_use(level, bp)
    p.payload(level, bp)
end

function p.__render(level, bp)
    --im litterallly too lazy to actually make it yellow...
    --somebody else can do this :)
    local cur_time = ga_get_game_time()
    local speed_mod = 1.0
    local angle1 = cur_time * 50.0 * speed_mod
    local axis1 = std.vec(1.0, 0.0, 0.0)
    local angle2 = cur_time * 70.0 * speed_mod
    local axis2 = std.vec(0.0, 1.0, 0.0)
    local angle3 = cur_time * 90.0 * speed_mod
    local axis3 = std.vec(1.0, 0.0, 0.0)
    if(math.floor(cur_time*2) % 2 == 0) then
        ga_render_matrix_rotated(angle1, axis1)
        ga_render_mesh("ring_shrink_large")
        ga_render_matrix_rotated(angle2, axis2)
        ga_render_mesh("ring_shrink_med")
        ga_render_matrix_rotated(angle3, axis3)
        ga_render_mesh("bent_base_skull_cube_green")
    else
        ga_render_matrix_rotated(angle1, axis1)
        ga_render_mesh("ring_grow_large")
        ga_render_matrix_rotated(angle2, axis2)
        ga_render_mesh("ring_grow_med")
        ga_render_matrix_rotated(angle3, axis3)
        ga_render_mesh("bent_base_skull_cube_red")
    end
end
