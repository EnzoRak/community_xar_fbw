function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER")
    create_rect("XAR_SOLID_BORING_DECO_1_YELLOW_1", 13,0,14, 13,0,15)
    create_rect("XAR_SOLID_BORING_DECO_1_YELLOW_1", 14,0,15, 15,0,15)
    create_rect("XAR_SOLID_BORING_DECO_1_YELLOW_1", 13,0,13, 15,0,13)
    set_pos(15,0,14, "XAR_SOLID_BORING_DECO_1_YELLOW_1")
    set_pos(14,0,14, "XAR_ANTI_PLUG_GLASS")
    set_pos(14,1,14, "XAR_ASCEND_SIMPLE")
    set_pos(14,2,14, "XAR_EMPTY_BORING")
    add_bent(14,2,14,"bent_base_ring_green")

    set_pos(14,3,14, "block_community_challenges_intro")        -- all challenges intro
    
    set_pos(13,3,14, "block_pk_challenge_1")       --my challenge intro + waypoint
    set_pos(12,3,14, "block_pk_challenge_guards")       --key guards room
    set_pos(11,3,14, "block_pk_thehardest")       --part 2 (forests, tree blocks in the shape of a "regular ying tree", glass seperator, pink sphere, pink key bent)
    set_pos(10,3,14, "block_pinkkeyroom")        --pink key (waypoint here)
    
    set_pos(14,4,14, "XAR_EMPTY_BORING")       --hallway seperator
    set_pos(14,5,14, "XAR_EMPTY_BORING")       --another hallway seperator
    set_pos(13,5,14, "block_rm_intro")       --rings maze challenge intro (what should the treasure be?)
    set_pos(12,5,14, "block_rm_challenge")       --rings maze 
    add_bent(13,5,14,"bent_base_ring_green")    --prevent softlock from grow rings(ring maze)
    
    set_pos(14,6,14, "XAR_EMPTY_BORING")      --wdythink
    set_pos(14,7,14, "XAR_EMPTY_BORING")
    set_pos(13,7,14, "XAR_EMPTY_BORING")       --pool challenge intro
    set_pos(12,7,14, "XAR_EMPTY_BORING")       --balls megachunk

    --[=====[    add your own challenge?
    set_pos(14,8,14, "XAR_EMPTY_BORING")
    set_pos(14,9,14, "XAR_EMPTY_BORING")
    set_pos(13,9,14, "XAR_EMPTY_BORING")
    --]=====]

end
