function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_brown_border" end

function p.__main()
    set_default_block("dirt_no_max")
    create_sprinkles(0,0,0,15,15,15,0.5,"dirty_air")
    create_sprinkles(0,0,0,15,15,15,0.001,"gl_cube")
    create_sprinkles(0,0,0,15,15,15,0.001,"XAR_MINI_AMMO_FOREST_STONEY")
    if randi(1,2) == 1 then
        local x = randi(0,15)
        local y = randi(0,15)
        local z = randi(0,15)
        add_bent(x,y,z, "bent_base_ring_green")
        set_pos(x,y,z, "dirty_air")
    end
    create_rect("XAR_EMPTY_BORING", 6,6,6, 8,8,8)
    add_bent(7,7,7, "bent_health_max")
end