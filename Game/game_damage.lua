function p.calc_damage_from_player(raw_amount, allow_powerups, def)
    def = def or 0
    local amount = math.floor( raw_amount * 1.5 )
    if ga_get_b("xar.difficulty.easy_2") then
        amount = math.floor( raw_amount * 4.0 )
    end
    if ga_get_b("xar.difficulty.easy_1") then
        amount = math.floor( raw_amount * 2.0 )
    end
    if ga_get_b("xar.difficulty.hard_1") then
        amount = math.floor( raw_amount * 1.0 )
        -- amount = math.floor( raw_amount * 0.67 )
    end
    if ga_get_b("xar.difficulty.hard_2") then
        amount = math.floor( raw_amount * 0.67 )
        -- amount = math.floor( raw_amount * 0.5 )
    end
    if ga_get_b("xar.difficulty.hard_3") then
        amount = math.floor( raw_amount * 0.5 )
        -- amount = math.floor( raw_amount * 0.33 )
    end
    if ga_get_b("xar.difficulty.hard_4") then
        amount = math.floor( raw_amount * 0.33 )
        -- amount = math.floor( raw_amount * 0.25 )
    end
    if ga_get_b("xar.difficulty.custom") then
        local factor = ga_get_f("xar.difficulty.custom.dmg_from_player")
        amount = math.floor( raw_amount * factor )
    end

    if( allow_powerups ) then
        if( ga_get_f("xar.damage_5x_stacking_time") > 0.01 ) then
            amount = amount * 5
        end
    end

    amount = math.floor( amount ^ (1/(def/5+1)) )

    if amount < 1 then amount = 1 end
    return amount
end

function p.calc_damage_to_player(raw_amount)
    local amount = math.floor( raw_amount * 0.62 )
    -- local amount = raw_amount
    if ga_get_b("xar.difficulty.easy_2") then
        amount = math.floor( raw_amount * 0.25 )
    end
    if ga_get_b("xar.difficulty.easy_1") then
        amount = math.floor( raw_amount * 0.5 )
    end
    if ga_get_b("xar.difficulty.hard_1") then
        amount = math.floor( raw_amount * 0.75 )
    end
    if  ga_get_b("xar.difficulty.hard_2") then
        amount = math.floor( raw_amount * 1.0 )
    end
    if  ga_get_b("xar.difficulty.hard_3") then
        amount = math.floor( raw_amount * 1.25 )
    end
    if  ga_get_b("xar.difficulty.hard_4") then
        amount = math.floor( raw_amount * 1.5 )
    end
    if  ga_get_b("xar.difficulty.custom") then
        local factor = ga_get_f("xar.difficulty.custom.dmg_to_player")
        local amount = math.floor( raw_amount * factor )
    end
    
    return amount
end

--Returns whether or not the player is invulnerable.
function p.player_invun()
    if( ga_get_f("xar.invun_stacking_time") > 0.0 ) then return true end

    local move_mode = ga_get_sys_s("game.player.move.mode")
    if( move_mode == "spirit" ) then return true end

    return false
end

function p.damage_player(raw, amount)
    if( p.player_invun() ) then amount = 0.0 end

    if( ga_get_b("xar.difficulty.curve.enabled") ) then
        if( raw ) then
            --Dealing damage now (ignoring difficulty level).
            p.actually_damage_player(amount)
        else
            --Adding to the queue.
            local cur_total = ga_get_i("xar.difficulty.curve.player_in_damage.total")
            cur_total = cur_total + amount
            ga_set_i("xar.difficulty.curve.player_in_damage.total", cur_total)
        end
    else
        --Damaging the player now.
        if not raw then
            amount = p.calc_damage_to_player(amount)
        end
        p.actually_damage_player(amount)
    end
end

function p.clear_damage()
    ga_set_i("xar.difficulty.curve.player_in_damage.total", 0.0)
    ga_set_f("xar.difficulty.curve.player_in_damage.last_time", 0.0)
end

--Needed when there is difficulty curving
--because need to pump the player_in_damage tally.
--Note: none of the damage here is treated as raw.
function p.update()
    local game_time = ga_get_game_time()
    local last_update = ga_get_f("xar.difficulty.curve.player_in_damage.last_time")

    --For saftey.
    if( game_time > last_update + 10.0 or
        game_time < last_update - 10.0 )
    then
        ga_set_f("xar.difficulty.curve.player_in_damage.last_time", game_time)
    end

    if( game_time > last_update + 1.0 ) then
        local cur_total = ga_get_i("xar.difficulty.curve.player_in_damage.total")
        --
        ga_set_i("xar.difficulty.curve.player_in_damage.total", 0)
        ga_set_f("xar.difficulty.curve.player_in_damage.last_time", game_time)
        --
        local curved_damage = game_difficulty_curve.curve_enemy_damage(cur_total)
        local adjusted_damage = p.calc_damage_to_player(curved_damage)
        --
        p.actually_damage_player(adjusted_damage)
    end
end

--calc_damage_to_player should have already been called.
function p.actually_damage_player(amount)
    if( amount == 0 ) then return end --Safety.

    --Setting the system dps.
    local old_in_dps = ga_get_sys_i("stats.in_dps_count")
    ga_set_sys_i("stats.in_dps_count", old_in_dps + amount)

    --Cheat codes.
    if not ga_get_sys_b("game.player.alive") then return end
    if ga_get_sys_b("metagame.cheat.god") then return end

    --For the hurt sound.
    ga_set_i("xar.hurt_sound.damage",
        ga_get_i("xar.hurt_sound.damage") + amount)

    --Damage from shield.
    local shield_damage = amount
    local other_damage = 0
    local shield_before = ga_get_i("xar.player.shield.amount")
    if shield_before < shield_damage then
        local diff = shield_damage - shield_before
        shield_damage = shield_damage - diff
        other_damage = other_damage + diff
    end
    std.set_bydelta_i("xar.player.shield.amount", -shield_damage)
    if( other_damage == 0 ) then return end

    --Next, taking health from above 100% health.
    local health = ga_get_i("xar.player.health.amount")
    local health_max = ga_get_i("xar.player.health.max")
    local extra_health = health - health_max --The health above 100%.
    local other_other_damage = 0
    if extra_health < other_damage then
        local diff = other_damage - extra_health
        other_damage = other_damage - diff --Now other_damage is extra_health.
        other_other_damage = other_other_damage + diff
    end
    std.set_bydelta_i("xar.player.health.amount", -other_damage)
    if( other_other_damage == 0 ) then return end

    --Health and Armor.
    local health_damage_frac = 0.25
    local health_damage = math.floor( other_other_damage * health_damage_frac )
    local armor_damage = other_other_damage - health_damage

    --Damage from armor.
    if ga_get_i("xar.player.armor.amount") < armor_damage then
        local diff = armor_damage - ga_get_i("xar.player.armor.amount")
        armor_damage = armor_damage - diff    --Now armor damage is armor.
        health_damage = health_damage + diff
    end
    std.set_bydelta_i("xar.player.armor.amount", -armor_damage)

    --Damage from < 100% health.
    std.set_bydelta_i("xar.player.health.amount", -health_damage)    
end
