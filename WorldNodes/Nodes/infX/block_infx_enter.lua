function p.__get_is_solid() return true end
function p.__get_tex() return "block_infinity_green" end

function p.__main()
    local level = get_level()
    local val = get_input_path_block_i(level, "val")
    infx.entrance(val)
end

function p.__type_init(id)
    ia_block_new_var_i(id, "val", 0)
end