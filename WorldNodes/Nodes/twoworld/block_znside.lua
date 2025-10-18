function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_yellow_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("block_znside",0,0,15,15,15,15)
    srand(seed_xy())
    if(randf()<0.1) then
        create_rect("XAR_SOLID_BORING_CONCRETE_YELLOW_BORDER",6,6,15,8,8,15)
        set_pos(7,7,15,"XAR_STOPPER_PLANE_Z")
    end
end