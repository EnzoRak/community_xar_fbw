function p.__get_bt_to_copy() return "XAR_MOSSY_AIR" end

function p.__main()
    create_xar_chunk("XAR_MOSSY_AIR")
end


function p.__type_init(id)
    ia_block_new_var_s(id, "digit", "")
    ia_block_new_var_s(id, "code", "")
end
