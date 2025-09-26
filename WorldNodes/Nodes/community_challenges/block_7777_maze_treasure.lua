function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    --this would probably be a good place to add that bent that just gives everything. 
    for x = 2, 13, 1 do       
        for y = 2, 13, 1 do
            for z = 2, 13, 1 do
                add_bent(x,y,z,"bent_gold_1000")
            end
        end
    end
    add_bent_s(7,7,9,"bent_evaluator",
    [[
        for i = 1, 2000 do
            game_upgrades.spice()
            game_upgrades.health_max()
            game_upgrades.health_regen()
            game_upgrades.plasma_regen()
            game_upgrades.plasma_max_ammo()
            game_upgrades.plasma_damage()
            game_upgrades.plasma_fire_rate()
            game_upgrades.plasma_proj_speed()
            game_upgrades.cannon_max_ammo()
            game_upgrades.cannon_fire_rate()
            game_upgrades.cannon_damage()
            game_upgrades.cannon_proj_speed()
            game_upgrades.cannon_num()
            game_upgrades.laser_max_ammo()
            game_upgrades.laser_damage()
            game_upgrades.rocket_max_ammo()
            game_upgrades.rocket_damage()
            game_upgrades.rocket_fire_rate()
            game_upgrades.rocket_proj_speed()
            game_upgrades.rocket_radius()
            game_upgrades.homing_max_ammo()
            game_upgrades.homing_damage()
            game_upgrades.homing_fire_rate()
            game_upgrades.homing_proj_speed()
            game_upgrades.minigun_max_ammo()
            game_upgrades.minigun_damage()
            game_upgrades.minigun_fire_rate()
            game_upgrades.minigun_proj_speed()
            game_upgrades.railgun_max_ammo()
            game_upgrades.railgun_damage()
            game_upgrades.railgun_fire_rate()
            game_upgrades.emp_max_ammo()
            game_upgrades.emp_damage()
            game_upgrades.emp_radius()
            game_upgrades.emp_freeze_time()
            game_upgrades.nuke_max_ammo()
            game_upgrades.nuke_damage()
            game_upgrades.nuke_proj_speed()
            game_upgrades.nuke_radius()
            game_upgrades.dark_hole_max_ammo()
            game_upgrades.dark_hole_damage()
            game_upgrades.dark_hole_proj_speed()
        end

        for i = 1, 100 do
            game_upgrades.armor_regen()
            game_upgrades.laser_freeze_time()
            game_upgrades.laser_super()
            game_upgrades.minigun_super()
        end

        ga_play_sound("pickup_powerup")
        game_bent.remove_perm(level, bp)
    ]])
    add_bent_s(7,7,7,"bent_base_waypoint","1000000 (1 Million) Gold Room")
    add_bent_s(1,1,1,"bent_base_txt","^x00FF00Repeatedly press your telekinesis button to clear all the gold!^!")
    add_bent_s(12,12,12,"bent_base_txt","^xFFFFFFMessage from me: \n\n\"As above, so below.\"\nThanks for playing through this challenge, hope you enjoyed!^!")
    --https://en.wikipedia.org/wiki/Emerald_Tablet#Secret_of_Creation
    --minus 1000 negative aura.
    add_bent(8,15,8,"bent_pic_magician")
end
