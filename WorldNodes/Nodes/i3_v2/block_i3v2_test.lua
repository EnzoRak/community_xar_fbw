function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.setup_xy(handle, chop, salt)
    local data = get_perlin_data_xy(chop, salt)
    cache_perlin_data_xy(handle, data.seeds)
    return data
end
function p.setup_xyz(handle, chop, salt)
    local data = get_perlin_data_xyz(chop, salt)
    cache_perlin_data_xyz(handle, data.seeds)
    return data
end

function p.transform_xy(data,x,y)
    local f = std.vec(x/16,y/16,0)
    return std.vec(data.rmin.x*(1-f.x)+data.rmax.x*f.x, data.rmin.y*(1-f.y)+data.rmax.y*f.y, 0)
end
function p.transform_xyz(data,x,y,z)
    local f = std.vec(x/16,y/16,z/16)
    return std.vec(
        data.rmin.x*(1-f.x)+data.rmax.x*f.x,
        data.rmin.y*(1-f.y)+data.rmax.y*f.y,
        data.rmin.z*(1-f.z)+data.rmax.z*f.z
    )
end

function p.__main()
    set_default_block("e")
    --local data = get_perlin_data_xyz(0, 0)
    --cache_perlin_data_xyz(0, data.seeds)
    local d = p.setup_xy(0, 0, 0)
    --local d2 = p.setup(1, 1, 0)
    --local d3 = p.setup(2, 2, 0)
    for x = 0,15 do for y = 0,15 do-- for z = 0,15 do
        local t1 = p.transform_xy(d,x,y)
        --local t2 = p.transform(d2,x,y,z)
        --local t3 = p.transform(d3,x,y,z)
        local v = perlin_noise_xy(0, t1.x,t1.y)--*0.5 + perlin_noise_xyz(1, t2.x,t2.y,t2.z) + perlin_noise_xyz(2, t3.x,t3.y,t3.z)*2
        if v > -0.1 then
            set_pos(x, y, 0, "XAR_SOLID_BORING_BLUE_BORDER")
        else
            set_pos(x,y,0, "XAR_SOLID_BORING_GREEN")
        end
    end end-- end
end