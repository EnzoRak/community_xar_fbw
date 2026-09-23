function p.__get_is_solid() return true end
function p.__get_tex() return "block_i3_yellow" end

function p.__main()
    create_xar_chunk("XAR_GROUP_3_ABOVE_YELLOW")
    add_bent_s(7,7,10, "bent_base_txt", "This is an entrance to ^x00ff00I3^!, but not the usual one!")
end