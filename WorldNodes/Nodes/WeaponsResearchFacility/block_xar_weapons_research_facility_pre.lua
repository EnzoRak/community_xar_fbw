function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_MOSSY_AIR_UP_DOWN_TOP")
	add_bent(7,8,2,"bent_base_ring_green")
    create_rect("block_xar_weapons_research_facility_pre2", 0,0,0, 15,15,0)
    create_rect("XAR_STOPPER_BIG", 0,0,1, 15,15,1)
end