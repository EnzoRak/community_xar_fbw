-- you can now ("str"):split("t")
function string.split(str, sep)
    local t = {}
    for s in (str .. sep):gmatch("(.-)" .. sep) do table.insert(t, s) end
    return t
end