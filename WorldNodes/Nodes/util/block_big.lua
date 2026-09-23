function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    local level = get_level()
    set_default_block(get_input_path_block_s(level, "bt"))
end

function p.__type_init(id)
    ia_block_new_var_s(id, "bt", "base_root")
end