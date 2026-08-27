function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_green_border" end

function p.__main()
    set_default_block("block_xar_minigun_flower_air_1")
    create_rect("block_xar_minigun_flower_fruit", 0,0,0, 0,15,0)
    create_rect("block_xar_minigun_flower_fruit", 15,15,1, 15,15,15)
    create_rect("block_xar_minigun_flower_fruit", 1,0,15, 15,0,15)
    create_rect("block_xar_minigun_flower_fruit", 1,0,0, 15,0,0)
    create_rect("block_xar_minigun_flower_fruit", 15,1,15, 15,14,15)
    create_rect("block_xar_minigun_flower_fruit", 15,1,0, 15,14,0)
    create_rect("block_xar_minigun_flower_fruit", 15,0,1, 15,0,14)
    create_rect("block_xar_minigun_flower_fruit", 0,0,1, 0,0,15)
    create_rect("block_xar_minigun_flower_fruit", 1,15,0, 15,15,0)
    create_rect("block_xar_minigun_flower_fruit", 1,15,15, 14,15,15)
    create_rect("block_xar_minigun_flower_fruit", 0,15,1, 0,15,15)
    create_rect("block_xar_minigun_flower_fruit", 0,1,15, 0,14,15)
			if randi(1,160) == 1 then
				for ratHorde = 0,randi(6,10) do
					add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_rat_lesser")
				end
			end
			if randi(1,640) == 1 then
				add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_sliver")
			end
			if randi(1,4096) == 1 then
				add_ment(randi(0,15),randi(0,15),randi(0,15),"ment_monster_flowery")
			end
end
