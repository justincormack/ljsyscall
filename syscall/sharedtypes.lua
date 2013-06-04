-- this module defines the types with metatypes that are always common, so do not get errors redefining metatypes

local ffi = require "ffi"

local t, ctypes, pt, s = {}, {}, {}, {}

local h = require "syscall.helpers"

local ntohl, ntohl, ntohs, htons = h.ntohl, h.ntohl, h.ntohs, h.htons
local split, trim, strflag = h.split, h.trim, h.strflag

local function ptt(tp)
  local ptp = ffi.typeof(tp .. " *")
  return function(x) return ffi.cast(ptp, x) end
end

local function addtype(name, tp, mt)
  t[name] = ffi.metatype(tp, mt)
  ctypes[tp] = t[name]
  pt[name] = ptt(tp)
  s[name] = ffi.sizeof(t[name])
end

local function addtype_var(name, tp, mt)
  t[name] = ffi.metatype(tp, mt)
  pt[name] = ptt(tp)
end

local function lenfn(tp) return ffi.sizeof(tp) end

local lenmt = {__len = lenfn}

local mt = {}

local function istype(tp, x)
  if ffi.istype(tp, x) then return x else return false end
end

addtype("iovec", "struct iovec", lenmt)

mt.iovecs = {
  __index = function(io, k)
    return io.iov[k - 1]
  end,
  __newindex = function(io, k, v)
    v = istype(t.iovec, v) or t.iovec(v)
    ffi.copy(io.iov[k - 1], v, s.iovec)
  end,
  __len = function(io) return io.count end,
  __tostring = function(io)
    local s = {}
    for i=1, io.count do
      local iovec = io.iov[i-1]
      s[i] = ffi.string(iovec.iov_base, iovec.iov_len)
    end
    return table.concat(s)
  end;
  __new = function(tp, is)
    if type(is) == 'number' then return ffi.new(tp, is, is) end
    local count = #is
    local iov = ffi.new(tp, count, count)
    for n = 1, count do
      local i = is[n]
      if type(i) == 'string' then
        local buf = t.buffer(#i)
        ffi.copy(buf, i, #i)
        iov[n].iov_base = buf
        iov[n].iov_len = #i
      elseif type(i) == 'number' then
        iov[n].iov_base = t.buffer(i)
        iov[n].iov_len = i
      elseif ffi.istype(t.iovec, i) then
        ffi.copy(iov[n], i, s.iovec)
      elseif type(i) == 'cdata' then -- eg buffer or other structure
        iov[n].iov_base = i
        iov[n].iov_len = ffi.sizeof(i)
      else -- eg table
        iov[n] = i
      end
    end
    return iov
  end
}

addtype_var("iovecs", "struct { int count; struct iovec iov[?];}", mt.iovecs)

-- convert strings to inet addresses and the reverse
local function inet4_ntop(src)
  local b = pt.uchar(src)
  return b[0] .. "." .. b[1] .. "." .. b[2] .. "." .. b[3]
end

local function inet6_ntop(src)
  local a = src.s6_addr
  local parts = {256*a[0] + a[1], 256*a[2] + a[3],   256*a[4] + a[5],   256*a[6] + a[7],
                 256*a[8] + a[9], 256*a[10] + a[11], 256*a[12] + a[13], 256*a[14] + a[15]}

  for i = 1, #parts do parts[i] = string.format("%x", parts[i]) end

  local start, max = 0, 0
  for i = 1, #parts do
    if parts[i] == "0" then
      local count = 0
      for j = i, #parts do
        if parts[j] == "0" then count = count + 1 else break end
      end
      if count > max then max, start = count, i end
    end
  end

  if max > 2 then
    parts[start] = ""
    if start == 1 or start + max == 9 then parts[start] = ":" end
    if start == 1 and start + max == 9 then parts[start] = "::" end 
    for i = 1, max - 1 do table.remove(parts, start + 1) end
  end

  return table.concat(parts, ":")
end

local function inet4_pton(src, addr)
  local ip4 = split("%.", src)
  if #ip4 ~= 4 then return nil end
  addr = addr or t.in_addr()
  addr.s_addr = ip4[4] * 0x1000000 + ip4[3] * 0x10000 + ip4[2] * 0x100 + ip4[1]
  return addr
end

local function hex(str) return tonumber("0x" .. str) end

local function inet6_pton(src, addr)
  -- TODO allow form with decimals at end
  local ip8 = split(":", src)
  if #ip8 > 8 then return nil end
  local before, after = src:find("::")
  before, after = src:sub(1, before - 1), src:sub(after + 1)
  if before then
    if #ip8 == 8 then return nil end -- must be some missing
    if before == "" then before = "0" end
    if after == "" then after = "0" end
    src = before .. ":" .. string.rep("0:", 8 - #ip8 + 1) .. after
    ip8 = split(":", src)
  end
  for i = 1, 8 do
    addr.s6_addr[i * 2 - 1] = hex(ip8[i]) % 256
    addr.s6_addr[i * 2 - 2] = math.floor(hex(ip8[i]) / 256)
  end
  return addr
end

local inaddr = strflag {
  ANY = "0.0.0.0",
  LOOPBACK = "127.0.0.1",
  BROADCAST = "255.255.255.255",
}

local in6addr = strflag {
  ANY = "::",
  LOOPBACK = "::1",
}

addtype("in_addr", "struct in_addr", {
  __tostring = inet4_ntop,
  __new = function(tp, s)
    local addr = ffi.new(tp)
    if s then
      if ffi.istype(tp, s) then
        addr.s_addr = s.s_addr
      else
        if inaddr[s] then s = inaddr[s] end
        addr = inet4_pton(s, addr)
        if not addr then return nil end
      end
    end
    return addr
  end,
  __len = lenfn,
})

addtype("in6_addr", "struct in6_addr", {
  __tostring = inet6_ntop,
  __new = function(tp, s)
    local addr = ffi.new(tp)
    if s then
      if in6addr[s] then s = in6addr[s] end
      addr = inet6_pton(s, addr)
    end
    return addr
  end,
  __len = lenfn,
})

return {t = t, pt = pt, s = s, ctypes = ctypes}

