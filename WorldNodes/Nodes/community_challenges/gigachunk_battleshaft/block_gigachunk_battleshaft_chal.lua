function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("grow_air")
    add_bent_s(7,7,9,"bent_base_txt","^xFF00FFGigachunk Battle Shaft^!\n\nA Battle Shaft that is a gigachunk long. There is treasure every megachunk.")
    add_bent_s(7,7,7,"bent_base_txt","Treasure:\n1. Nothing\n2. Nothing\n3. Nothing\n4. Nothing\n5. Nothing\n6. Nothing\n7. Nothing\n8. Nothing\n9. Nothing\n10. Nothing\n11. Nothing\n12. Nothing\n13. Nothing\n14. Nothing\n15. Nothing\n16. Nothing")
    add_bent(8,7,5, "bent_base_ring_green")
    set_pos(8,7,5, "gigachunk_battleshaft_shrink_giga")
    set_pos(7,7,5, "gigachunk_battleshaft_giga")
    create_rect("XAR_ANTI_PLUG_GLASS_HINT", 15,0,0, 15,15,15) -- for saftey
end