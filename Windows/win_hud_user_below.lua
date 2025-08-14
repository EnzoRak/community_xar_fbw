-------------------------------------------------
--Table of function references.
-------------------------------------------------

local hud_table_initialized = false
local hud_table = {}

--Brute force ability to change the array:
function p.clear_hud_table() hud_table = {} end
function p.get_hud_table() return hud_table end
function p.set_hud_table(new_hud_table) hud_table = new_hud_table end

--Each function takes one argument: the wid.
--No two hud elements can have the same priority.
--The priority specifies the order it is rendered.
--Lowever priorities are rendered first.
function p.add_element(priority, func)
    local element = {}
    element.func = func
    hud_table[priority] = element
    -- table.insert(hud_table, priority, element) --Wrong.
end

function p.remove_element(priority)
    table.remove(hud_table, priority)
end

-------------------------------------------------
--Initializing the list.
-------------------------------------------------

function p.maybe_init_table()
    if hud_table_initialized then return end
    hud_table_initialized = true

    p.force_init_hud_table()
end

function p.force_init_hud_table()
    p.clear_hud_table()
    --p.add_element(-10, blinker_test.render)
end

-------------------------------------------------
--Window functions.
-------------------------------------------------

--Helper.
function p.txt_col(wid, col)
    ga_win_set_front_color(wid, col)
end

function p.interp_col(col1, col2, frac)
    local col = {x=0, y=0, z=0}
    col.x = (1.0 - frac)*col1.x + frac*col2.x
    col.y = (1.0 - frac)*col1.y + frac*col2.y
    col.z = (1.0 - frac)*col1.z + frac*col2.z
    return col
end

function p.__render(wid)
    if( ga_get_b("xar.hud.disable_hud") ) then return end

    p.maybe_init_table()

    --Calling all functions in the table (in order).
    local sorted_keys = {}
    for k,v in pairs(hud_table) do
        table.insert(sorted_keys, k)
    end
    table.sort(sorted_keys)
    for _,k in pairs(sorted_keys) do
        local v = hud_table[k]
        local func = v.func
        func(wid)
    end

end
