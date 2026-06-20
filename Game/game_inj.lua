-- you can now ("str"):split("t")
function string.split(str, sep)
    local t = {}
    for s in (str .. sep):gmatch("(.-)" .. sep) do table.insert(t, s) end
    return t
end

function p.bind(func, null, ...)
    local binded = table.pack(...)
    return function(...)
        local args = {}
        local passed_args = table.pack(...)
        local j = 1
        for i = 1,binded.n do
            if binded[i] == null then
                args[i] = passed_args[j]
                j = j + 1
            else
                args[i] = binded[i]
            end
        end
        for i = j,passed_args.n do
            args[binded.n+i-j+1] = passed_args[i]
        end
        -- does even work correctly?
        return func(table.unpack(args))
    end
end