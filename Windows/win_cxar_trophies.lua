function p.__on_start(wid)
    local go_back_button_y = 0.02
    local w = 0.02
    local h = 0.04
    local go_back_msg = "Go Back (ESC)"
    ga_win_widget_go_back_button_start(
        wid, go_back_button_y, w, h, go_back_msg)
    p.check_trophies()
end

-- add_bent_s(7,7,14,"bent_cxar_trophy","example")
p.trophies = {};p.trophies_name = {} -- order CANNOT change
local function add(a,b)p.trophies[#p.trophies+1] = a;p.trophies_name[#p.trophies]=b end
add("example", "Example") -- change this example trophy!!

p.map = {} -- performance reasons.
for i = 1,#p.trophies do p.map[p.trophies[i]] = i end

local num_trophies = 0
local trophies_unlocked = {}

local scroll = 0

function p.check_trophies()
    num_trophies = 0
    local str = ga_get_s("community_xar_fbw.trophies")
    for i = 1,#p.trophies do
        if str:sub(i,i) == "1" then
            num_trophies = num_trophies + 1
            trophies_unlocked[i] = true
        end
    end
    if #str < #p.trophies then ga_set_s("community_xar_fbw.trophies", str .. ("0"):rep(#p.trophies - #str)) end
end

function p.__render(wid)
    local c = ga_win_get_cursor_pos(wid)
    ga_win_set_background(wid, std.vec(0.0, 0.0, 0.0), 0.95)
    local frac = num_trophies/#p.trophies
    ga_win_set_char_size(wid, 0.01, 0.02)
    ga_win_txt(wid, 0, 0.02, num_trophies .. "/" .. #p.trophies .. " (" .. math.floor(frac*1000)/10 .. "%)")
    ga_win_quad_color(wid, 0, 0, 1, 0.02, std.vec(0,0,0))
    ga_win_quad_color(wid, 0, 0, frac, 0.02, std.vec(0,1,0))
    -- todo add icon support
    for i = 1,#p.trophies do
        local x = ((i-1)%5)*0.2+0.1
        local y = 0.8-math.floor((i-1)/5)*0.2
        ga_win_quad(wid, x-0.065, y-0.08+scroll, x+0.065, y+0.08+scroll, trophies_unlocked[i] and "secret_trophy" or "trophy_do_not_have")
        if x-0.065 < c.x and c.x < x+0.065 and y-0.08+scroll < c.y and c.y < y+0.08+scroll then
            ga_win_txt(wid, c.x, c.y, trophies_unlocked[i] and p.trophies_name[i] or "???")
        end
    end
end

function p.__process_input(wid)
    if ga_win_widget_go_back_button_process_input(wid) then
        ga_window_pop()
        return
    end
    if ga_win_mouse_wheel_up(wid) then
        scroll = math.max(scroll - 0.05, 0)
    end
    if ga_win_mouse_wheel_down(wid) then
        scroll = scroll + 0.05
    end
end
