function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("infinity_database_air_inner")
    base_blue_tele.set_blue_type_down(randi(0,15),randi(0,15),randi(0,15))
end
