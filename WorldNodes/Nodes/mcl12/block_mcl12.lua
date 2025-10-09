function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_orange_border" end

function p.__main()
    set_default_block("XAR_SOLID_BORING_CONCRETE_ORANGE_BORDER")

    caves_start()
    caves_set_5x5x5()
    caves_set_num_nodes(2.0,3.99)
    caves_set_nodes(0.1, 3.0,4.3, 17.5,18.0)
    caves_set_edges(20.0, 0.0, 1.0,2.0, 7.0,8.0)
    caves_end()
    base_blue_tele.set_blue_type_terminal(7,7,7)
    for x = 0,15 do
        for y = 0,15 do
            for z = 0,15 do
                local close = caves_close_to_node(x,y,z)
                or caves_close_to_edge(x,y,z)
                if close then
                    set_pos(x,y,z,"XAR_EMPTY_BORING")
                    if randi(1,5000) == 1 then
                        add_ment(x,y,z,"ment_chewing_gum")
                    end
                    if randi(1,50000) == 1 then
                        ment_start(7,7,7,"ment_monster_lamprey_yellow")
                        ment_set_f("__radius",12.0)
                        ment_set_s("identity_str","Big Yellow Lamprey")
                        ment_end()
                    end
                end
            end
        end
    end
end
