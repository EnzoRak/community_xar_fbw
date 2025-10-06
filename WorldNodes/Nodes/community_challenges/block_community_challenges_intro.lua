function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    add_bent_s(7,7,7,"bent_base_txt","Welcome to the community challenges!\n\n^x00FF00List of Challenges:^!\n\n1. ^xFF00FFPink Key^! Challenge\n2. ^xFF0000R^!^x00FF00i^!^x0000FFn^!^xFF00FFg^! Maze (Incomplete)\n3. Pool Balls Challenge\n4. 7x7x7x7 4 Dimensional Maze\n5. Ascend ^xFFFF00Yellow Rings ^!Challenge")
    --Note: no waypoint here, because every challenge can have its own one.
end
