function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_GROUP_3_PATCH_TREES_ABOVE")
    local q = {}
    for x=0,15 do
        for y=0,15 do
            for z = 0,14 do
                if get_pos(x,y,z+1) == "XAR_MAHOGANY_BRANCH" then
                    q[#q+1] = {x,y,z}
                end
            end
        end
    end
    if randi(1,100) == 1 and #q ~= 0 then
        local pos = q[randi(1,#q)]
        set_pos(pos[1],pos[2],pos[3],"block_infinity_database_container")
    end
end