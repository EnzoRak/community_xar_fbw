function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_yellow_border"
end

function p.__main()
    set_default_block("block_xar_minigun_flower_air_2")

    --Getting all nearby (positive and negative) spheres.
    local pos_sphere_array = {}
    local pos_sphere_array_2 = {}
    local neg_sphere_array = {}
	local neg_sphere_array_2 = {}
    p.harvest_spheres(
        pos_sphere_array,
		pos_sphere_array_2,
        neg_sphere_array,
		neg_sphere_array_2)

    --Iterating over all block positions.
    --For each position, we see if it is in a positive sphere
    --but not a negative sphere.
    for x = 0,15 do
    for y = 0,15 do
    for z = 0,15 do
        local bp = std.bp(x,y,z)
        local vec = std.block_center(bp)
        local is_solid = false
        for i = 1,#pos_sphere_array do
            local obj = pos_sphere_array[i]
            local r_sq = obj.radius * obj.radius
            if h.dist_sq(obj.vec, vec) < r_sq then
                is_solid = true
            end
        end
        for i = 1,#pos_sphere_array_2 do
            local obj = pos_sphere_array[i]
            local r_sq = obj.radius * obj.radius
            if h.dist_sq(obj.vec, vec) < r_sq then
                is_solid = true
            end
        end
        for i = 1,#neg_sphere_array do
            local obj = neg_sphere_array[i]
            local r_sq = obj.radius * obj.radius
            if h.dist_sq(obj.vec, vec) < r_sq then
                is_solid = false
            end
        end
        for i = 1,#neg_sphere_array_2 do
            local obj = neg_sphere_array_2[i]
            local r_sq = obj.radius * obj.radius
            if h.dist_sq(obj.vec, vec) < r_sq then
                is_solid = false
            end
        end
		if x == 15 and y == 15 and z == 15 then
			set_pos(x,y,z, "block_xar_minigun_flower_fruit_4_final_treasure_chunk") --Treasure
        elseif( is_solid ) then
            if randi (1,1000) == 1 then
				set_pos(x,y,z, "block_xar_minigun_flower_fruit_4_checkpoint") --Making it solid.
			else 
				set_pos(x,y,z, "block_xar_minigun_flower_fruit_4") --Making it solid.
			end
		elseif randi(1,5000) == 1 then
			add_bent(x,y,z, "bent_base_ring_green")
		elseif randi(1,50) == 1 then
			set_pos(x,y,z, "XAR_ASCEND_SIMPLE")
		elseif randi(1,2000) == 1 then
			add_ment(x,y,z, "ment_monster_guardian")
        end
    end end end
end

--Iterating over the 3x3x3 region of chunks
--around the chunk being generated
--and getting all spheres in these chunks.
function p.harvest_spheres(
    pos_sphere_array,
    pos_sphere_array_2,
    neg_sphere_array,
	neg_sphere_array_2)
--
    --Adding positive spheres.
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_pos_spheres(pos_sphere_array, dx, dy, dz)
    end end end
	
	for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_pos_spheres2(pos_sphere_array_2, dx, dy, dz)
    end end end
    
    --Adding negative spheres.
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_neg_spheres(neg_sphere_array, dx, dy, dz)
    end end end
	
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_neg_spheres2(neg_sphere_array_2, dx, dy, dz)
    end end end
end

function p.harvest_pos_spheres(
    pos_sphere_array, dx, dy, dz)
--
    --Getting vchunk data.
    local chop = 2
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
    if( randf() > 1 ) then
        --No spheres in this virtual chunk.
        return
    end
    local new_sphere = {}
    local v1 = h.rand_unit_cube()
    local v2 = h.interp_box(vd.min2, vd.max2, v1)
    new_sphere.vec = v2
    new_sphere.radius = 10.0 * vd.scale
    pos_sphere_array[#pos_sphere_array+1] = new_sphere
end

function p.harvest_pos_spheres2(
    pos_sphere_array, dx, dy, dz)
--
    --Getting vchunk data.
    local chop = 0
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
    if( randf() > 0.7 ) then
        --No spheres in this virtual chunk.
        return
    end
    local new_sphere = {}
    local v1 = h.rand_unit_cube()
    local v2 = h.interp_box(vd.min2, vd.max2, v1)
    new_sphere.vec = v2
    new_sphere.radius = 8.0 * vd.scale
    pos_sphere_array[#pos_sphere_array+1] = new_sphere
end

function p.harvest_neg_spheres(
    neg_sphere_array, dx, dy, dz)
--
    --Getting vchunk data.
    local chop = 0
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
    if( randf() > 0.6 ) then
        --No spheres in this virtual chunk.
        return
    end
    local new_sphere = {}
    local v1 = h.rand_unit_cube()
    local v2 = h.interp_box(vd.min2, vd.max2, v1)
    new_sphere.vec = v2
    new_sphere.radius = 8.0 * vd.scale
    neg_sphere_array[#neg_sphere_array+1] = new_sphere
end


function p.harvest_neg_spheres2(
    neg_sphere_array, dx, dy, dz)
--
    --Getting vchunk data.
    local chop = 1
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
    if( randf() > 0.8 ) then
        --No spheres in this virtual chunk.
        return
    end
    local new_sphere = {}
    local v1 = h.rand_unit_cube()
    local v2 = h.interp_box(vd.min2, vd.max2, v1)
    new_sphere.vec = v2
    new_sphere.radius = 6.0 * vd.scale
    neg_sphere_array[#neg_sphere_array+1] = new_sphere
end

--Iterating over the 3x3x3 region of chunks
--around the chunk being generated
--and getting all spheres in these chunks.
