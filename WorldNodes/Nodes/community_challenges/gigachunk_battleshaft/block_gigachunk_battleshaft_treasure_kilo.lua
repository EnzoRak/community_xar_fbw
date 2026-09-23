function p.__get_is_solid() return true end
function p.__get_tex() return "block_dark_concrete_orange_border" end

function p.__main()
    set_default_block("grow_air")
    local level = get_level()
    local my_x = get_input_path()[level-2].x
    local treasurenum = 16-my_x
    create_rect("XAR_STOPPER",0,6,6,0,8,8)
    create_rect("XAR_STOPPER",15,6,6,15,8,8)

    add_bent_s(7,7,14, "bent_base_waypoint", "Gigachunk Battleshaft Treasure #" .. treasurenum)
    add_bent(1,7,7, "bent_base_ring_green")
    if treasurenum == 1 then
        -- nothing
    elseif treasurenum == 2 then
        -- nothing
    end
end