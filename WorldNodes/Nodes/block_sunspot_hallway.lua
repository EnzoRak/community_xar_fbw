function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    --curve health, because its kinda goofy.
    local function ch(uncurved_health)
        local power = 0.75
        local curved = math.floor( uncurved_health ^ power )
        if( curved < 1 ) then curved = 1 end
        ment_set_i("health_max_curved",curved)
        ment_set_i("health_curved",curved)
        ment_set_i("health", math.floor( uncurved_health ))
    end
    set_default_block("XAR_MOSSY_AIR_ASCEND_RECURSIVE_TOP")
    local randomvalue = randf()
    if(randomvalue < 0.41) then
        ment_start(7,7,7,"ment_chewing_gum")
        ment_set_b("emp_immune", true)
        ment_set_b("freeze_immune", true)
        ment_set_s("identity_str","I am Chewing Gum (IMMUNE)")
        ment_end()
    elseif(randomvalue < 0.52) then
        ment_start(7,7,7,"ment_monster_lamprey_yellow")
        --you shallnt pass
        ment_set_f("__radius",12.0)
        ment_set_s("identity_str","Big Yellow Lamprey")
        ment_end()
    elseif(randomvalue<0.62) then
        --dont accidently kill it
        ment_start(7,7,7,"ment_monster_wolf")
        ment_set_f("__radius",1.0)
        ment_set_s("identity_str","Baby Infinity Wolf")
        ch(500000)
        ment_set_b("emp_immune", true)
        ment_set_b("freeze_immune", true)
        ment_end()
    elseif(randomvalue<0.64) then
        --litterally a brick wall
        ment_start(7,7,7,"ment_monster_blood_boy_greater")
        ment_set_f("__radius",14.0)
        ment_set_s("identity_str","Big Greater Blood Boy")
        --too much?
        --ch(2147483647)
        --ment_set_s("identity_str","Big Greater Blood Boy (BUFFED)")
        ment_end()
    elseif(randomvalue<0.76) then
        local count = 1
        --idk man
        local accumulatordeterminant = randf()
        while(accumulatordeterminant < 0.6) do
            count = count + 1
            accumulatordeterminant = randf()
        end
        for i = 1, count do
            ment_start(randi(0,15),randi(0,15),randi(0,15),"ment_monster_clockwork_watchman")
            ch(20000)
            ment_set_i("shoot_proj_damage", 800)
            ment_set_f("__radius",2.0)
            ment_set_s("identity_str","Small Clockwork Watchman")
            ment_end()
        end
    elseif(randomvalue<0.84) then
        local count = 1
        --idk man
        local accumulatordeterminant = randf()
        while(accumulatordeterminant < 0.9) do
            count = count + 1
            accumulatordeterminant = randf()
        end
        for i = 1, count do
            ment_start(randi(0,15),randi(0,15),randi(0,15),"ment_monster_rat_bilge_minor")
            ment_set_f("__homing_speed",20.0)
            ment_set_f("__radius",0.5)
            ment_set_s("identity_str","Small Fast Minor Bilge Rat")
            ch(2000)
            ment_end()
        end
    else
        --nothing :>
    end
end

