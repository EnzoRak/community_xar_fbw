function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("grow_air")
    add_bent_s(7,7,7,"bent_base_txt","^xFF00FFThe Trials^!\n\nThis is a procedurally generated trial with many variations.\nEvery time you complete the trial the \"Tier\" goes up.\nThe tier is shown inside the trial.\n\nThe trial is locked for an hour every time you complete it.")
    add_bent(7,7,4, "bent_base_ring_green")
    add_bent_s(7,7,9,"bent_base_waypoint","The Trials")
    set_pos(7,7,5, "trial")
    create_rect("XAR_ANTI_PLUG_GLASS_HINT", 15,0,0, 15,15,15) -- for saftey
end