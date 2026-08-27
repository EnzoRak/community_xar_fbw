function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
    set_default_block("e")

    --Generating the chunk as if
    --it was of type XAR_SMALL_YELLOW_FLOWER.
    create_xar_chunk("XAR_SMALL_YELLOW_FLOWER")

    --Replacing the yellow block in the yellow flower
    --with a meme block.
    for x = 0,15 do
    for y = 0,15 do
    for z = 0,15 do
        if( get_pos(x,y,z) == "XAR_SMALL_YELLOW_FLOWER_ROOM" ) then
            set_pos(x,y,z, "block_meme_welcome_1")
        end
    end end end
end
