-- i thought about using blue ring for this but then i realized i needed to set terminal and down and up and all that typeof stuff, realized this was much simpler, even thinking about it. so I decided to do this instead. 
function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_blue" end

function p.__main()
    set_default_block("XAR_SOLID_BORING")
end

function p.__get_can_use(level, bp)
    return true
end

function p.__get_use_msg(level, bp)
    return "Teleport up to the lower level"
end

function p.__on_use(level, bp)
    --there should be a standard 4d maze layout, which should teleport to inside the maze, which should always be at 7,7,5
    --for now, at least, until a general solution is come up with. 
    --or, maybe the block should read a variable?
    local s = ga_bp_to_path(level, bp)
    s = s:sub(1, -5)
    local new_last4 = s:sub(-4)
    --775 is where we assume the maze is, 777 is the final offset in the chunk.
    local vec3 = ga_block_get_v(level,bp,"maze_pos")
    s = s .. "_" .. math.floor(vec3.x) .. math.floor(vec3.y) .. math.floor(vec3.z) .. new_last4
    ga_tele(s,std.vec(7,7,7))
end

function p.__on_use2(level, bp)
    if(p.__get_can_use(level,bp) == true) then
        p.__on_use(level, bp)
    end
end


function p.__type_init(id)
    --change with ga_block_set_v after setting the block to change the teleport destination based on where the maze is in the chunk.
    ia_block_new_var_v(id,"maze_pos",std.vec(7,7,5))
end