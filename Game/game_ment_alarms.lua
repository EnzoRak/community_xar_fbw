--Could make this faster, of course.
function p.monster(inst_id, alarm_name, params)
    if( alarm_name == "shoot_next" ) then
        game_ment_shoot.shoot_maybe(inst_id, false, params)
        return
    end

    if( alarm_name == "secondary_shoot_next" ) then
        game_ment_shoot_secondary.shoot_maybe(inst_id, false)
        return
    end

    if( alarm_name == "damage_aura_next" ) then
        game_ment_auras.damage_aura_payload_maybe(inst_id, false)
        return
    end

    if( alarm_name == "picture_aura_next" ) then
        game_ment_auras.picture_aura_payload_maybe(inst_id, false)
        return
    end

    if( alarm_name == "emp_stun_end" ) then
        game_ment_emp.emp_stun_end_maybe(inst_id)
        return
    end

    if( alarm_name == "freeze_end" ) then
        game_ment_freeze.freeze_end_maybe(inst_id)
        return
    end

    if( alarm_name == "poison" ) then
        game_ment_poison.poison_hit(inst_id)
        return
    end

    if( alarm_name == "death_anim" ) then
        game_ment_death_anim.alarm(inst_id)
        return
    end

    --more (can add more when I create more)!!!
end

function p.monster_proj(inst_id, alarm_name)
    if( alarm_name == "emp_stun_end" ) then
        game_ment_emp.emp_stun_end_maybe(inst_id)
        return
    end

    if( alarm_name == "freeze_end" ) then
        game_ment_freeze.freeze_end_maybe(inst_id)
        return
    end

    --more (can add more when I create more)!!!
end
