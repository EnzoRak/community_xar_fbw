function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Recharge Dark Holes for 200 gold"
end

function p.__on_use(level, bp)
    ga_play_sound_menu("use")
    ga_create_i("temp.xar.ent.buy_dark_hole.price")
    ga_set_i("temp.xar.ent.buy_dark_hole.price", 200)
    ga_window_push("win_buy_dark_hole")
end
