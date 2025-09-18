-- i thought about using blue ring for this but then i realized i needed to set terminal and down and up and all that typeof stuff, realized this was much simpler, even thinking about it. so I decided to make teleporter blocks instead that teleport when you interact with them.

--maybe blue ring can be used to enter and pink ring can be used to leave. Or, I can just build a tunnel and such in the entrance layer. 
function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
end


function p.__type_init(id)
    --String with length (2x-1)(2y-1)(2z-1)w
    ia_block_new_var_s(id, "maze_encoded", "")
    --should be 0, or one more than room_w_depth (set by the maze_room_block)
    ia_block_new_var_i(id, "maze_w_depth", 0)
end
