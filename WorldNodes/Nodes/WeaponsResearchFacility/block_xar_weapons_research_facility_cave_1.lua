function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_border"
end

function p.__main()

	local enemies = {
	--Length: 13
	--1: EMP 2: NukeDMG 3: NukeAmmo Boss:EMPBunker
		enemyTypes = {"ment_monster_mothership", "ment_monster_nuclear_launch_facility", "ment_monster_nuclear_cyclotron", "ment_monster_mothership", "ment_monster_nuclear_launch_facility", "ment_monster_nuclear_cyclotron", "ment_monster_mothership", "ment_monster_nuclear_launch_facility", "ment_monster_nuclear_cyclotron", "ment_monster_mothership", "ment_monster_nuclear_launch_facility", "ment_monster_nuclear_cyclotron", "ment_monster_mechanized_star"},
		enemyTreasure = {"block_xar_weapons_research_facility_treasure_1", "block_xar_weapons_research_facility_treasure_2", "block_xar_weapons_research_facility_treasure_3", "block_xar_weapons_research_facility_treasure_1", "block_xar_weapons_research_facility_treasure_2", "block_xar_weapons_research_facility_treasure_3", "block_xar_weapons_research_facility_treasure_1", "block_xar_weapons_research_facility_treasure_2", "block_xar_weapons_research_facility_treasure_3", "block_xar_weapons_research_facility_treasure_1", "block_xar_weapons_research_facility_treasure_2", "block_xar_weapons_research_facility_treasure_3", "block_xar_weapons_research_facility_treasure_4"}
    }

	--The chunk is by default solid to start with.
	set_default_block("XAR_EMPTY_BORING")
	--Creating the stick-and-ball data
	
	--structure for the caves.
	caves_start()
	--Making the cave connect
	--together nodes that are at most 2 chunks apart
	--(as opposed to 1 chunk apart).
	--Setting the 5x5x5 option makes cave creation slower.
	caves_set_5x5x5()
	--Between 3 and 5 nodes per chunk (random).
	caves_set_num_nodes(3.0,5.99)
	--Only 0.2 of nodes are large, the rest are small.
	--Small nodes have radius between 2.5 and 3.3, and
	--large nodes have radius between 6.7 and 8.7.
	caves_set_nodes(0.03, 2.5,3.3, 6.7,8.7)
	--Max dist between two nodes that can be connected
	--with an edge is 20.0 (to go beyond 16.0 for this
	--number, must call caves_set_5x5x5).
	--No edges are large.
	--Small tubes (around edges) have radius between 2.0 and 2.5.
	--Large tubes have radius between 7.0 and 8.0.
	caves_set_edges(20.0, 0.0, 1.4,2.0, 7.0,8.0)
	caves_end()
	--Now, the stick-and-ball data structure
	--for the caves has been created.
	--*******************************************
	--*******************************************
	--*******************************************
	--A table, whose keys are the IDs of the nodes
--that have a power up placed in them.
	local filled_nodes = {}
	for x = 0,15 do
	for y = 0,15 do
	for z = 0,15 do
		local close_to_edge = caves_close_to_edge(x,y,z)
		local data = caves_close_to_node2(x,y,z)
		local close_to_node = data.close
	--Carving the position if need be.
		if caves_close_to_node(x,y,z) then
			--Carving out the position.
			set_pos(x,y,z,"block_xar_weapons_research_facility_cave_2")
		elseif caves_close_to_edge(x,y,z) then
			set_pos(x,y,z,"block_xar_weapons_research_facility_cave_2")
		end
	--Adding gold in the center (for each node).
		if not close_to_edge then
			local which_node = data.which_node
			local dist = data.dist
			local is_big = data.is_big
			if (dist > 1.5) and
				filled_nodes[which_node] == nil
			then
				if randf() < 0.00003 and z ~= 0 and get_pos(x,y,z-1) == "XAR_EMPTY_BORING" then
					local seed = randi(1,#enemies.enemyTypes)
					filled_nodes[which_node] = true
					add_ment(x,y,z, enemies.enemyTypes[seed])
					set_pos(x,y,z-1, enemies.enemyTreasure[seed])
				end
			end
		end
	end
	end
	end
end	
