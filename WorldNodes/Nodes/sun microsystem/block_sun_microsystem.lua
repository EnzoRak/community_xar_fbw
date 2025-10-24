function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_MOSSY_AIR_TOP")
    --time for gamer... oh yeah.
    --the sun microsystem. (TM?)
    set_pos(7,7,8,"block_sun_microsystem")
    set_pos(7,7,6,"block_sun_god_carcass")
    set_pos(7,7,6,"block_sun_microsystem")

    local function shuffle(tbl)
        for i = #tbl, 2, -1 do
            local j = randi(1,i)
            tbl[i], tbl[j] = tbl[j], tbl[i]
        end
    end

    local positions = {}

    for x = 1, 13, 2 do
        for y = 1, 13, 2 do
            for z = 1, 13, 2 do
                -- skip (7,7,7)
                if not (x == 7 and y == 7 and z == 7) then
                    table.insert(positions, std.vec(x, y, z))
                end
            end
        end
    end

    shuffle(positions)
    local pos = positions
    set_pos(pos[1].x, pos[1].y, pos[1].z, "block_twoworld_container")
    
end