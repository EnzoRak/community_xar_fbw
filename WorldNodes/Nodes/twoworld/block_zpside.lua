function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_red_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_rect("block_zpside",0,0,0,15,15,0)
    srand(seed_xy())
    if(randf()<0.1) then
        create_rect("XAR_SOLID_BORING_CONCRETE_RED_BORDER",6,6,0,8,8,0)
        set_pos(7,7,0,"XAR_STOPPER_PLANE_Z")
    end
end