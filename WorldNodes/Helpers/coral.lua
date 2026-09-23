function p.fill(id)
    set_default_block("i3v2_coral_fill"..id)
    create_rect("i3v2_ocean", 7,7,0, 7,7,15)
    create_rect("XAR_STOPPER", 7,7,1, 7,7,14)
    create_rect("i3v2_coral_inner", 3,3,3, 12,12,12)
end