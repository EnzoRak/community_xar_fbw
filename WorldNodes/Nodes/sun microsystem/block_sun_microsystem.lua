function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_SPACE_TOP_1")
    --time for gamer... oh yeah.
    --the sun microsystem. (TM?)
    set_pos(7,7,8,"block_sun_microsystem")
    set_pos(7,7,7,"block_sun_god_carcass")
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
    for i = 1, 3 do
        set_pos(pos[i].x, pos[i].y, pos[i].z, "block_twoworld_container")
    end
    for i = 4, 6 do
        set_pos(pos[i].x, pos[i].y, pos[i].z, "block_galaxy_blackhole")
    end
end