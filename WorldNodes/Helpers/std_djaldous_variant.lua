--a specialized variant of dj aldous and andrei broder algorithm 
-- 3D Aldous–Broder random-walk maze generator with adjacency rejection rule
-- Returns { walls = {...}, halls = {...} }
-- Each element is {x=..., y=..., z=...}, offset applied to all coordinates.

function generate3DMaze(width, height, depth, offsetX, offsetY, offsetZ, seed)
  if seed then math.randomseed(seed) else math.randomseed(os.time()) end

  -- state grid: 'U' = unvisited, 'H' = hallway, '#' = wall
  local grid = {}
  for z = 1, depth do
    grid[z] = {}
    for y = 1, height do
      grid[z][y] = {}
      for x = 1, width do
        grid[z][y][x] = 'U'
      end
    end
  end

  local function inbounds(x,y,z)
    return x>=1 and x<=width and y>=1 and y<=height and z>=1 and z<=depth
  end

  local dirs = {
    {1,0,0}, {-1,0,0},
    {0,1,0}, {0,-1,0},
    {0,0,1}, {0,0,-1},
  }

  local function count_unvisited()
    local c=0
    for z=1,depth do
      for y=1,height do
        for x=1,width do
          if grid[z][y][x]=='U' then c=c+1 end
        end
      end
    end
    return c
  end

  local function has_unvisited_neighbors(x,y,z)
    for _,d in ipairs(dirs) do
      local nx, ny, nz = x+d[1], y+d[2], z+d[3]
      if inbounds(nx,ny,nz) and grid[nz][ny][nx]=='U' then return true end
    end
    return false
  end

  local function shuffle(t)
    for i=#t,2,-1 do
      local j = math.random(i)
      t[i],t[j] = t[j],t[i]
    end
  end

  -- random starting cell
  local cx, cy, cz = math.random(width), math.random(height), math.random(depth)
  grid[cz][cy][cx] = 'H'
  local stack = {}

  local function push(x,y,z)
    table.insert(stack, {x=x,y=y,z=z})
  end
  local function pop()
    return table.remove(stack)
  end

  while count_unvisited() > 0 do
    -- collect unvisited neighbors
    local unv = {}
    for _,d in ipairs(dirs) do
      local nx, ny, nz = cx+d[1], cy+d[2], cz+d[3]
      if inbounds(nx,ny,nz) and grid[nz][ny][nx]=='U' then
        table.insert(unv, {x=nx, y=ny, z=nz})
      end
    end

    if #unv > 0 then
      local pick = unv[math.random(#unv)]
      local nx, ny, nz = pick.x, pick.y, pick.z
      -- adjacency check (avoid creating adjacent hallways)
      local bad = false
      for _,d in ipairs(dirs) do
        local ax, ay, az = nx+d[1], ny+d[2], nz+d[3]
        if inbounds(ax,ay,az) then
          if not (ax==cx and ay==cy and az==cz) and grid[az][ay][ax]=='H' then
            bad = true; break
          end
        end
      end

      if bad then
        grid[nz][ny][nx] = '#'
      else
        push(cx,cy,cz)
        grid[nz][ny][nx] = 'H'
        cx, cy, cz = nx, ny, nz
      end
    else
      if #stack>0 then
        local prev = pop()
        cx,cy,cz = prev.x, prev.y, prev.z
      else
        -- try to jump to any hallway with unvisited neighbor
        local found=false
        for z=1,depth do
          for y=1,height do
            for x=1,width do
              if grid[z][y][x]=='H' and has_unvisited_neighbors(x,y,z) then
                cx,cy,cz = x,y,z
                found=true
                break
              end
            end
            if found then break end
          end
          if found then break end
        end
        if not found then
          for z=1,depth do
            for y=1,height do
              for x=1,width do
                if grid[z][y][x]=='U' then grid[z][y][x]='#' end
              end
            end
          end
          break
        end
      end
    end
  end

  -- convert to wall/hall lists with offsets
  local result = {walls={}, halls={}}
  for z=1,depth do
    for y=1,height do
      for x=1,width do
        local wx, wy, wz = x+offsetX, y+offsetY, z+offsetZ
        if grid[z][y][x]=='H' then
          table.insert(result.halls, {x=wx, y=wy, z=wz})
        else
          table.insert(result.walls, {x=wx, y=wy, z=wz})
        end
      end
    end
  end
  return result
end

-- Function to print 3D maze slice by slice (for visualization)
function print3DMaze(mazeData, width, height, depth, offsetX, offsetY, offsetZ)
  -- reconstruct lookup for quick print
  local map = {}
  for _,p in ipairs(mazeData.halls) do
    local k = string.format("%d,%d,%d", p.x, p.y, p.z)
    map[k] = ' '
  end
  for _,p in ipairs(mazeData.walls) do
    local k = string.format("%d,%d,%d", p.x, p.y, p.z)
    map[k] = '#'
  end

  for z=offsetZ+1, offsetZ+depth do
    print(("Layer z=%d"):format(z))
    for y=offsetY+1, offsetY+height do
      local row = {}
      for x=offsetX+1, offsetX+width do
        local key = string.format("%d,%d,%d", x, y, z)
        row[#row+1] = map[key] or '?'
      end
      print(table.concat(row))
    end
    print("") -- blank line between layers
  end
end

-- Example usage
local W, H, D = 5,5,1
local maze3D = generate3DMaze(W, H, D, 0, 0, 0)
print3DMaze(maze3D, W, H, D, 0, 0, 0)
