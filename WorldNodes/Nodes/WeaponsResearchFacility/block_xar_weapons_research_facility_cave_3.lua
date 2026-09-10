function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_white_border"
end

function p.__main()


	--The chunk is by default solid to start with.
	set_default_block("XAR_SOLID_BORING_CONCRETE_WHITE_BORDER")
	--Creating the stick-and-ball data
	
	--structure for the caves.
	caves_start()
	--Making the cave connect
	--together nodes that are at most 2 chunks apart
	--(as opposed to 1 chunk apart).
	--Setting the 5x5x5 option makes cave creation slower.
	caves_set_5x5x5()
	--Between 4 and 6 nodes per chunk (random).
	caves_set_num_nodes(4.0,6.99)
	--Only 0.2 of nodes are large, the rest are small.
	--Small nodes have radius between 2.5 and 3.3, and
	--large nodes have radius between 6.7 and 8.7.
	caves_set_nodes(0.03, 1.5,4.3, 5.7,6.7)
	--Max dist between two nodes that can be connected
	--with an edge is 20.0 (to go beyond 16.0 for this
	--number, must call caves_set_5x5x5).
	--No edges are large.
	--Small tubes (around edges) have radius between 2.0 and 2.5.
	--Large tubes have radius between 7.0 and 8.0.
	caves_set_edges(24.0, 0.0, 0.5,3.3, 4.0,5.0)
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
			set_pos(x,y,z,"XAR_EMPTY_BORING")
		elseif caves_close_to_edge(x,y,z) then
			set_pos(x,y,z,"XAR_EMPTY_BORING")
		end
	--Adding gold in the center (for each node).
		if close_to_node then
			local which_node = data.which_node
			local dist = data.dist
			local is_big = data.is_big
			if (dist < 1.5) and randi(1,160) == 1 and
				filled_nodes[which_node] == nil
			then
				filled_nodes[which_node] = true
				if randf() > 0.3 then
					add_bent_s(x,y,z,"bent_base_waypoint","Weapons Research Facility Cave")
				else
					add_bent(x,y,z,"bent_upgrade_gun_9_damage")
				end
			end
		end
	end
	end
	end



    local neg_sphere_array = {}
    p.harvest_spheres(
        neg_sphere_array)

    --Iterating over all block positions.
    --For each position, we see if it is in a positive sphere
    --but not a negative sphere.
    for x = 0,15 do
    for y = 0,15 do
    for z = 0,15 do
        local bp = std.bp(x,y,z)
        local vec = std.block_center(bp)
        local is_solid = true
        for i = 1,#neg_sphere_array do
            local obj = neg_sphere_array[i]
            local r_sq = obj.radius * obj.radius
            if h.dist_sq(obj.vec, vec) < r_sq then
                is_solid = false
            end
        end
        if not ( is_solid ) then
			set_pos(x,y,z, "XAR_EMPTY_BORING")
        end
    end end end
end

--Iterating over the 3x3x3 region of chunks
--around the chunk being generated
--and getting all spheres in these chunks.
function p.harvest_spheres(
    neg_sphere_array)
--
    --Adding positive spheres.
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_pos_spheres(neg_sphere_array, dx, dy, dz)
    end end end
	
end

function p.harvest_pos_spheres(
    sphere_array, dx, dy, dz)
--
    --Getting vchunk data.
    local chop = 1
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
    if( randf() > 0.5 ) then
        --No spheres in this virtual chunk.
        return
    end
    local new_sphere = {}
    local v1 = h.rand_unit_cube()
    local v2 = h.interp_box(vd.min2, vd.max2, v1)
    new_sphere.vec = v2
    new_sphere.radius = 10.0 * vd.scale
    sphere_array[#sphere_array+1] = new_sphere
end

