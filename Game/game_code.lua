function p.code(correct,level,bp)
    if correct then
        for x=1,14 do
            for y = 1,14 do
                ga_block_change_rl(level, std.vec_add(bp,std.bp(x-7,y-7,-5)), "XAR_EMPTY_BORING", 3600)
            end
        end
        ga_play_sound_menu("toll_door")
    else
        ga_play_sound_menu("xar_error")
    end
end