function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("infinity_database_space_inner")
    local x,y,z = randi(1,14),randi(1,14),randi(1,14)
    set_pos(x,y,z,"XAR_SOLID_BORING_EXPANDER")
    set_pos(x,y,z+1,"XAR_ASCEND_SIMPLE")
    if randi(1,10) == 1 then
        add_bent(randi(1,15),randi(1,15),randi(1,15),"bent_base_ring_green")
    end
end