function p.extract_numbers(str)
    local numbers = {}
    for num in str:gmatch("%d+") do
        table.insert(numbers, tonumber(num))
    end
    return numbers
end

-- Consuming processor
function p.make_randi_randinext(numbers)
    local idx = 1  -- current index in numbers
    
    return function(a,b)
        local calls = 1  -- default
        if idx <= #numbers then
            calls = numbers[idx] + 1
            idx = idx + 1 -- consume one number
        end
        
        local result
        ga_console_print("Randinext Called, expect ".. calls .. " iterations.")
        for i = 0, math.min(calls-1,4096) do
            result = ga_randi(a,b)
            --ga_print("Randinext Called, iteration ".. i ..".")
            ga_console_print("Randinext Called, iteration ".. i ..".")
        end
        return result
    end
end

--copied from game_create_start_pos.lua
--will descend if found
function p.advance_to_random_pos_search_maybe_descend(seed, goal_bt)
    local path = ga_get_viewer_path()
    local chunk_id = ga_get_viewer_chunk_id()
    local data = ga_search_for_bt_in_chunk_random(seed, chunk_id, goal_bt)
    if( data.is_valid ) then
        ga_console_print("random search found: " .. goal_bt)
        local pos = data.value
        local pe = path
        pe = pe .. "_" .. string.format("%x%x%x", pos.x, pos.y, pos.z)
        ga_tele(pe,std.vec(7,7,7))
        --ga_shrink2(std.block_center(pos))
        --local level = ga_get_viewer_level()
        --ga_set_i("xar.create_start_pos.cur_level", level+1)
        return true
    else
        --if its false... rip boso
        --we must be careful that this never happens when we don't want it to.
        --it is okay under certain conditions, because if not found, we just try something else.
        ga_print("THIS SHOULD NEVER PRINT, IF IT DOES, WE ARE [[BAKED]]")  
        return false
    end
end

--only a checker
function p.advance_to_random_pos_search_maybe(seed, goal_bt)
    local path = ga_get_viewer_path()
    local chunk_id = ga_get_viewer_chunk_id()
    local data = ga_search_for_bt_in_chunk_random(seed, chunk_id, goal_bt)
    return data
end

function p.advance_to_random_pos_search_restrict_range(goal_bt, min_x, min_y, min_z, max_x, max_y, max_z)
    local path = ga_get_viewer_path()
    local chunk_id = ga_get_viewer_chunk_id()
    local seed = 0
    local max_attempts = 1024 -- safeguard against infinite loop
    --why so many attempts? because search_for_bt_in_chunk_random always gives the first instance found, where we kind of need one in the range. The smaller the range, the issue. 
    --don't really use it that much. 
    while seed < max_attempts do
        local data = ga_search_for_bt_in_chunk_random(seed, chunk_id, goal_bt)
        if data.is_valid then
            local pos = data.value
            -- check if inside bounding box
            if pos.x >= min_x and pos.x <= max_x and
               pos.y >= min_y and pos.y <= max_y and
               pos.z >= min_z and pos.z <= max_z then
                ga_console_print("random search found: " .. goal_bt .. string.format(" at (%d, %d, %d) with seed %d", pos.x, pos.y, pos.z, seed))
                -- construct teleport path
                local pe = path .. "_" .. string.format("%x%x%x", pos.x, pos.y, pos.z)
                ga_tele(pe, std.vec(7,7,7))
                return true
            end
        else
            -- no valid match for this seed, so give up
            break
        end
        seed = seed + 1
    end
    -- if we reach here, nothing was found
    ga_print("No valid " .. goal_bt .. " found in restricted range after " .. max_attempts .. " attempts")
    ga_console_print("No valid " .. goal_bt .. " found in restricted range after " .. max_attempts .. " attempts")
    return false
end

function p.random_pos_restrict_range(min_x, min_y, min_z, max_x, max_y, max_z)
    --
    local x = p.randinext(min_x, max_x)
    local y = p.randinext(min_y, max_y)
    local z = p.randinext(min_z, max_z)
    local pos = std.bp(x,y,z)
    --
    return pos
end

function p.advance_to_pos(x,y,z)
    local pe = ga_get_viewer_path()
    pe = pe .. "_" .. string.format("%x%x%x", x, y, z)
    ga_tele(pe,std.vec(7,7,7))
end

function p.fromthetop()
    --note: whenever "next_target" is read, it is the current target, whenever it is written, it is the next target.
    --hella goofy i know
    --eventually it won't even have to be ying flower every time, you just pass in an argument to where you want to end up and you will go there. 
    local level = ga_get_viewer_level()
    local path = ga_get_viewer_path()
    local viewer_chunk_id = ga_get_viewer_chunk_id()
    local chunk_bt = ga_get_viewer_chunk_bt()
    local next_target = ga_get_s("community_xar_fbw.ryf.next_target")
    ga_print("Next Target: " .. next_target)
    ga_print("Current Path: " .. path)

    --the chequer
    if(ga_get_b("community_xar_fbw.ryf.started") == false) then
        ga_print("fromthetop")
        ga_tele("",std.vec(7,7,9))
        ga_set_b("community_xar_fbw.ryf.started",true)
        --SWITCHEROO INITIALIZER
        --basically, can be used to determine first descend, a direct route or a convoluted one.  
        local discrimantone = p.randfnext()
        ga_console_print("discrimnant one randf called")
        if(discrimantone < 0.05) then
            --this specific debug area
            ga_tele("777_777_777_777_777_88f_88f_0f1_0f0",std.vec(8,8,7))
            ga_set_s("community_xar_fbw.ryf.next_target","debug")
        elseif(discrimantone<0.10) then
            --this specific alpha cube in the gauntlet. 
            ga_tele("777_77f_7bc",std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","alphacube")
        elseif(discrimantone<0.21) then
            --what goes around comes around. Deep space. 
            ga_tele("777",std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","deepspace")
        elseif(discrimantone<0.88) then
            --what goes around comes around. Near space. 
            ga_tele("777_777_777",std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","nearspace")
        else
            --mylantis
            ga_tele("777_777_777_777_777",std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","mylantis")
        end

        --put one off tests here
        ga_tele("777_777_777",std.block_center(std.vec(7,7,7)))
        ga_set_s("community_xar_fbw.ryf.next_target","nearspace")

        return true
    end

    
    local discduo = p.randfnext()

    --the real dealio
    --switch the order around so that the first few are slightly slower and then the rest are faster?
    --a quiz for the viewer: how many different ways can you see of descending?
    --how many ways can you spot of backtracking?
    --how many ways can you spot of random selection?
    if(next_target == "debug") then
        --more?
        if(discduo<0.6) then
            p.advance_to_pos(1,5,3)
            ga_set_s("community_xar_fbw.ryf.next_target","yingflower")
        else
            p.advance_to_pos(1,9,3)
            ga_set_s("community_xar_fbw.ryf.next_target","orange")
        end
        return true
    elseif(next_target == "yingflower") then
        --more?
        ga_console_print(path)
        if(discduo < 0.8 ) then
            --straight to the room, skipping tutorial and such. 
            path = path .. "_887_7b2_777_777_777_888_888_769_4c9_884_777_222_77c_12a"
            ga_tele(path,std.vec(7.5,2,8))
            --by the time we are done with everything, this should be the only one left. 
            ga_set_b("community_xar_fbw.ryf.started",false)
            return false
        else
            ga_console_print("descending yingforest")
            ga_set_s("community_xar_fbw.ryf.next_target","yingforest")
            return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_YING_FOREST")
        end
        return true
    elseif(next_target == "yingforest") then
        --more?
        if(discduo <= 0.06) then
            ga_console_print("descending orange")
            ga_set_s("community_xar_fbw.ryf.next_target","orangeyf1")
        elseif(discduo < 0.18) then
            local data = p.advance_to_random_pos_search_maybe(p.randinext(0,32766), "XAR_YING_FOREST_DEEP_HANGING")
            if(data.is_valid) then
                local pos = data.value
                local pe = path
                --we could do another discduo choice here to split between 0.02 and 0.27, whether the flower or the moon. Currently, its the moon. 
                pe = pe .. "_" .. string.format("%x%x%x", pos.x, pos.y, pos.z) .. "_77a_773"
                ga_set_s("community_xar_fbw.ryf.next_target","taumoon")
            end
        else
            return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_YING_FOREST")
        end
        return true
    elseif(next_target == "taumoon") then
        --complete this
        ga_set_b("community_xar_fbw.ryf.started",false)
        return false
    elseif(next_target == "alphacube") then
        --finished
        if(discduo < 0.5) then
            --XAR_CUBE1_TREASURE
            p.advance_to_random_pos_search_maybe_descend(0, "XAR_CUBE1_TREASURE")
            ga_set_s("community_xar_fbw.ryf.next_target","cube1treasure")
        else
            --2,2,2, "XAR_CUBE1_CORNER_ROOM
            local pe = path
            pe = pe .. "_222_dd7"
            ga_tele(pe,std.block_center(std.vec(7,7,7)))    
            ga_set_s("community_xar_fbw.ryf.next_target","smallblack")
        end
        return true
    elseif(next_target == "deepspace") then
        --finished
        local pe = path
        for i = 1, 6 do
            ga_console_print("randinext called")
            pe = pe .. "_" .. string.format("%03x", p.randinext(0,4095))
        end
        ga_tele(pe,std.block_center(std.vec(7,7,7)))
        ga_set_s("community_xar_fbw.ryf.next_target","spacemiddescendverifier")
        return true
    elseif(next_target == "nearspace") then
        --more?
        local pos = p.random_pos_restrict_range(6,6,6, 8,8,8)
        local bt = ga_block_get(level, pos);
        if( bt ~= "XAR_SPACE_TOP_0" ) then
            local pe = path
            pe = pe .. "_" .. string.format("%x%x%x", pos.x, pos.y, pos.z)
            for i = 1, 3 do
                ga_console_print("randinext called")
                pe = pe .. "_" .. string.format("%03x", p.randinext(0,4095))
            end
            ga_tele(pe,std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","spacemiddescendverifier")
        end
        --we don't have to set anything. If this ain't true, it come right back to here. 
        return true
    elseif(next_target == "mylantis") then
        --more?
        if(discduo <= 1) then
            p.advance_to_pos(8, 8, 15)
            ga_set_s("community_xar_fbw.ryf.next_target","topcity")
        end
        return true
    elseif(next_target == "topcity") then
        if(discduo < 0.35) then
            p.advance_to_pos(8, 8, 15)
            ga_set_s("community_xar_fbw.ryf.next_target","topgarden")
        elseif(discduo<0.69) then
            p.advance_to_pos(9, 8, 14)
            ga_set_s("community_xar_fbw.ryf.next_target","holside")
        else
            --generic side (not implemented)
        end
        return true
    elseif(next_target == "topgarden") then
        if(discduo < 0.5) then
            ga_set_s("community_xar_fbw.ryf.next_target","debug")
        else
            
        end
        return true
    elseif(next_target == "holside") then
        if(discduo < 0.5) then
            local pe = path
            local pos = p.advance_to_random_pos_search_maybe(p.randinext(0,32766), "XAR_MYLANTIS_CITY_HOL_PORTAL")
            local phoneext = ""
            if(discduo < 0.1) then
                phoneext = "_987"
            elseif(discduo < 0.2) then
                phoneext = "_877"
            elseif(discduo < 0.3) then
                phoneext = "_787"
            elseif(discduo < 0.4) then
                phoneext = "_897"
            else
                phoneext = "_889"
            end
            pe = pe .. "_" .. string.format("%x%x%x", pos.x, pos.y, pos.z) .. phoneext 
            ga_tele(pe,std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","hellpatch")
        else
            local pe = path
            local pos = p.advance_to_random_pos_search_maybe(p.randinext(0,32766), "XAR_MYLANTIS_CITY_DANS_HOUSE_TOP")
            pe = pe .. "_" .. string.format("%x%x%x", pos.x, pos.y, pos.z) .. "_778"
            ga_tele(pe,std.block_center(std.vec(7,7,7)))
            ga_set_s("community_xar_fbw.ryf.next_target","dhouse")
        end
        return true
    elseif(next_target == "hellpatch") then
        if(discduo < 0.4) then
            local phoneext = ""
            if(discduo < 0.08) then
                phoneext = "_987"
            elseif(discduo < 0.16) then
                phoneext = "_877"
            elseif(discduo < 0.24) then
                phoneext = "_787"
            elseif(discduo < 0.32) then
                phoneext = "_897"
            else
                phoneext = "_889"
            end
            local pe = path
            pe = pe .. phoneext 
            ga_tele(pe,std.block_center(std.vec(7,7,7)))
        elseif(discduo<0.45) then
            --0.05/0.6 -> 1/12
            ga_set_s("community_xar_fbw.ryf.next_target","dandelions")
            return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_DANDELIONS")
        else
            ga_set_s("community_xar_fbw.ryf.next_target","hell")
            p.advance_to_pos(8,8,3)
        end
        return true
    elseif(next_target == "dandelions") then
        ga_set_b("community_xar_fbw.ryf.started",false)
        return false
    elseif(next_target == "hell") then
        ga_set_b("community_xar_fbw.ryf.started",false)
        return false
    elseif(next_target == "dhouse") then
        if(discduo <= 1) then
            ga_set_s("community_xar_fbw.ryf.next_target","yingforest")
            return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_YING_FOREST")
        end
        return true
    elseif(next_target == "spacemiddescendverifier") then
        if(chunk_bt == "XAR_SPACE_MID") then
            ga_set_s("community_xar_fbw.ryf.next_target","spacemid")
        elseif(chunk_bt == "XAR_ASTEROID_GOLD_MEDIUM") then
            --rare
            --CHANGE?
            ga_set_s("community_xar_fbw.ryf.next_target","bulk")
            p.advance_to_pos(7,7,8)
        else
            ga_print("HOOLIGAN IN QUESTION" .. chunk_bt)
            ga_console_print("HOOLIGAN IN QUESTION" .. chunk_bt)
            --what goes around comes around. Deep space. 
            if(discduo<0.2) then
                ga_tele("777",std.block_center(std.vec(7,7,7)))
                ga_set_s("community_xar_fbw.ryf.next_target","deepspace")
            else
                ga_tele("777_777_777",std.block_center(std.vec(7,7,7)))
                ga_set_s("community_xar_fbw.ryf.next_target","nearspace")
            end
        end
        return true
    elseif(next_target == "spacemid") then
        --temp
        ga_set_b("community_xar_fbw.ryf.started",false)
        return false
    elseif(next_target == "bulk") then
        --temp
        ga_set_b("community_xar_fbw.ryf.started",false)
        return false
    elseif(next_target == "cube1treasure") then
        ga_console_print("cube1treasure")
        p.advance_to_pos(1,7,12)
        ga_set_s("community_xar_fbw.ryf.next_target","smallblack")
        return true
    elseif(next_target == "smallblack") then
        --temp
        ga_set_b("community_xar_fbw.ryf.started",false)
        return false
    elseif(next_target == "orangeyf1" or next_target == "orangeyf3" or next_target == "orangeyf5" or next_target == "orangeyf6") then
        p.advance_to_random_pos_search_restrict_range("XAR_YING_FOREST", 0, 0, 0, 15, 15, 0)
        local str = next_target
        local new_str = str:gsub("(%d+)$", function(n)
            return tostring(tonumber(n) + 1)
        end)
        ga_set_s("community_xar_fbw.ryf.next_target", new_str)
        return true
    elseif(next_target == "orangeyf2" or next_target == "orangeyf4") then
        p.advance_to_random_pos_search_restrict_range("XAR_YING_FOREST", 0, 0, 1, 15, 15, 15)
        local str = next_target
        local new_str = str:gsub("(%d+)$", function(n)
            return tostring(tonumber(n) + 1)
        end)
        ga_set_s("community_xar_fbw.ryf.next_target", new_str)
        return true
    elseif(next_target == "orangeyf7") then
        ga_set_s("community_xar_fbw.ryf.next_target", "orange")
        return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_ORANGE")
    elseif(next_target == "orange") then
        --more stuff here later
        if(discduo <=1) then
            ga_set_s("community_xar_fbw.ryf.next_target", "stoneyair")
            return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_STONEY_AIR")
        end
        return true
    elseif(next_target == "stoneyair") then
        if(discduo <=1) then
            local data = p.advance_to_random_pos_search_maybe(p.randinext(0,32766), "XAR_YING_FLOWER")
            if(data.is_valid) then
                ga_set_s("community_xar_fbw.ryf.next_target","yingflower")
                p.advance_to_pos(data.value.x,data.value.y,data.value.z)
                return true
            end
        end
        return p.advance_to_random_pos_search_maybe_descend(p.randinext(0,32766), "XAR_STONEY_AIR")
    else
        ga_print("THIS SHOULD NEVER PRINT, IF IT DOES, WE ARE [[BROILED AND OR BAKED]]")
        return false
    end
end

function p.main()
    ga_print("no we cannot")
    local l = game_tele_random_ying_flower.extract_numbers(ga_get_s("community_xar_fbw.ryf.magic_string"))

    --this might be terrible logic right here. 
    p.randinext = p.make_randi_randinext(l)
    
    --this might be even worse logic right here. 
    function p.randfnext() 
        --from https://discord.com/channels/1296531370319024170/1419520004227072093/1419642471071219822
        return (p.randinext(0,32767)/32767.0)
    end


    ga_move_set_body_spirit()
    --stuff and stuff
    --because set in the fromthetop function. 
    ga_set_b("community_xar_fbw.ryf.started",false)
    ga_console_print("")
    ga_explore_while("game_tele_random_ying_flower.fromthetop","win_ryf_in_progress")
    --stuff and stuff end
    ga_move_set_body_spirit_off()
    ga_window_pop_all()
end


