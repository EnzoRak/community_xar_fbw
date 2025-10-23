function p.__get_is_solid() return true end
function p.__get_tex() return "upgrade_pack" end

function p.__main()
    set_default_block("e")
    local level = get_level()
    local amount = get_input_path_block_i(level, "amount")
    local bent = get_input_path_block_s(level, "bent")
    local placed = 0
    local pos = 0
    for i = 1, math.min(amount, 4095) do
        add_bent(math.floor(pos/256),math.floor(pos/16)%16,pos%16,bent)
    end
    add_bent_s(15,15,15,"bent_base_txt","Amount of upgrades here: " .. math.min(amount, 4095) .. (amount <= 4095 and "" or " (Cut off)"))
end

function p.__type_init(id)
    ia_block_new_var_i(id, "amount", 0)
    ia_block_new_var_s(id, "bent", "")
end