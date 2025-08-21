function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_yellow" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
end

function p.__get_can_use(level, pos)
    if(ga_block_get_i(level, pos, "canuse") == 1) then
        return true
    end
    return false
end

function p.__get_use_msg(level, pos)
    return "USE TO START THE SUNFLOWER RITUAL."
end

function p.__on_use(level, pos)
    --if(level<5) then return end
    local sunfound = false
    local leveldecrementer = ga_get_viewer_level()
    ga_console_print("Sun found?  " .. leveldecrementer)
    ga_print("Sun found?  " .. leveldecrementer)
    while sunfound == false or leveldecrementer > 2 do
        if( ga_search_for_bt_in_chunk(ga_get_viewer_ancestor_chunk_id(leveldecrementer), "XAR_SPACE_SUN")) then
            sunfound = true
        end
        leveldecrementer = leveldecrementer - 1
    end 
    --if(sunfound == false) then return end --oh well
    leveldecrementer = leveldecrementer + 1
    ga_console_print("Sun found?  " .. tostring(sunfound))
    ga_print("Sun found?  " .. tostring(sunfound))
    ga_console_print("Sun found? (Post) " .. leveldecrementer)
    ga_print("Sun found?  (Post)" .. leveldecrementer)
    ga_ment_start(leveldecrementer, ga_chunk_id_and_lbp_to_bp(ga_get_viewer_ancestor_chunk_id(leveldecrementer), std.vec(7,7,7)), "ment_sun")
    ga_ment_end()
    ga_block_set_i(level, pos, "canuse", 0)
end

function p.__on_use2(level, pos)
    if(p.__get_can_use(level,pos) == true) then
        p.__on_use(level, pos)
    end
end


function p.__type_init(id)
    ia_block_new_var_i(id, "canuse", 1)
end
