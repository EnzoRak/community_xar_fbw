function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_green_border" end

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

function p.__main(entrance_mode)
    --create_xar_chunk("XAR_GROUP_3_MEGA")
    set_default_block("XAR_SOLID_BORING_DARK_GREEN_BORDER")
    create_rect("XAR_SOLID_BORING_BLUE_BORDER",0,0,12,15,15,12)
    create_rect("e",0,0,7,15,15,11)

    local d = p.setup_xy(0, 0, 0)
    for x = 0,15 do for y = 0,15 do
        local t1 = p.transform_xy(d,x,y)
        local v = perlin_noise_xy(0, t1.x,t1.y)
        if entrance_mode then
            v = v - 1/(((x-7)*(x-7)+(y-7)*(y-7))/2+1)
        end
        if v > -0.1 then
            set_pos(x, y, 6, "i3v2_ocean_kilo")
        end
    end end
end