function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    local level = get_level()
    local tier = get_input_path_block_i(level-1, "tier")
    srand(tier)
    set_default_block("grow_air")
    std.create_edges("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER")
    set_pos(5,7,7, "gold")
    block_set_i(5,7,7, "amount", math.floor(300*(tier+1)^1.55))
    local upgrades = {
        {"bent_upgrade_health_cap|health_max", math.floor(25*(tier+1)^1.3)},
        {"bent_upgrade_health_regen|health_regen", math.floor(25*(tier+1)^1.3)},
        {"bent_upgrade_gun_3_damage|laser_damage", math.floor(10*(tier+1)^1.25)},
        {"bent_upgrade_gun_3_ammo_cap|laser_max_ammo", math.floor((tier+1)^0.9)},
        {"bent_upgrade_gun_6_damage|minigun_damage", math.floor(8*(tier+1)^1.25)},
        {"bent_upgrade_gun_6_ammo_cap|minigun_max_ammo", math.floor((tier+1)^0.9)},
    }
    for i = 1, math.min(math.floor(tier^0.65+2), 9) do
        if #upgrades <= 0 then break end
        local idx = randi(1, #upgrades)
        local upgrade = table.remove(upgrades, idx)
        add_bent_i(6+i,7,7, "bent_upgrade_pack", upgrade[2])
        bent_set_param_s(6+i,7,7, upgrade[1])
    end
    add_bent(5,6,7, "bent_base_ring_green")
    set_pos(7,7,15, "trial_done")
end