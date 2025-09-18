--Ai generated code is among us.

-- 4D Maze generator with coordinated w teleporters
-- Disjoint set (union-find) for Kruskal
function p.make_set(n)
    local parent = {}
    for i = 1, n do parent[i] = i end
    local function find(x)
        if parent[x] ~= x then parent[x] = find(parent[x]) end
        return parent[x]
    end
    local function union(a,b)
        local ra, rb = find(a), find(b)
        if ra ~= rb then parent[rb] = ra end
    end
    local function same(a,b) return find(a) == find(b) end
    return {find=find, union=union, same=same}
end

-- Linear index for 4D vertex
function p.idx(x,y,z,w,X,Y,Z,W) return ((w*Z + z)*Y + y)*X + x + 1 end

-- Get coordinates from index
function p.get_coords(i, X, Y, Z, W)
    i = i - 1
    local x = i % X
    i = math.floor(i / X)
    local y = i % Y
    i = math.floor(i / Y)
    local z = i % Z
    i = math.floor(i / Z)
    local w = i
    return x, y, z, w
end

-- Generate 4D maze
function p.generate_maze_4d(X,Y,Z,W)
    -- Step 1: Generate 4D maze using Kruskal
    local nodes = X*Y*Z*W
    local dsu = std_4dmaze.make_set(nodes)
    local edges = {}

    for w=0,W-1 do
        for z=0,Z-1 do
            for y=0,Y-1 do
                for x=0,X-1 do
                    local u = std_4dmaze.idx(x,y,z,w,X,Y,Z,W)
                    if x+1<X then table.insert(edges,{u, std_4dmaze.idx(x+1,y,z,w,X,Y,Z,W), "x"}) end
                    if y+1<Y then table.insert(edges,{u, std_4dmaze.idx(x,y+1,z,w,X,Y,Z,W), "y"}) end
                    if z+1<Z then table.insert(edges,{u, std_4dmaze.idx(x,y,z+1,w,X,Y,Z,W), "z"}) end
                    if w+1<W then table.insert(edges,{u, std_4dmaze.idx(x,y,z,w+1,X,Y,Z,W), "w"}) end
                end
            end
        end
    end

    -- Shuffle edges
    math.randomseed(os.time())
    for i=#edges,2,-1 do
        local j = math.random(i)
        edges[i], edges[j] = edges[j], edges[i]
    end

    -- Track passages in 4D
    local passages = {}
    for i=1,nodes do passages[i] = {} end

    -- Initialize teleporters
    local teleporter = {}
    for w=0,W-1 do
        teleporter[w] = {}
        for z=0,Z-1 do
            teleporter[w][z] = {}
            for y=0,Y-1 do
                teleporter[w][z][y] = {}
                for x=0,X-1 do
                    teleporter[w][z][y][x] = {up=false, down=false}
                end
            end
        end
    end

    for _,e in ipairs(edges) do
        local u,v,type = e[1], e[2], e[3]
        if not dsu.same(u,v) then
            dsu.union(u,v)
            table.insert(passages[u], {v,type})
            table.insert(passages[v], {u,type})
            if type == "w" then
                local x,y,z,wu = std_4dmaze.get_coords(u, X,Y,Z,W)
                local _,_,_,wv = std_4dmaze.get_coords(v, X,Y,Z,W)
                teleporter[wu][z][y][x].up = true
                teleporter[wv][z][y][x].down = true
            end
        end
    end

    -- Step 2: Initialize grid
    local gx,gy,gz = 2*X-1,2*Y-1,2*Z-1
    local grid = {}
    for w=1,W do
        grid[w] = {}
        for z=1,gz do
            grid[w][z] = {}
            for y=1,gy do
                grid[w][z][y] = {}
                for x=1,gx do
                    grid[w][z][y][x] = "#"
                end
            end
        end
    end

    -- Step 3: Place 4D vertices (cells)
    for w=0,W-1 do
        for z=0,Z-1 do
            for y=0,Y-1 do
                for x=0,X-1 do
                    grid[w+1][2*z+1][2*y+1][2*x+1] = "A" -- temporary
                end
            end
        end
    end

    -- Step 4: Place hallways for x,y,z directions
    for u=1,nodes do
        local x,y,z,w = std_4dmaze.get_coords(u, X,Y,Z,W)
        for _,p in ipairs(passages[u]) do
            local v,type = p[1],p[2]
            if type ~= "w" then
                local vx,vy,vz,vw = std_4dmaze.get_coords(v, X,Y,Z,W)
                local hx = math.floor((2*x + 2*vx + 2) / 2)
                local hy = math.floor((2*y + 2*vy + 2) / 2)
                local hz = math.floor((2*z + 2*vz + 2) / 2)
                grid[w+1][hz][hy][hx] = " "
            end
        end
    end

    -- Step 5: Convert cells to characters based on teleporters
    for w=0,W-1 do
        for z=0,Z-1 do
            for y=0,Y-1 do
                for x=0,X-1 do
                    local up = teleporter[w][z][y][x].up
                    local down = teleporter[w][z][y][x].down
                    local char
                    if up and down then char = "D"
                    elseif up then char = "B"
                    elseif down then char = "C"
                    else char = "A" end
                    grid[w+1][2*z+1][2*y+1][2*x+1] = char
                end
            end
        end
    end

    -- Step 6: Flatten to string
    local chars = {}
    for w=1,W do
        for z=1,gz do
            for y=1,gy do
                for x=1,gx do
                    table.insert(chars,grid[w][z][y][x])
                end
            end
        end
    end

    return table.concat(chars)
end



--some testing functions made by the ai to test the behavior printing the position of blocks as a table. 
--[[


-- Print all layers
function print_maze_layers(maze,X,Y,Z,W)
    local gx,gy,gz = 2*X-1,2*Y-1,2*Z-1
    local idx = 1
    for w=0,W-1 do
        for z=0,gz-1 do
            print(string.format("Layer w=%d, z=%d",w,z))
            for y=0,gy-1 do
                local row = {}
                for x=0,gx-1 do
                    table.insert(row, maze:sub(idx,idx))
                    idx = idx +1
                end
                print(table.concat(row))
            end
            print()
        end
    end
end

-- Print specific w-layer
function print_w_layer(maze,X,Y,Z,W,w_layer)
    local gx,gy,gz = 2*X-1,2*Y-1,2*Z-1
    local start = w_layer*(gx*gy*gz)+1
    local idx = start
    for z=0,gz-1 do
        print(string.format("Layer w=%d, z=%d",w_layer,z))
        for y=0,gy-1 do
            local row = {}
            for x=0,gx-1 do
                table.insert(row,maze:sub(idx,idx))
                idx = idx +1
            end
            print(table.concat(row))
        end
        print()
    end
end

-- Example usage:
local maze = generate_maze_4d(3,3,2,4)
print_maze_layers(maze,3,3,2,4)
print_w_layer(maze,3,3,2,4,0)
print_w_layer(maze,3,3,2,4,1)
print_w_layer(maze,3,3,2,4,2)
print_w_layer(maze,3,3,2,4,3)
print(maze)
print(string.len(maze))

]]--