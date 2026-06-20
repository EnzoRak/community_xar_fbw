function p.__get_is_solid() return false end
function p.__get_tex() return "" end

local selec = 0
local function r() -- good enough
    selec = selec + get_sys_time()
    selec = selec * 2631278361
    selec = selec % 10000000
    return selec/10000000
end

function p.__main()
    set_default_block("e")
    add_bent_s(7,7,9,"bent_base_txt","These blocks will change every time you unload and load the chunk.")
    local blocks = {
        "SOLID_BORING"
        ,"SOLID_BORING_CONCRETE_BLUE_BORDER"
        ,"SOLID_BORING_CONCRETE_BLUE_X"
        ,"SOLID_BORING_CONCRETE_BROWN_BORDER"
        ,"SOLID_BORING_CONCRETE_BROWN_ORANGE_BORDER"
        ,"SOLID_BORING_CONCRETE_BROWN_RED_BORDER"
        ,"SOLID_BORING_CONCRETE_CHECKER_BLUE"
        ,"SOLID_BORING_CONCRETE_CHECKER_BLUE_RED"
        ,"SOLID_BORING_CONCRETE_CHECKER_BLUE_YELLOW"
        ,"SOLID_BORING_CONCRETE_CHECKER_BROWN"
        ,"SOLID_BORING_CONCRETE_CHECKER_DARK"
        ,"SOLID_BORING_CONCRETE_CHECKER_GREEN"
        ,"SOLID_BORING_CONCRETE_CHECKER_RED"
        ,"SOLID_BORING_CONCRETE_CHECKER_YELLOW"
        ,"SOLID_BORING_CONCRETE_DARK_DOT"
        ,"SOLID_BORING_CONCRETE_ORANGE_BORDER"
        ,"SOLID_BORING_CONCRETE_ORANGE_DIAG"
        ,"SOLID_BORING_CONCRETE_ORANGE_X"
        ,"SOLID_BORING_CONCRETE_PURPLE_BORDER"
        ,"SOLID_BORING_CONCRETE_PURPLE_X"
        ,"SOLID_BORING_CONCRETE_RED_BORDER"
        ,"SOLID_BORING_CONCRETE_RED_X"
        ,"SOLID_BORING_CONCRETE_WHITE_BORDER"
        ,"SOLID_BORING_CONCRETE_WHITE_X"
        ,"SOLID_BORING_CONCRETE_YELLOW_BORDER"
        ,"SOLID_BORING_CONCRETE_YELLOW_X"
        ,"SOLID_BORING_DARK_CONCRETE_BLUE_BORDER"
        ,"SOLID_BORING_DARK_CONCRETE_GREEN_BORDER"
        ,"SOLID_BORING_DARK_CONCRETE_ORANGE_BORDER"
        ,"SOLID_BORING_DARK_CONCRETE_PURPLE_BORDER"
        ,"SOLID_BORING_DARK_CONCRETE_RED_BORDER"
        ,"SOLID_BORING_DARK_GREEN_BORDER"
        ,"SOLID_BORING_DARK_GREEN_X"
    }
    set_pos(5,7,7,"XAR_"..blocks[math.floor(r()*(#blocks-1))+1])
    set_pos(6,7,7,"XAR_"..blocks[math.floor(r()*(#blocks-1))+1])
    set_pos(7,7,7,"XAR_"..blocks[math.floor(r()*(#blocks-1))+1])
    set_pos(8,7,7,"XAR_"..blocks[math.floor(r()*(#blocks-1))+1])
    set_pos(9,7,7,"XAR_"..blocks[math.floor(r()*(#blocks-1))+1])
end