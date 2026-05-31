function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_green_border" end

function p.__main()
    set_default_block("infinity_database_space_inner")
    std.create_edges("XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER")
    if randi(1,2) == 1 then
        set_pos(7,7,6,"XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER")
        local i = randi(0,3)
        if i == 0 then
            set_pos(7,7,7,"XAR_INFINITY_FLOWER")
        elseif i == 1 then
            set_pos(7,7,7,"XAR_WILLISTON_MEGA")
        elseif i == 2 then
            set_pos(7,7,7,"XAR_FANATIC_LATTICE")
        elseif i == 3 then
            set_pos(7,7,7,"XAR_DANDELIONS")
            set_pos(7,7,8,"XAR_DANDELION_ABOVE")
        end
    elseif randi(1,10) == 1 then
        create_rect("XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER",5,7,6,10,7,6)
        for x = 5,10 do
            local i = randi(0,5)
            if i == 0 then
                set_pos(x,7,7,"XAR_INFINITY_FLOWER")
            elseif i == 1 then
                set_pos(x,7,7,"XAR_WILLISTON_MEGA")
            elseif i == 2 then
                set_pos(x,7,7,"XAR_FANATIC_LATTICE")
            elseif i == 3 then
                set_pos(x,7,7,"XAR_DANDELIONS")
                set_pos(x,7,8,"XAR_DANDELION_ABOVE")
            elseif i == 4 then
                set_pos(x,7,7,"infinity_database_pillar")
            elseif i == 5 then
                set_pos(x,7,7,"XAR_YING_FOREST")
            end
        end
    end
end