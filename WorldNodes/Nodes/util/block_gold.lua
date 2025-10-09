function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    set_default_block("e")
    local level = get_level()
    local amount = get_input_path_block_i(level, "amount")
    local placed = 0
    local pos = 0
    while amount > placed and pos < 4095 do
        local diff = amount-placed
        local c = 1
        local possible = {1000,500,300,200,100,50,30,20,10,5,3,2,1}
        for i = 1, #possible do
            if diff >= possible[i] then
                c = possible[i]
                break
            end
        end
        add_bent(math.floor(pos/256),math.floor(pos/16)%16,pos%16,"bent_gold_"..c)
        pos = pos + 1
        placed = placed + c
    end
    add_bent_s(15,15,15,"bent_base_txt","Amount of gold here: " .. placed .. (amount == placed and "" or " (Cut off)"))
end

function p.__type_init(id)
    ia_block_new_var_i(id, "amount", 0)
end