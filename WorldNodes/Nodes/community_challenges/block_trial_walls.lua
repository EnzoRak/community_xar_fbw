function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER")
    for s = 0,3 do
        local n = 15*s%2
        
        if randf() < 0.03 then
            local c = {0,0,randi(0,15)}
            local x = s//2
            c[x] = n
            c[2-x] = randi(0,15)

            set_pos(c[1],c[2],c[3],"trial_secret")
        end
    end
end