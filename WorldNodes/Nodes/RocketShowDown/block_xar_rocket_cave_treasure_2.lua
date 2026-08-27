function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_yellow_x"
end

function p.__main()
    set_default_block("e")
	create_xar_chunk("XAR_RAIL_CAVE_TREASURE_2")
	for x = 1,14,13 do
	for y = 3,12,9 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_4_radius")
	end end end
	for x = 3,12,9 do
	for y = 3,12,9 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_4_radius")
	end end end
	for x = 3,12,9 do
	for y = 1,14,13 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_4_radius")
	end end end
	for x = 1,14,13 do
	for y = 1,14,13 do
	for z = 3,13,2 do
		add_bent(x,y,z,"bent_upgrade_gun_4_radius")
	end end end
	add_bent(7,7,9, "bent_upgrade_gun_4_fire_speed")
	add_bent(7,7,11,"bent_upgrade_gun_4_damage")
	add_bent(9,7,11,"bent_upgrade_gun_4_damage")
	add_bent(7,9,11, "bent_upgrade_gun_4_damage")
	add_bent(5,7,11, "bent_upgrade_gun_4_damage")
	add_bent(7,5,11, "bent_upgrade_gun_4_damage")
	add_bent(7,7,5, "bent_gold_once_100")
    add_bent(7,7,7,"bent_base_save")

end
