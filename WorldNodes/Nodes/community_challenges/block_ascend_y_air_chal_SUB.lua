function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("block_ascend_y_air_chal_SUB")

    local parent_depth = 0
    local level = get_level()
    if( get_input_path_block_var_exists(level-1, "depth", "i") ) then
        parent_depth = get_input_path_block_i(level-1, "depth")
    end
    local depth = parent_depth + 1
    chunk_set_i("depth", depth)

    if(depth>=20) then
        base_blue_tele.set_blue_type_terminal(7,7,7)
        if(depth>=25) then
            if(randf()<0.3) then
                add_bent_s(7,7,7,"bent_base_txt","Of Course there is a strategy to this. Place Long Distance Markers and set them as your Tracking Marker every time you grow. This way if you shrink farther away, you can always find the way back, because after using the yellow ring once, it transforms after taking effect so you don't have to remember it again. ")
                add_bent(7,7,6,"bent_gold_5")
                add_bent(7,7,8,"bent_gold_5")
            end
        end
    else
        base_blue_tele.set_blue_type_down(7,7,7)
    end
    
    --lets hope this works...
    local numbers = {}
    for i = 1, 4096 do
        numbers[i] = i
    end
    -- Fisher-Yates shuffle (chatgpt named it...)
    --not too slow i hope?
    for i = 4096, 2, -1 do
        local j = randi(1,i)
        numbers[i], numbers[j] = numbers[j], numbers[i]
    end

        
    -- Function to map 1..4096 -> (x,y,z)
    local function indexToXYZ(n)
        n = n - 1 -- zero-based
        local x = n % 16
        local y = math.floor(n / 16) % 16
        local z = math.floor(n / (16 * 16))
        return x, y, z
    end

    -- Iterate until random fails
    for i = 1, 4096 do
        if randf() >= 0.5 then
            break
        end
        local x, y, z = indexToXYZ(numbers[i])
        --stuff
        add_bent(x,y,z,"bent_ring_yellow")
    end
end



function p.__type_init(id)
    ia_block_new_var_i(id, "depth", 0)
end
