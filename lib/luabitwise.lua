local bit = require "bit"

local band, bor, bxor, bnot = bit.band, bit.bor, bit.bxor, bnot
local brshift, blshift = bit.rshift, bit.lshift

local _M = {}

function _M.l_not(val) 
    return bnot(val)
end

function _M.l_xor(val1, val2)
    return bxor(val1, val2)
end

function _M.l_and(val1, val2)
    return band(val1, val2)
end

function _M.l_or(val1, val2)
    return bor(val1, val2)
end

function _M.l_shiftr(val1, bit)
    return brshift(val1, bit)
end

function _M.l_shiftl(val1, bit)
    return blshift(val1, bit)
end

return _M
