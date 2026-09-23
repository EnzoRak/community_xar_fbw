function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_x" end

function p.__main()
    local bt = get_input_path_bts()
    local dipth = 0
    for i=#bt-1,0,-1 do
        local b = bt[i].name
        if b == "block_stupid" then
            dipth = dipth + 1
        elseif b ~= "block_stupid_treasure" then
            break
        end
    end
    set_default_block("e")
    std.create_edges("XAR_SOLID_BORING_CONCRETE_YELLOW_X")
    create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 0,0,15, 15,15,15)
    create_rect("XAR_ONE_WAY_Z_NEG", 6,6,15, 9,9,15)
    cxar.add_txt(7,7,9,"stupid_treasure")
    local messages = {
        [4]="now you have to do that.\n4 more times.\nare you happy?",
        [3]="now you have to do that.\n3 more times.\nwhy are you doing this to yourself?",
        [2]="now you have to do that.\n2 more times.\nalmost there!",
        [1]="now you have to do that.\n1 more time.\nlast one. you can do it.",
        [0]="you made it, but at what cost?"
    }
    add_bent_s(7,7,7,"bent_base_txt","^xff0000worse.^!\n\n"..messages[5-dipth])
    add_bent(7,7,5, "bent_base_save")
    if dipth ~= 5 then
        create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_X", 15,6,0, 15,8,1)
        set_pos(15,7,0, "stupid")
        add_bent(14,7,0,"bent_base_ring_green")
    else
        add_bent_s(7,7,1,"bent_evaluator",
        [[
            for i = 1, 2500 do
                game_upgrades.spice()
                game_upgrades.health_max()
                game_upgrades.health_regen()
                game_upgrades.armor_regen()
                game_upgrades.plasma_regen()
            end
            game_msg.add("i'm sorry -wk")
            game_bent.remove_perm(level, bp)
        ]])
        add_bent(14,14,14,"bent_base_ring_pink_source")
    end
end