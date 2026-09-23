function p.__get_is_solid() return false end
function p.__get_tex() return "water" end
function p.__get_is_solid_visibly() return false end
function p.__get_is_solid_visibly_water() return true end
function p.__get_is_partially_transparent() return true end

p.water = true

function p.__main()
    set_default_block("i3v2_ocean")
    if randi(1,4) == 1 then
        add_bent(randi(0,15),randi(0,15),randi(1,15),"bent_base_ring_green")
    end
    create_rect("i3v2_coral", 0,0,0, 15,15,0)
    if get_input_adj_bt(0,0,-1):sub(7,17) == "i3v2_coral_" then
        set_pos(7,7,0, "i3v2_ocean")
    end
    --add_bent_s(7,7,7,"bent_base_txt","test to differentiate this from other blocks :P")
    for i=1,4 do
        local o = randi(4,5)
        local d = randi(7,9)
        local x = randi(1,14)
        local y = randi(1,14)
        local r = randi(0,3)
        local c = "i3v2_coral_fill"..randi(0,2)

        create_rect(c, x,y,0, x,y,o)
        if r/2<1 then
            create_rect(c, x+2*((r%2)-.5),y,o, x+2*((r%2)-.5),y,d)
            if randi(1,4)==1 then
                set_pos(x+4*((r%2)-.5),y,o, c)
            end
            x = x+2*((r%2)-.5)
        else
            create_rect(c, x,y+2*((r%2)-.5),o, x,y+2*((r%2)-.5),d)
            if randi(1,4)==1 then
                set_pos(x,y+4*((r%2)-.5),o, c)
            end
            y = y+2*((r%2)-.5)
        end

        if randi(1,20) == 1 then
            set_pos(x,y,d,"XAR_SOLID_BORING_EXPANDER")
            set_pos(x,y,d+1,"ascend_ocean")
        end
    end

    for x=0,15 do
        for y=0,15 do
            for z=15,3,-1 do
                --print(get_pos(x,y,z-1):sub(0,19))
                if get_pos(x,y,z) == "block_i3v2_ocean" and get_pos(x,y,z-1) ~= "block_i3v2_ocean" and get_pos(x,y,z-1) ~= "block_ascend_ocean" then
                    set_pos(x,y,z, "i3v2_coral")
                end
            end
        end
    end
end