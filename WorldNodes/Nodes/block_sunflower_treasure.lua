function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_yellow" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 1,0,0, 15,0,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 0,0,0, 0,15,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 1,15,15, 15,15,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 15,15,1, 15,15,14)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 0,0,1, 0,0,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 0,15,1, 0,15,14)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 15,1,0, 15,14,0)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 1,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 15,1,15, 15,14,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 0,1,15, 0,15,15)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 15,0,1, 15,0,14)
    create_rect("XAR_SOLID_BORING_CONCRETE_CHECKER_YELLOW", 1,15,0, 15,15,0)
    

    local pathHasClay = false
    local pathHasMinigun = false
    for i = get_level(), 1, -1 do
        local thecurrenttype = get_input_path_bt(i)
        if(thecurrenttype == "XAR_PLANET_CLAY") then
            pathHasClay = true
        end
        if(thecurrenttype == "XAR_SMALL_MINIGUN_PLANET") then
            pathHasMinigun = true
        end
    end
    if(pathHasClay and pathHasMinigun)  then
        add_bent(7,7,5,"bent_armor_1000p") 
        add_bent(5,5,5,"bent_gold_1000")
        add_bent(9,9,5,"bent_gold_1000")
        for i = 1, 13 , 2 do
            for j = 1, 13, 2 do
                if(i%4==1) then
                    if(j%4 ==1) then
                        add_bent(i,j,1,"bent_upgrade_gun_8_ammo_cap")
                    else
                        add_bent(i,j,1,"bent_upgrade_gun_7_fire_speed")
                        add_bent(i,j,3,"bent_upgrade_gun_7_fire_speed")
                    end
                else
                    if(j%4 ==1) then
                        add_bent(i,j,1,"bent_upgrade_gun_6_damage")
                    else
                        add_bent(i,j,1,"bent_upgrade_gun_9_proj_speed")
                        add_bent(i,j,3,"bent_upgrade_gun_9_proj_speed")
                    end
                end
            end
        end
        set_pos(7,7,13,"block_sunflower_ritual")
        add_bent_s(9,9,10,"bent_base_txt","^xFF00FFYou can leave by going through the stem of the flower, which is Ying Tree^!")
    else
        --default treasure
        add_bent(7,7,5,"bent_armor_200p") 
        add_bent(5,5,5,"bent_gold_100")
        add_bent(9,9,5,"bent_gold_100")
        add_bent(1,1,1,"bent_upgrade_gun_8_ammo_cap")
        add_bent(1,3,1,"bent_upgrade_gun_7_fire_speed")
        add_bent(3,1,1,"bent_upgrade_gun_7_fire_speed")
        add_bent(3,3,1,"bent_upgrade_gun_6_damage")
        add_bent(5,1,1,"bent_upgrade_gun_9_proj_speed")
        add_bent(1,5,1,"bent_upgrade_gun_9_proj_speed")
        add_bent_s(9,9,10,"bent_base_txt","Now there would be better treasure here if you are inside of a Clay Planet and Small Minigun Planet at the same time. \nThis 'better treasure' lets you fight a boss and unlock a new area.\n\nYou can leave by going through the stem of the flower, which is Ying Tree")
    end
end
