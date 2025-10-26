-- NEGATIVES ARE **NOT** SUPPORTED

-- key
-- number = slog (condition)
-- n = n-1 (n < 1)
-- n = log(n) (n < 10)
-- 10^n = 1+log(n) (1 < n and n < 10)
-- AeB = 1+log(B+log(A)) (1 < B and B < 10)
-- 10^10^n = 2+log(n) (1 < n and n < 10)
-- eAeB = 2+log(B+log(A)) (1 < B and B < 10)
-- 10^^n = n (true)

local epsilon = 1e-9

local log,floor = math.log10,math.floor

local function digits(n, d)
    return floor((n+epsilon)*10^d)/10^d
end
local function abb(l, d)
    local abbs = {"K","M","B","T","Qd","Qn","Sx","Sp","Oc","De"}
    if l > #abbs*3+3 then
        return digits(10^(l%1), d) .. "e" .. floor(l)
    end
    return digits(10^(l%3), d) .. (abbs[floor(l/3)] or "")
end

function p.tostring(slog)
    if slog < 0 then
        return tostring(digits(slog+1, 2))
    elseif slog < 1 then
        return tostring(digits(10^slog, 2))
    elseif slog < 1 + log(3) then
        return tostring(digits(10^10^(slog-1), 2))
    elseif slog < 1 + log(6) then
        return tostring(floor(10^10^(slog-1)+epsilon))
    elseif slog < 2 then
        return abb(10^(slog-1)+epsilon, 2)
    elseif slog < 2 + log(6) then
        return abb(10^10^(slog-2)+epsilon, 2)
    end
    for i = 1,5 do -- up to 5 e's
        if slog < 2+i then
            return ("e"):rep(i) .. abb(10^(slog-i-1)+epsilon, 2)
        elseif slog < 2+i + log(6) then
            return ("e"):rep(i) .. abb(10^10^(slog-i-2)+epsilon, 2)
        end
    end
    if slog < 1e6 then
        return 10^(slog%1) .. "F" .. floor(slog)
    end
    return "F" .. abb(slog, 2)
end

function p.add(a, b)
    if b > a then return p.add(b, a) end
    local A = floor(a)
    local B = floor(b)
    if A == -1 then
        local out = a + b + 1
        if out > 0 then out = log(1+out) end
        return out
    end
    if A == 0 then
        if B == -1 then
            local out = log(10^a + b + 1)
            if out > 1 then out = 1+log(out) end
            return out
        end
        local out = log(10^a + 10^b)
        if out > 1 then out = 1+log(out) end
        return out
    end
    if A == 1 then
        if B == -1 then
            local out = 1+log(log(10^10^(a-1)+b+1))
            if out > 2 then out = 2+log(out-1) end
            return out
        elseif B == 0 then
            local out = 1+log(log(10^10^(a-1)+10^b))
            if out > 2 then out = 2+log(out-1) end
            return out
        end
        local out = 1+log(log(10^10^(a-1)+10^10^(b-1)))
        if out > 2 then out = 2+log(out-1) end
        return out
    end
    if A == 2 then
        if B < 1 then
            return a
        elseif B == 1 then
            local out = 2+log(log(10^10^(a-2)+log(1+10^(10^(b-1)-10^10^(a-2)))))
            if out > 3 then out = 3+log(out-2) end
            return out
        end
        local out = 2+log(log(10^10^(a-2)+log(1+10^(10^10^(b-2)-10^10^(a-2)))))
        if out > 3 then out = 3+log(out-2) end
        return out
    end
    return a
end
function p.sub(a, b)
    if b >= a then return -1 end
    if a >= 3 then return a end
    -- this approach is stupid!
    local guesser = -1
    local adder = 4
    for i = 1,30 do
        adder = adder/2
        guesser = guesser + adder
        if p.add(b, guesser) > a then guesser = guesser - adder end
    end
    if guesser == -1 then
        guesser = guesser + adder
    end
    return guesser
end

function p.mul(a, b)
    if b > a then return p.mul(b, a) end
    if floor(a) > 3 then return a end
    if b > 0 then return p.add(a-1, b-1)+1 end
    if a > 0 then
        local r = log(1 / (1 + b))
        if r > 1 then
            r = 1 + log(r)
        end
        if r > 2 then
            r = 2 + log(r-1)
        end
        if r-1 > a-1 then
            local out = p.sub(r-1,a-1)+1
            if out < 1 then return 1/10^out-1 end
            if out < 2 then return 1/10^10^(out-1)-1 end
            return 1/10^10^10^(out-2)-1
        end
        return p.sub(a-1,r-1)+1
    end
    return (a+1)*(b+1)-1
end
function p.div(a, b)
    if floor(a) > 3 then return b>a and -1 or a end
    if b > 0 then
        if b > a then
            local out = p.sub(b-1,a-1)+1
            if out < 1 then return 1/10^out-1 end
            if out < 2 then return 1/10^10^(out-1)-1 end
            return 1/10^10^10^(out-2)-1
        end
        return p.sub(a-1,b-1)+1
    end
    if a > 0 then
        local r = log(1 / (1 + b))
        if r > 1 then
            r = 1 + log(r)
        end
        if r > 2 then
            r = 2 + log(r-1)
        end
        return p.add(a-1,r-1)+1
    end
    local r = log((a+1)/(b+1)-1)
    if r > 0 then
        r = log(r+1)
    end
    if r > 1 then
        r = 1 + log(r)
    end
    if r > 2 then
        r = 2 + log(r-1)
    end
    return r
end

function p.pow(a, b)
    if a < -1 then return -1 end
    if a < 0 then return p.div(0, p.pow(p.fromnumber(1/1+a), b)) end
    return p.mul(a-1,b)+1
end
function p.root(a, b)
    return p.div(a-1, b)+1
end

function p.fromnumber(n)
    if n < 1 then
        return n-1
    elseif n < 10 then
        return log(n)
    elseif n < 1e10 then
        return log(log(n))+1
    end
    return log(log(log(n)))+2
end
function p.tonumber(slog)
    if slog < 0 then
        return slog+1
    elseif slog < 1 then
        return 10^slog
    elseif slog < 2 then
        return 10^10^(slog-1)
    end
    return 10^10^10^(slog-2)
end

function p.tetr(a, b, bnormal)
    if a == 0 then return 0 end
    if not bnormal then return p.tetr(a, p.tonumber(b), true) end
    local h = floor(b)
    local out = p.pow(a, b%1-1)
    if a > log(math.exp(math.exp(-1))) then
        local last = out
        while not (h < 1 or (out - last) == 1) do
            last = out
            out = p.pow(a, out)
            h = h - 1
        end
        return out+h
    end
    for i = 1,math.min(20,h) do
        out = p.pow(a, out)
    end
    return out
end