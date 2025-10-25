function p.__get_is_solid() return true end
function p.__get_tex() return "block_bedroom" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    for i=0,3 do
        create_rect("XAR_SOLID_BORING_BLUE_BORDER",0,0,4*i+0,15,15,4*i+0)
        create_rect("block_znside",0,0,4*i+1,15,15,4*i+1)
        create_rect("block_zpside",0,0,4*i+2,15,15,4*i+2)
        create_rect("XAR_SOLID_BORING_CONCRETE_ORANGE_BORDER",0,0,4*i+3,15,15,4*i+3)
    end
    --[[
    create_rect("block_znside",0,0,7,15,15,7)
    create_rect("block_zpside",0,0,8,15,15,8)
    
    create_rect("block_znside",0,0,11,15,15,11)
    create_rect("block_zpside",0,0,12,15,15,12)

    create_rect("block_znside",0,0,3,15,15,3)
    create_rect("block_zpside",0,0,4,15,15,4)
    ]]--
end