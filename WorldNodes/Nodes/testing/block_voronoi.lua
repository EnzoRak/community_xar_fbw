function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.interp_box(v1, v2, frac)
    return std.vec(
        v1.x * (1.0 - frac.x) + v2.x * frac.x,
        v1.y * (1.0 - frac.y) + v2.y * frac.y,
        v1.z * (1.0 - frac.z) + v2.z * frac.z)
end

function p.get_point(chop,dx,dy,dz)
    local vd = get_vchunk_data(chop, dx,dy,dz)
    srand(vd.seed)
    return p.interp_box(vd.min2,vd.max2,std.vec(randf(),randf(),randf()))
end

function p.get_point2(chop, dx, dy, x, y)
    local p = {pos=p.get_point(chop,dx+x,dy+y,0),dx=dx,dy=dy,id=(dx+x).."_"..(dy+y)}
    p.land = randf() > 0.2
    p.pos.z = p.land and -0.1 or randf()
    return p
end

function p.get_points(chop,x,y)
    local points = {}
    for dx = -1,1 do for dy = -1,1 do
        points[#points+1] = p.get_point2(chop,dx,dy,x,y)
    end end
    return points
end

function p.__main()
    set_default_block("e")
    local chop = 1
    local point = p.get_point2(chop,0,0,0,0)
    if not point.land then
        create_rect("XAR_SOLID_BORING_BLUE",0,0,0,15,15,0)
        return
    end
    local points = p.get_points(chop,0,0)
    local cache = {}
    for x = 0,15 do for y = 0,15 do
        local v = std.vec(x,y,0)
        table.sort(points, function(a,b)
            return std.dist_sq(v,a.pos) < std.dist_sq(v,b.pos)
        end)
        if not cache[points[1].id] then
            cache[points[1].id] = p.get_points(chop,points[1].dx,points[1].dy)
            table.sort(cache[points[1].id],function(a,b)
                return a.pos.z < b.pos.z
            end)
        end
        if not cache[points[2].id] then
            cache[points[2].id] = p.get_points(chop,points[2].dx,points[2].dy)
            table.sort(cache[points[2].id],function(a,b)
                return a.pos.z < b.pos.z
            end)
        end
        local f1 = std.dist(v,points[1].pos)
        local f2 = std.dist(v,points[2].pos)

        local active = (cache[points[1].id][1].id == points[2].id and points[1].pos.z > points[2].pos.z) or
                       (cache[points[2].id][1].id == points[1].id and points[2].pos.z > points[1].pos.z)
        
        local w = 8

        if active and (f2-f1) < w then
            set_pos(x,y,0,"XAR_SOLID_BORING_BLUE")
        end
    end end
end