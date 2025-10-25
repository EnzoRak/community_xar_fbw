function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_x" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    std.create_edges("XAR_SOLID_BORING_CONCRETE_YELLOW_X")
    local upgrades = {
        "bent_upgrade_gun_1_ammo_regen",
        "bent_upgrade_gun_1_ammo_regen",
        "bent_upgrade_gun_1_ammo_regen",
        "bent_upgrade_gun_1_ammo_regen",
        "bent_upgrade_gun_1_ammo_regen",
        "bent_upgrade_gun_1_ammo_regen",
        "bent_upgrade_gun_9_damage",
        "bent_upgrade_gun_9_damage",
        "bent_upgrade_gun_9_radius",
        "bent_upgrade_gun_9_radius",
        "bent_upgrade_gun_9_radius",
        "bent_upgrade_gun_7_damage",
        "bent_upgrade_gun_7_fire_speed",
        "bent_upgrade_gun_7_fire_speed",
        "bent_upgrade_gun_7_fire_speed",
        "bent_upgrade_gun_8_radius",
        "bent_upgrade_gun_8_radius",
        "bent_upgrade_gun_8_radius",
        "bent_upgrade_gun_8_radius",
        "bent_upgrade_gun_8_radius",
        "bent_upgrade_gun_8_time",
        "bent_upgrade_gun_8_time",
        "bent_upgrade_gun_8_time",
        "bent_upgrade_gun_8_time",
        "bent_upgrade_gun_8_time",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_cap",
        "bent_upgrade_health_regen",
        "bent_upgrade_health_regen",
        "bent_upgrade_health_regen",
        "bent_upgrade_health_regen",
        "bent_upgrade_health_regen",
        "bent_gold_once_1000",
    }
    for j = 1, #upgrades do
        local i = j-1
        local upg = upgrades[j]
        local x = 2*(i%6+1)
        local y = 2*(math.floor(i/6)%6+1)
        local z = 2*(math.floor(i/36)+1)
        add_bent(x,z,y,upg)
    end
    add_bent(13,13,13,"bent_base_ring_pink_source")
end
