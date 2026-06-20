function p.__load_game_early()
    game_journal.reg_load_cb("cxar_english", p.load_game_cb)
end

function p.load_game_cb()
    p.main()
end

function p.main()
    game_journal_cxar_english_misc.main()
end