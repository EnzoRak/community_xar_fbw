function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    add_bent_s(7,7,7,"bent_base_txt","^xFF00FFThe 7x7x7x7 Hypermaze.^!\n\nThe way I am designing this should make this the hardest maze in the game.")
    --currently, always assuming the maze for the next layer is 7,7,5
    set_pos(7,7,5,"block_7777_maze")
    add_bent(15,15,15,"bent_base_ring_pink_dest")
    add_bent(7,7,3,"bent_base_ring_blue")
    --sayanara
    base_blue_tele.set_blue_type_down(7,7,5)
end
