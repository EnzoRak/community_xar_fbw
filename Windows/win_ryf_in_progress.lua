
function p.__render(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 1.0)
    ga_win_set_front_color(wid, std.vec(1.0, 0.0, 1.0))
    ga_win_set_char_size(wid, 0.02, 0.04)
    ga_win_txt_center(wid, 0.5, "TELEPORTING...")
end