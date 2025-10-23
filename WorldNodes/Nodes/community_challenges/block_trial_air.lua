function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    local level = get_level()
    local tier = get_input_path_block_i(level-1, "tier")
    set_default_block("grow_air")
    local monsters = { -- weakest at the top, strongest at the bottom!
                       -- note that the hp and dps are uncurved
        "ment_monster_goblin",           -- 1   dps (5d/5s)    32   hp
        "ment_monster_imp",              -- 1   dps (5d/5s)    32   hp
        "ment_monster_marine_light",     -- 1   dps (2d/2s)    32   hp
        "ment_monster_marine",           -- 2   dps (4d/2s)    64   hp
        "ment_monster_goon_petite",      -- 2   dps (20d/10s)  200  hp
        "ment_monster_goon_small",       -- 3   dps (30d/10s)  500  hp
        "ment_monster_marine_heavy",     -- 4   dps (8d/2s)    128  hp
        "ment_monster_gnoll",            -- 4   dps (20d/5s)   200  hp
        "ment_monster_goon",             -- 4   dps (40d/10s)  1k   hp
        "ment_monster_goon_large",       -- 5   dps (50d/10s)  2k   hp
        "ment_monster_marine_rebel",     -- 6   dps (6d/1s)    500  hp
        "ment_monster_goon_major",       -- 7   dps (70d/10s)  5k   hp
        "ment_monster_marine_insurgent", -- 8   dps (8d/1s)    1k   hp
        "ment_monster_demon",            -- 10  dps (50d/5s)   1k   hp
        "ment_monster_goon_questionable",-- 10  dps (100d/10s) 10k  hp
        "ment_monster_marine_guerilla",  -- 15  dps (15d/1s)   50k  hp
        "ment_monster_menace",           -- 20  dps (20d/1s)   300  hp
        "ment_monster_orc",              -- 20  dps (100d/5s)  5k   hp
        "ment_monster_goon_immoral",     -- 20  dps (200d/10s) 20k  hp
        "ment_monster_menace_vile",      -- 20  dps (20d/1s)   100k hp
        "ment_monster_marine_hit_man",   -- 25  dps (25d/1s)   100k hp
        "ment_monster_goon_unsavory",    -- 30  dps (300d/10s) 50k  hp
        "ment_monster_troll",            -- 40  dps (200d/5s)  50k  hp
        "ment_monster_goon_evil",        -- 40  dps (400d/10s) 100k hp
        "ment_monster_marine_mercinary", -- 40  dps (40d/1s)   500k hp
        "ment_monster_goon_despicable",  -- 50  dps (500d/10s) 200k hp
        "ment_monster_marine_commando",  -- 50  dps (50d/1s)   1M   hp
        "ment_monster_ogre",             -- 80  dps (400d/5s)  500k hp
        "ment_monster_rat_minor",        -- 100 dps (100d/1s)  10k  hp
        "ment_monster_goon_ultimate",    -- 100 dps (1kd/10s)  1M   hp
        "ment_monster_lamprey",          -- 100 dps (100d/1s)  1M   hp
        "ment_monster_hexatrix",         -- 200 dps (2kd/10s)  1M   hp
        "ment_monster_lamprey_yellow",   -- 200 dps (200d/1s)  1M   hp
        "ment_monster_rat_lesser",       -- 300 dps (300d/1s)  30k  hp
        "ment_monster_lamprey_green",    -- 300 dps (300d/1s)  1M   hp
        "ment_monster_lamprey_red",      -- 500 dps (500d/1s)  1M   hp
        "ment_monster_rat",              -- 1k  dps (1kd/1s)   100k hp
        "ment_monster_lamprey_blue",     -- 1k  dps (1kd/1s)   1M   hp
        "ment_monster_rat_greater",      -- 3k  dps (3kd/1s)   300k hp
        "ment_chewing_gum",              -- 10% dps (10%/1s)   200k hp
    }
    local myz = get_input_path()[level-1].z
    local I = math.min(tier*2+math.floor(myz/2), #monsters-3)
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
    if randf() < 0.1 then
        add_bent(randi(0,15),randi(0,15),randi(0,15),"bent_base_ring_green")
    end
end