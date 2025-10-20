function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_green_border" end

function p.__main()
    set_default_block("block_truecenter")
    local level = get_level()
    if( get_input_path_block_var_exists(level, "wallid", "i") ) then
        parentwallid = get_input_path_block_i(level, "wallid")
        if(parentwallid == 1) then
            create_rect("XAR_EMPTY_BORING",0,0,0,14,15,15)
            for y=0, 14 do
                for z=0, 14 do
                    block_set_i(15,y,z,"wallid", 1)
                end
            end
            return
        end
        if(parentwallid == 2) then
            create_rect("XAR_EMPTY_BORING",0,0,0,15,14,15)
            for x=0, 14 do
                for z=0, 14 do
                    block_set_i(x,15,z,"wallid", 2)
                end
            end
            return
        end
        if(parentwallid == 3) then
            create_rect("XAR_EMPTY_BORING",0,0,0,15,15,14)
            for x=0, 14 do
                for y=0, 14 do
                    block_set_i(x,y,15,"wallid", 3)
                end
            end
            return
        end
        if(parentwallid == 4) then
            create_rect("XAR_EMPTY_BORING",0,0,0,15,14,14)
            for x=0, 14 do
                for y=0, 14 do
                    block_set_i(x,y,15,"wallid", 3)
                end
            end
            for x=0, 14 do
                for z=0, 14 do
                    block_set_i(x,15,z,"wallid", 2)
                end
            end
            for x=0,14 do
                block_set_i(x,15,15,"wallid", 4)
            end
            return
        end
        if(parentwallid == 5) then
            create_rect("XAR_EMPTY_BORING",0,0,0,14,15,14)
            for x=0, 14 do
                for y=0, 14 do
                    block_set_i(x,y,15,"wallid", 3)
                end
            end
            for y=0, 14 do
                for z=0, 14 do
                    block_set_i(15,y,z,"wallid", 1)
                end
            end
            for y=0,14 do
                block_set_i(15,y,15,"wallid", 5)
            end
            return
        end
        if(parentwallid == 6) then
            create_rect("XAR_EMPTY_BORING",0,0,0,14,14,15)
            for y=0, 14 do
                for z=0, 14 do
                    block_set_i(15,y,z,"wallid", 1)
                end
            end
            for x=0, 14 do
                for z=0, 14 do
                    block_set_i(x,15,z,"wallid", 2)
                end
            end
            for z=0,14 do
                block_set_i(15,15,z,"wallid", 6)
            end
            return
        end
        if(parentwallid == 0) then
            for y=0, 14 do
                for z=0, 14 do
                    block_set_i(15,y,z,"wallid", 1)
                end
            end
            for x=0, 14 do
                for z=0, 14 do
                    block_set_i(x,15,z,"wallid", 2)
                end
            end
            for x=0, 14 do
                for y=0, 14 do
                    block_set_i(x,y,15,"wallid", 3)
                end
            end
            for x=0,14 do
                block_set_i(x,15,15,"wallid", 4)
            end
            for y=0,14 do
                block_set_i(15,y,15,"wallid", 5)
            end
            for z=0,14 do
                block_set_i(15,15,z,"wallid", 6)
            end
            block_set_i(15,15,15,"wallid", 0)
            create_rect("XAR_EMPTY_BORING",0,0,0,14,14,14)
        end
    end            
end


function p.__type_init(id)
    ia_block_new_var_i(id, "wallid", 0)
end
