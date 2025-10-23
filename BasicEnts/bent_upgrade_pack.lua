function p.__get_mesh() return "bent_upgrade_pack" end

function p.get(level, bp)
    local func = ga_bent_get_param_s(level, bp):split("|")[2]
    if game_upgrades[func] then
        for i = 1, ga_bent_get_param_i(level, bp) do
            game_upgrades[func]()
        end
    end
    game_bent.remove_temp(level, bp, 3600)
end

function p.payload(level, bp)
    p.get(level, bp)
end

function p.__on_touch(level, bp)
    p.payload(level, bp)
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    local bent = ga_bent_get_param_s(level, bp):split("|")[1]
    local t = "UNKNOWN"
    if _G[bent] and _G[bent].__get_use_msg then
        t = _G[bent].__get_use_msg(level, bp)
    end
    return t .. " x" .. ga_bent_get_param_i(level, bp)
end

function p.__on_use(level, bp)
    p.payload(level, bp)
end