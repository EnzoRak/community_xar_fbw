--time for gamer
function p.__on_touch()
    if ga_get_b("community_xar_fbw.pink_ascended") then
        return
    end
    ga_kill_player()
end
