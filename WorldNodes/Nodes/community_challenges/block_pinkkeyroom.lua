function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    add_bent(7,7,7,"bent_key_pink")
    add_bent_s(7,7,9,"bent_base_txt","^xFF00FFYou can use the Pink Key to bypass the death rooms in the Pink Flowers that I have added to the floor of:\nQuicksand Grass 11, Fanatic Weeds, and Dandelions.\n\nThere is no timer on this key.^!")
    add_bent_s(7,7,5,"bent_base_waypoint","Pink Key")
    add_bent_s(7,7,11,"bent_cxar_trophy","pink_key")
end
