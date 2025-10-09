function p.__get_is_solid() return true end
function p.__get_tex() return "block_info" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("XAR_ANTI_PLUG_GLASS",0,0,0,15,15,15)
    std.create_edges("XAR_SOLID_BORING_INFO")
    create_rect("XAR_EMPTY_BORING",1,1,1,14,14,14)
    add_bent_s(7,7,10,"bent_base_txt","This is the ^x00ff00Mylantis Cave Layer 12 Containment Base^!. We have tried to make it as similar to simulations of MCL12. Note that some places may be innacurate or ^xff00ffunstable^!. We tried our best to make a reward for escaping MCL12. This blue ring device will take you to the center of this sample of MCL12. You will be shrunk so that the sample will be 1 megachunk big. And yes, there are anti-plugs, we don't like cheesing...\n\n^xff0000BEWARE: There are a lot of rats that have evolved to fight off most creatures.^!")
    add_bent(7,7,9,"bent_base_ring_blue")
    base_blue_tele.set_blue_type_down(7,7,7)
    create_rect("grow_thing",6,7,7,8,7,7)
    create_rect("grow_thing",7,6,7,7,8,7)
    create_rect("grow_thing",7,7,6,7,7,8)
    set_pos(7,7,7,"mcl12_mega")
    set_pos(7,7,1,"mcl12_treasure")
end
