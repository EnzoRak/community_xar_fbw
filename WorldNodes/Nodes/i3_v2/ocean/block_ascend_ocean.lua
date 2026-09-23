function p.__get_is_solid() return false end
function p.__get_tex() return "water" end
function p.__get_is_solid_visibly() return false end
function p.__get_is_solid_visibly_water() return true end
function p.__get_is_partially_transparent() return true end

p.water = true

function p.__main()
    set_default_block("i3v2_ocean")
    add_bent(7,7,7,"bent_base_ring_red")
end