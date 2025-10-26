function p.generate_maze(xanus,banus,thenus, w,h,d)

    srand(seed_normal())

    local start = std.vec(xanus,banus,thenus)
    local maze = {}
    for x = 0, w-1 do
        maze[x] = {}
        for y = 0, h-1 do
            maze[x][y] = {}
            for z = 0, d-1 do
                maze[x][y][z] = 1  -- 1: filled (wall/solid), 0: empty (path)
            end
        end
    end

    local directions = {{1, 0, 0}, {-1, 0, 0}, {0, 1, 0}, {0, -1, 0}, {0, 0, 1}, {0, 0, -1}}

    local function shuffle(t)
        local shuffled = {}
        for i, v in ipairs(t) do
            shuffled[i] = v
        end
        for i = #shuffled, 2, -1 do
            local j = randi(1,i)
            shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
        end
        return shuffled
    end

    local function in_bounds(xx, yy, zz)
        return xx >= 0 and xx < w and yy >= 0 and yy < h and zz >= 0 and zz < d
    end

    local function would_cause_loop(nx, ny, nz, cx, cy, cz)
        for _, dir in ipairs(directions) do
            local nxx, nyy, nzz = nx + dir[1], ny + dir[2], nz + dir[3]
            if in_bounds(nxx, nyy, nzz) and (nxx ~= cx or nyy ~= cy or nzz ~= cz) and maze[nxx][nyy][nzz] == 0 then
                return true  -- would cause loop
            end
        end
        return false
    end

    local max_depth = 0
    local deepest = std.vec(start.x, start.y, start.z)
    local last = std.vec(start.x, start.y, start.z)

    local function carve(x, y, z, depth)
        maze[x][y][z] = 0
        last = std.vec(x, y, z)
        if depth > max_depth then
            max_depth = depth
            deepest = std.vec(x, y, z)
        end
        local dirs = shuffle(directions)
        for _, dir in ipairs(dirs) do
            local nx, ny, nz = x + dir[1], y + dir[2], z + dir[3]
            if in_bounds(nx, ny, nz) and maze[nx][ny][nz] == 1 and not would_cause_loop(nx, ny, nz, x, y, z) then
                carve(nx, ny, nz, depth + 1)
            end
        end
    end

    carve(start.x, start.y, start.z, 1)

    return {
        maze = maze,
        deepest = deepest,
        last = last
    }
end


--[[
function print_maze(maze, dim, start, deepest, last)
    for z = 0, dim.z - 1 do
        print("Layer z=" .. z)
        for y = 0, dim.y - 1 do
            local line = ""
            for x = 0, dim.x - 1 do
                if x == start.x and y == start.y and z == start.z then
                    line = line .. "S "
                elseif x == deepest.x and y == deepest.y and z == deepest.z then
                    line = line .. "D "
                elseif x == last.x and y == last.y and z == last.z then
                    line = line .. "L "
                else
                    line = line .. (maze[x][y][z] == 0 and ". " or "# ")
                end
            end
            print(line)
        end
        print("")
    end
end
]]--

--[[
-- Test for flat maze (15x15x1, 0-indexed, start at 7,7,0)
local dim = std.vec(15, 15, 3)
local start = std.vec(7, 7, 1)
local result = generate_maze(start, dim)
print_maze(result.maze, dim, start, result.deepest, result.last)
print("Deepest: x=" .. result.deepest.x .. ", y=" .. result.deepest.y .. ", z=" .. result.deepest.z)
print("Last: x=" .. result.last.x .. ", y=" .. result.last.y .. ", z=" .. result.last.z)
]]--