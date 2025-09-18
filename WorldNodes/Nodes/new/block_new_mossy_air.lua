function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
    create_xar_chunk("XAR_MOSSY_AIR")
end


function p.__type_init(id)
    ia_block_new_var_s(id, "digit", "")
    ia_block_new_var_s(id, "code", "")
end
