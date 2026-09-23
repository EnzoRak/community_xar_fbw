p.char_w = 0.01
p.char_h = 0.02
local _ga_win_set_char_size = ga_win_set_char_size
function ga_win_set_char_size(wid, cw, ch)
    p.char_w = cw
    p.char_h = ch
    _ga_win_set_char_size(wid, cw, ch)
end

local function render_quad(wid, x1,y1, x2,y2, x3,y3, x4,y4, u1,v1, u2,v2, u3,v3, u4,v4, tex)
    ga_win_triangle(wid, std.vec(x1,y1,0), std.vec(x3,y3,0), std.vec(x2,y2,0), u1,v1, u3,v3, u2,v2, tex)
    ga_win_triangle(wid, std.vec(x2,y2,0), std.vec(x3,y3,0), std.vec(x4,y4,0), u2,v2, u3,v3, u4,v4, tex)
end
function p.txt_italic(wid, x, y, txt)
    ga_render_color(std.vec(0,0.5,0.5))
    for i = 1,#txt do
        local x1 = x+(i-1)*p.char_w
        local x2 = x+i*p.char_w
        local tex = "font_char_ascii_" .. string.byte(txt:sub(i,i))
        render_quad(wid, x1,y, x2,y, x1+p.char_w*.3,y+p.char_h, x2+p.char_w*.3,y+p.char_h, 0,0, 1,0, 0,1, 1,1, tex)
    end
end