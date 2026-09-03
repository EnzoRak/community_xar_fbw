function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_border"
end

function p.__main()


    local ammos = {
		"ammo_gun_2_large",
		"ammo_gun_3_small",
		"ammo_gun_4_large",
		"ammo_gun_6_large",
		"ammo_gun_7_small",
		"ammo_gun_2_large",
		"ammo_gun_3_small",
		"ammo_gun_4_large",
		"ammo_gun_6_large",
		"ammo_gun_7_small",
		"ammo_gun_2_large",
		"ammo_gun_3_small",
		"ammo_gun_4_large",
		"ammo_gun_6_large",
		"ammo_gun_3_large",
		"ammo_gun_7_large",
		"ammo_gun_3_large",
		"ammo_gun_7_large",
		"ammo_gun_2_large",
		"ammo_gun_3_small",
		"ammo_gun_4_large",
		"ammo_gun_6_large",
		"ammo_gun_7_small",
		"ammo_gun_2_large",
		"ammo_gun_3_small",
		"ammo_gun_4_large",
		"ammo_gun_6_large",
		"ammo_gun_7_small",
		"ammo_gun_2_large",
		"ammo_gun_3_small",
		"ammo_gun_4_large",
		"ammo_gun_6_large",
		"ammo_gun_3_large",
		"ammo_gun_7_large",
		"ammo_gun_3_large",
		"ammo_gun_7_large",
		"ammo_gun_9"
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
	--Between 3 and 7 nodes per chunk (random).
	caves_set_num_nodes(3.0,6.99)
	--Only 0.2 of nodes are large, the rest are small.
	--Small nodes have radius between 3.5 and 4.3, and
	--large nodes have radius between 8.7 and 10.7.
	caves_set_nodes(0.05, 3.5,4.3, 8.7,10.7)
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
			if randi(1,320) == 1 then
				set_pos(x,y,z,"block_xar_weapons_research_facility_dark_holes")
			else
				set_pos(x,y,z,"XAR_SOLID_BORING")
			end
		elseif caves_close_to_edge(x,y,z) then
			set_pos(x,y,z,"block_xar_weapons_research_facility_cave_3")
		end
	--Adding gold in the center (for each node).
		if close_to_node then
			local which_node = data.which_node
			local dist = data.dist
			local is_big = data.is_big
			if (dist < 1.5) and
				filled_nodes[which_node] == nil
			then
				filled_nodes[which_node] = true
			end
		end
	end
	end
	end
	local vineLength = 0
	local vineLength2 = 0
	for x = 0,15 do
	for y = 0,15 do
	for z = 0,15 do
		if randi(1,48) == 1 then
			if get_pos(x,y,z) == "block_xar_weapons_research_facility_cave_3" and z ~= 0 and get_pos(x,y,z-1) == "XAR_EMPTY_BORING" then
				local zIndex = z
				repeat
				   set_pos(x,y,zIndex,"XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER")
				   zIndex = zIndex - 1
				   vineLength = vineLength + 1
				until zIndex <= 1 or randi(1,16-zIndex) == 1 or
					get_pos(x,y,zIndex-1) ~= "XAR_EMPTY_BORING"
				if zIndex ~= 0 and get_pos(x,y,zIndex) == "XAR_EMPTY_BORING" and vineLength > 3 then
					add_bent(x,y,zIndex,"bent_" .. ammos[randi(1,#ammos)])
				end
			end
		end
		if randi(0,200) == 1 then
			if get_pos(x,y,z) == "XAR_SOLID_BORING" and z ~= 15 and get_pos(x,y,z+1) == "XAR_EMPTY_BORING" then
				local zIndex2 = z
				repeat
				   set_pos(x,y,zIndex2,"XAR_SOLID_BORING_CONCRETE_BLUE_BORDER")
				   zIndex2 = zIndex2 + 1
				until zIndex2 == 15 or randi(1,zIndex2+1) == 1 or
					get_pos(x,y,zIndex2+1) ~= "XAR_EMPTY_BORING"
				create_rect("XAR_SOLID_BORING_CONCRETE_BLUE_X", x-1,y-1,zIndex2, x+1,y+1,zIndex2)
				if zIndex2 ~= 15 and get_pos(x,y,zIndex2+1) == "XAR_EMPTY_BORING" then
					if randi(1,20) == 1 then
						create_rect("XAR_DESCEND_SIMPLE", x-1,y-1,zIndex2+1, x+1,y+1,zIndex2+1)
						set_pos(x,y,zIndex2+1,"XAR_BLUE_MUSHROOM")
					elseif zIndex2 < 14 then
						set_pos(x,y,zIndex2+1,"XAR_SOLID_BORING_EXPANDER")
						set_pos(x,y,zIndex2+2,"XAR_ASCEND_SIMPLE")
					end
					add_ment(x,y,zIndex2+1, "ment_monster_orc")
				end
			end
		end
		if randi(1,480) == 1 then
			if get_pos(x,y,z) == "XAR_SOLID_BORING" and z ~= 0 and get_pos(x,y,z-1) == "XAR_EMPTY_BORING" then
				local zIndex3 = z
				
				--PINK RING SECRET XAR_CREEPING_JENI_VINE_2
				if randf() > 0.85 then
				
					repeat
					   set_pos(x,y,zIndex3,"XAR_CREEPING_JENI_VINE_2")
					   zIndex3 = zIndex3 - 1
					   vineLength2 = vineLength2 + 1
					until zIndex3 <= 1 or randi(1,16-zIndex3) == 1 or
						get_pos(x,y,zIndex3-1) ~= "XAR_EMPTY_BORING"
					if zIndex3 ~= 0 and get_pos(x,y,zIndex3) == "XAR_EMPTY_BORING" and vineLength2 > 3 then
						add_bent(x,y,zIndex3,"bent_base_ring_green")
					end
				else
					repeat
					   set_pos(x,y,zIndex3,"XAR_SOLID_BORING_DARK_GREEN_BORDER")
					   zIndex3 = zIndex3 - 1
					   vineLength2 = vineLength2 + 1
					until zIndex3 <= 1 or randi(1,16-zIndex3) == 1 or
						get_pos(x,y,zIndex3-1) ~= "XAR_EMPTY_BORING"
					if zIndex3 ~= 0 and get_pos(x,y,zIndex3) == "XAR_EMPTY_BORING" and vineLength2 > 3 then
						add_bent(x,y,zIndex3,"bent_base_ring_green")
					end
			
				end
				
			end
		end
	end end end
end	