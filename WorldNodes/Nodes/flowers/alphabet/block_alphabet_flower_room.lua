function p.__get_is_solid() return true end
function p.__get_tex() return "block_letter_x" end

function p.__main()
    srand(seed_normal())
    set_default_block("XAR_SOLID_BORING")
    create_rect("XAR_EMPTY_BORING",1,1,1,14,14,14)
    for x = 0,15 do
        for y = 0,15 do
            for z = 0,15 do
                if (x == 0 or x == 15) or (y == 0 or y == 15) or (z == 0 or z == 15) then
                    set_pos(x,y,z,"XAR_SOLID_BORING_LETTER_" .. string.char(randi(65,90)))
                end
            end
        end
    end
    create_rect("XAR_EMPTY_BORING",0,0,13,15,15,14)
    create_rect("XAR_ASCEND_SIMPLE",0,0,14,15,15,14)
    create_rect("XAR_EMPTY_BORING",0,1,14,15,14,14)
    create_rect("XAR_EMPTY_BORING",1,0,14,14,15,14)
    create_rect("XAR_STOPPER",1,1,13,14,14,14)
    create_rect("XAR_EMPTY_BORING",2,2,1,13,13,14)
    set_pos(1,1,14,"XAR_SOLID_BORING_EXPANDER")
    set_pos(1,14,14,"XAR_SOLID_BORING_EXPANDER")
    set_pos(14,1,14,"XAR_SOLID_BORING_EXPANDER")
    set_pos(14,14,14,"XAR_SOLID_BORING_EXPANDER")
    add_bent(7,0,14,"bent_base_ring_green")
    add_bent(7,15,14,"bent_base_ring_green")
    add_bent(0,7,14,"bent_base_ring_green")
    add_bent(15,7,14,"bent_base_ring_green")
    create_rect("XAR_SOLID_BORING",1,1,12,14,14,12)
    create_rect("alphabet_flower_maze_surround",6,6,12,8,8,12)
    set_pos(7,7,12,"alphabet_flower_maze")
    set_pos(7,7,13,"alphabet_flower_info")
    create_rect("XAR_SOLID_BORING",6,6,11,8,8,11)
    set_pos(7,7,11,"alphabet_flower_floor_antiplug")
    local code = string.char(randi(65,90))..string.char(randi(65,90))..string.char(randi(65,90))..string.char(randi(65,90))..string.char(randi(65,90))..string.char(randi(65,90))
    chunk_set_s("code", code)
    add_bent_s(7,7,8,"bent_code_input",code)
    add_bent_s(7,7,6,"bent_base_txt","This is where you input your code at the very start of the maze.")
    create_rect("XAR_DOOR",1,1,3,14,14,3)
    set_pos(7,7,1,"alphabet_flower_treasure")
    add_bent(7,7,2,"bent_base_ring_green")
end

function p.__type_init(id)
    ia_block_new_var_s(id, "code", "")
end
