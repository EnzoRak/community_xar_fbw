function p.__get_is_solid() return true end
function p.__get_tex() return "block_key_yellow" end

function p.__main()
    set_default_block("XAR_EMPTY_BORING")
    std.create_edges("ywkey_reqkey")
    add_ment(7,7,7,"ment_key_guard_yellow")
end