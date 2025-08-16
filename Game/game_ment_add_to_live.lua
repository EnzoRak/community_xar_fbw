function p.monster(inst_id)
    -- ga_print("game_ment_add_to_live.monster begin")

    if ga_ment_var_exists(inst_id, "identity_str") and win_fractalbase.map[ga_ment_get_static_s(ga_ment_get_type(inst_id), "identity_str")] then
        local discovered = ga_get_s("community_xar_fbw.fractalbase.enemies_discovered")
        local idx = win_fractalbase.map[ga_ment_get_static_s(ga_ment_get_type(inst_id), "identity_str")]
        if discovered:sub(idx,idx) == "0" then
            ga_set_s("community_xar_fbw.fractalbase.enemies_discovered", discovered:sub(1,idx-1) .. "1" .. discovered:sub(idx+1))
        end
    end

    --Ending emp stun (if needed),
    --and setting stun end alarm if needed.
    --It is important that this comes before
    --the shoot function.
    game_ment_emp.add_to_live(inst_id)

    --Ending freeze effect (if needed),
    --and setting freeze end alarm if needed.
    game_ment_freeze.add_to_live(inst_id)

    --Dealing with shooting (if needed).
    game_ment_shoot.shoot_maybe(inst_id, true)

    --Dealing with secondary shooting (if needed).
    game_ment_shoot_secondary.shoot_maybe(inst_id, true)    

    --Poison effect.
    game_ment_poison.add_to_live(inst_id)

    --Dealing with all auras.
    game_ment_auras.auras_payloads_maybe(inst_id, true)

    --more (can add more when I create more)!!!

    -- ga_print("game_ment_add_to_live.monster end")
end
