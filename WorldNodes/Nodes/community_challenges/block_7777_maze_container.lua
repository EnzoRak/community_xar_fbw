function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    add_bent_s(7,7,7,"bent_base_txt","^xFF00FFThe 7x7x7x7 Hypermaze.^!\n\nThe way I am designing this should make this the hardest maze in the game.")
    --currently, always assuming the maze for the next layer is 7,7,5
    set_pos(7,7,5,"block_7777_maze")
    add_bent(15,15,15,"bent_base_ring_pink_dest")
    local g = std_4dmaze.generate_rect_maze_4d(7,7,7,7)
    chunk_set_s("maze_encoded", g)
    --add_bent_s(2,2,2,"bent_base_txt",g)

    
    set_pos(6,7,4,"XAR_ANTI_PLUG_GLASS")
    set_pos(6,7,6,"XAR_ANTI_PLUG_GLASS")
    set_pos(6,8,5,"XAR_ANTI_PLUG_GLASS")
    set_pos(6,6,5,"XAR_ANTI_PLUG_GLASS")
    set_pos(5,7,5,"XAR_ANTI_PLUG_GLASS")
    set_pos(6,7,5,"XAR_PINK_SOURCE_INVISIBLE")
    add_bent(6,7,5,"bent_base_ring_green")
end


function p.__type_init(id)
    --String with length (2x-1)(2y-1)(2z-1)w
    ia_block_new_var_s(id, "maze_encoded", "")
    --idk man
    ia_block_new_var_i(id,"room_w_depth", -1)
end
