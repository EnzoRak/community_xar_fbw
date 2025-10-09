function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_MYLANTIS")
    set_pos(0,0,15, "mcl12_containment_base_chunk")
end
