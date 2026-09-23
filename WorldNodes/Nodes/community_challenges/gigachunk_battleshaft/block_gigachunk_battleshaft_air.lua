function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("e")
    local monsters = block_trial_air.monsters
    local level = get_level()
    local my_x = get_input_path()[level-1].x + get_input_path()[level-2].x*16 + get_input_path()[level-3].x*256
    my_x = 4096-my_x
    local I = math.min(my_x//90, #monsters-3)
    --add_bent_s(7,7,7, "bent_base_txt", tostring(my_x) .. " " .. my_x//90 .. " " .. I)
    for x = 3,12 do
        for y = 3,12 do
            for z = 3,12 do
                local r = randf()
                local i = 0
                if r < 0.000625 then -- 1/8000
                    i = I+3
                elseif r < 0.00125 then
                    i = I+2
                elseif r < 0.0025 then
                    i = I+1
                elseif r < 0.005 then
                    i = I
                end

                if i ~= 0 then
                    add_ment(x, y, z, monsters[i])
                end
            end
        end
    end
end