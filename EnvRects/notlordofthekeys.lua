function p.__on_touch()
    local min_val = math.min(
        ga_get_f("xar.key_time.laser_genesis"),
        ga_get_f("xar.key_time.blue"),
        ga_get_f("xar.key_time.yellow"),
        ga_get_f("xar.key_time.universe"),
        ga_get_f("xar.key_time.dans_house"),
        ga_get_f("xar.key_time.green")
    )
    if min_val > 0 and ga_get_s("xar.key_time.green_combo") == "wig_flower_stem_1" then
        return
    end
    ga_kill_player()
end
