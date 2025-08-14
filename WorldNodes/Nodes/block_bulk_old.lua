function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_BULK_STANDING_CUBES")
    ---add_bent_s(7,7,7,"bent_base_txt",get_input_path()[1])
    ---add_bent_s(7,7,7,"bent_base_txt",bent_get_param_s(15,15,15))
    add_bent_s(15,15,15,"bent_base_txt","Dan put a Pink Sphere here, breaking my ^xFF00FFPink Ring Challenge^!. I hope Dan removes it as part of the main game as well.\n\nSee, my reasoning is that no sane player would every use the Bulk as a Pink Active area. In all previous versions without the Pink Sphere, there was still no real reason to use the Bulk as a Pink Active area becaues you had to go through the Clay Planet every time, so there was no actual purpose to doing so, especially when Pink Active areas already intentionally placed Pink Rings that were much easier to get to.\n\nSo yeah, Dan pls remove ^xFF00FFthis^! pink sphere?")
end
