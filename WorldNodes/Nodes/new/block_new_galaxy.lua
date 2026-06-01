function p.__get_bt_to_copy() return "XAR_SPACE_GALAXY" end

function p.__main()
    create_xar_chunk("XAR_SPACE_GALAXY")
    --we should probably use dan's when its released
    if(get_pos(7,7,7) == "XAR_SOLID_BORING_DARK_CONCRETE_RED_BORDER") then
        set_pos(7,7,7, "galaxy_blackhole")
    end
end
