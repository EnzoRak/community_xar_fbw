function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_dark_concrete_orange_border"
end


function p.__main()
    set_default_block("e")

    --Getting all nearby spheres.
    local sphere_array = p.harvest_spheres()
    local sphere_array_Y = p.harvest_spheres_Y()
    local sphere_array_X = p.harvest_spheres_X()

    --Iterating over all block positions,
    --seeing which ones are close to a sphere.
    for x = 0,15 do
    for y = 0,15 do
    for z = 0,15 do
        local bp = std.bp(x,y,z)
        local vec = std.block_center(bp)
        for i = 1,#sphere_array do
            local obj = sphere_array[i]
            local obj2 = sphere_array_Y[i]
		    local obj3 = sphere_array_X[i]
			
			--block_xar_weapons_research_facility_intersection
			
			if h.dist_sq_2d_no_X(obj3.vec, vec) < 0.1 then
				if get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_Y" or get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_Z" or get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_X" then
					set_pos(x,y,z, "block_xar_weapons_research_facility_intersection")
				else
					set_pos(x,y,z, "block_xar_weapons_research_facility_maze_X") --Making the position solid.
				end
            end
			
			
			if h.dist_sq_2d_no_Y(obj2.vec, vec) < 0.1 then
				if get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_Y" or get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_Z" or get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_X" then
					set_pos(x,y,z, "block_xar_weapons_research_facility_intersection")
				else
					set_pos(x,y,z, "block_xar_weapons_research_facility_maze_Y") --Making the position solid.
				end
				
				
            end
			
            if h.dist_sq_2d_no_Z(obj.vec, vec) < 0.1 then
				if get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_Y" or get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_Z" or get_pos(x,y,z) == "block_xar_weapons_research_facility_maze_X" then
					set_pos(x,y,z, "block_xar_weapons_research_facility_intersection")
				else
					set_pos(x,y,z, "block_xar_weapons_research_facility_maze_Z") --Making the position solid.
				end
            end	
        end
    end end end
	if randi(1,48) == 1 then
		add_ment(7,7,7,"ment_monster_true_guardian")
	end
end

--Iterating over the 3x3x3 region of chunks
--around the chunk being generated
--and getting all spheres in these chunks.
function p.harvest_spheres()
    local sphere_array = {}
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_spheres2(sphere_array, dx, dy, dz)
    end end end
    return sphere_array
end

function p.harvest_spheres_Y()
    local sphere_array = {}
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_spheres2_Y(sphere_array, dx, dy, dz)
    end end end
    return sphere_array
end

function p.harvest_spheres_X()
    local sphere_array = {}
    for dx = -1,1 do
    for dy = -1,1 do
    for dz = -1,1 do
        p.harvest_spheres2_X(sphere_array, dx, dy, dz)
    end end end
    return sphere_array
end

--Getting spheres from one virtual chunk.
function p.harvest_spheres2(
    sphere_array, dx, dy, dz)
--
    --Getting vchunk (virtual chunk) data.
    local chop = 0
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
    local new_sphere = {}
    new_sphere.vec = std.vec(
        16.0 * randf() + 16.0*dx,
        16.0 * randf() + 16.0*dy,
        0.0)
    sphere_array[#sphere_array+1] = new_sphere
end

function p.harvest_spheres2_Y(
    sphere_array, dx, dy, dz)
--
    --Getting vchunk (virtual chunk) data.
    local chop = 0
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
	for moreTubas = 0,1 do
		local new_sphere = {}
		new_sphere.vec = std.vec(
			16.0 * randf() + 16.0*dx,
			0.0,
			16.0 * randf() + 16.0*dz)
		sphere_array[#sphere_array+1] = new_sphere
	end
end

function p.harvest_spheres2_X(
    sphere_array, dx, dy, dz)
--
    --Getting vchunk (virtual chunk) data.
    local chop = 0
    local vd = get_vchunk_data(chop, dx, dy, dz)

    srand(vd.seed)
	for moreTubas = 0,1 do
		local new_sphere = {}
		new_sphere.vec = std.vec(
			0.0,
			16.0 * randf() + 16.0*dy,
			16.0 * randf() + 16.0*dz)
		sphere_array[#sphere_array+1] = new_sphere
	end
end


