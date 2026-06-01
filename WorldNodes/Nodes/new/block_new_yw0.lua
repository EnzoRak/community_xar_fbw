function p.__get_bt_to_copy() return "XAR_YW_0" end

function p.__main()
    create_xar_chunk("XAR_YW_0")
    if randi(1,200) == 1 then
        create_rect("XAR_YW_SMALL_ISLAND_AIR",1,1,1,14,14,14)
        set_pos(7,7,7,"ywkey_entrance")
    end
end