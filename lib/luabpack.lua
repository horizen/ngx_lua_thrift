local ffi = require "ffi"
local bit = require "bit"

local strbyte = string.byte
local strchar = string.char

local band = bit.band
local bor = bit.bor
local lshift = bit.lshift
local rshift = bit.rshift

ffi.cdef[[
    void pack_long(char*buf, int64_t n);
    void pack_double(char*buf, double n);
    double unpack_double(char*buf);
]]

--local packutil = ffi.load(ngx.config.prefix() .. "lib/libpackutil.so")
local packutil = ffi.load("/home/yw/softinstall/openresty/nginx/thrift/lib/libpackutil.so")

local ok, new_tab = pcall(require, "table.new");
if not ok then
    new_tab = function(narr, nrec) return {} end
end

local _M = new_tab(0, 19);

local function get_byte2(data, i)
    local a, b = strbyte(data, i, i + 1)
    return bor(lshift(a, 8), b), i + 2
end

local function get_byte3(data, i)
    local a, b, c = strbyte(data, i, i + 2)
    return bor(c, lshift(b, 8), lshift(a, 16)), i + 3
end

local function get_byte4(data, i)
    local a, b, c, d = strbyte(data, i, i + 3)
    return bor(d, lshift(c, 8), lshift(b, 16), lshift(a, 24)), i + 4
end

local function get_byte8(data, i)
    local a, b, c, d, e, f, g, h = strbyte(data, i, i + 7)

    -- XXX workaround for the lack of 64-bit support in bitop:
    local lo = bor(h, lshift(g, 8), lshift(g, 16), lshift(e, 24))
    local hi = bor(d, lshift(c, 8), lshift(b, 16), lshift(a, 24))
    return lo + hi * 4294967296, i + 8
end

local function get_double(data, i)
    local buf = ffi.new("char[8]", {strbyte(data, 1, 8)});
    return packutil.unpack_double(buf), i + 8;
end

local function set_byte2(n)
    return strchar(band(rshift(n, 8), 0xff), band(n, 0xff))
end

local function set_byte3(n)
    return strchar( band(rshift(n, 16), 0xff),
    			    band(rshift(n, 8), 0xff),
    			    band(n, 0xff)
                   )
end

local function set_byte4(n)
    return strchar(band(rshift(n, 24), 0xff),
    			   band(rshift(n, 16), 0xff),
    			   band(rshift(n, 8), 0xff),
    			   band(n, 0xff)
                   )
end

local function set_byte8(n)
    local buf = ffi.new("char[8]");
    packutil.pack_long(buf, n);
    return ffi.string(buf, 8);
end

local function set_double(n)
    local buf = ffi.new("char[8]");
    packutil.pack_double(buf, n);
    return ffi.string(buf, 8);
end

local packmap = {
    c = strchar,
    s = set_byte2,
    i = set_byte4,
    l = set_byte8,
    d = set_double
}

local unpackmap = {
    c = strbyte,
    s = get_byte2,
    i = get_byte4,
    l = get_byte8,
    d = get_double
}

function _M.bpack(type, val)
    return packmap[type](val)
end

function _M.bunpack(type, val)
    return unpackmap[type](val, 1)
end

--local buf =_M.bpack('d', 40.23023)
--print(_M.bunpack('d', buf))

return _M
