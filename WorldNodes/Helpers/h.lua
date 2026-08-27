-------------------------------------------------------------------------------
--                       Certain special block types
-------------------------------------------------------------------------------

function p.txt(x, y, z, str)
    set_pos(x,y,z, "block_txt")
    block_set_s(x,y,z, "txt", str)
end

-------------------------------------------------------------------------------
--                               Vector math
-------------------------------------------------------------------------------

--Distance squared between two vectors.
function p.dist_sq(v1, v2)
    local x = v1.x - v2.x
    local y = v1.y - v2.y
    local z = v1.z - v2.z
    return x*x + y*y + z*z
end

--Box interpolating.
--If frac == (0,0,0), it will return v1.
--If frac == (1,1,1), it will return v2.
function p.interp_box(v1, v2, frac)
    return std.vec(
        v1.x * (1.0 - frac.x) + v2.x * frac.x,
        v1.y * (1.0 - frac.y) + v2.y * frac.y,
        v1.z * (1.0 - frac.z) + v2.z * frac.z)
end

-------------------------------------------------------------------------------
--                           Psuedo random releated
-------------------------------------------------------------------------------

--Random vector in the unit cube.
--The unit cube goes from (0,0,0) to (1,1,1).
function p.rand_unit_cube()
    return std.vec(
        randf(),
        randf(),
        randf())
end
