function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_border"
end

function gunContains(tbl, target)
    for _, value in ipairs(tbl) do
        if value == target then
            return true
        end
    end
    return false
end

function p.__main()
	local gunsGuns = {"XAR_GUNS_GUN_23", "XAR_GUNS_GUN_45", "XAR_GUNS_GUN_6", "XAR_GUNS_GUN_7", "XAR_GUNS_GUN_8", "XAR_GUNS_GUN_9", "XAR_GUNS_HEALTH" }
    set_default_block("e")
	create_xar_chunk("XAR_GUNS")
    set_pos(7,7,15, "XAR_RAIL_CAVE_WHITE_BOX")
	for x = 0,15 do
	for y = 0,15 do
	for z = 0,15 do
		if gunContains(gunsGuns, get_pos(x,y,z)) then
			if z == 1 then
				set_pos(x,y,z, "XAR_SOLID_BORING")
			else
				set_pos(x,y,z, "block_xar_rocket_cave_arcade_guardians")
			end
		elseif (get_pos(x,y,z) == "XAR_GUNS_CENTER") then
			set_pos(x,y,z, "block_xar_rocket_cave_arcade_center")
		elseif (get_pos(x,y,z) == "XAR_GUNS_QUOTE") then
			set_pos(x,y,z, "block_xar_rocket_cave_arcade_quote")
		end
	end end end
end
