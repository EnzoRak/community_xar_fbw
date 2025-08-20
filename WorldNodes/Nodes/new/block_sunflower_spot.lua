function p.__get_is_solid() return true end
function p.__get_tex() return "block_mushroom_yellow" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
end

function p.__type_init(id)
    ia_block_new_var_i(id, "sundirection", -1)
end
