--The process I am going for: adds a bent that checks a global variable, then changes it's text, then adds a text bent in its place, otherwise, it will bea teleporter to look for the random ying flower. 

--idea by gamewizard13 (AMI-382)
--I also want to make a bent that basically I don't have to change inside, I just pass all the commands into a string argument and it'll just "do its thing", as in using the eval().

--I also plant to add a sad lands if in hell flower....
function p.__get_is_solid() return true end
function p.__get_tex() return "block_deco1_blue1" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    create_xar_chunk("XAR_HAPPY_LAND_START_ROOM")
    ment_start(1,1,1,"ment_evaluator")
    ment_set_s("on_use",[[
        ga_window_push("win_random_ying_flower")
    ]])
    ment_end()
end
