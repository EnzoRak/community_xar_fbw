function p.entrance(val)
    add_bent_s(8,8,14,"bent_base_txt","This is the entrance to ^x00ff00I" .. val .. "^!.")
    local s = val%1
    if s == 0 then
        set_default_block("XAR_EMPTY_BORING")
        create_rect("XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER",8,8,0,8,8,4)
        create_rect("XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER",6,8,5,10,8,5)
        create_rect("XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER",8,6,5,8,10,5)
        set_pos(8,8,5,"XAR_EMPTY_BORING")
        set_pos(8,6,6,"XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER")
        set_pos(8,10,6,"XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER")
        set_pos(6,8,6,"XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER")
        set_pos(10,8,6,"XAR_SOLID_BORING_DARK_CONCRETE_GREEN_BORDER")
        set_pos(8,8,7,"infx_room")
        block_set_i(8,8,7,"val",val)
    end
end
function p.room(val)
    set_default_block("XAR_EMPTY_BORING")
end