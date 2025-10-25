function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("block_dream_air")

    local parent_depth = 0
    local level = get_level()
    if( get_input_path_block_var_exists(level-1, "depth", "i") ) then
        parent_depth = get_input_path_block_i(level-1, "depth")
    end
    local depth = parent_depth + 1
    chunk_set_i("depth", depth)

    if(depth>=20) then
        base_blue_tele.set_blue_type_terminal(7,7,7)
    else
        base_blue_tele.set_blue_type_down(7,7,7)
    end
    
    local values = {0,1,2,6,8,10}
    local weights = {32,16,8,4,2,1}
    local total = 0
    for i = 1, #weights do
        total = total + weights[i]
    end
    local r = randi(1, total)
    local sum = 0
    local chosen = 0
    for i = 1, #weights do
        sum = sum + weights[i]
        if r <= sum then
            chosen = values[i]  -- pick value corresponding to weight
            break
        end
    end

    -- do something 'chosen' times
    for i = 1, chosen do
        local x = randi(0,15)
        local y = randi(0,15)
        local z = randi(0,15) 
        add_bent(x,y,z,"bent_ring_yellow")
    end
    if(randf()<0.2) then
        set_pos(8,8,7,"block_simple_rwalk_maze")
    end

end

function p.__type_init(id)
    ia_block_new_var_i(id, "depth", 0)
end
