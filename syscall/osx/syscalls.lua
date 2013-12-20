-- OSX specific syscalls

local require, error, assert, tonumber, tostring,
setmetatable, pairs, ipairs, unpack, rawget, rawset,
pcall, type, table, string = 
require, error, assert, tonumber, tostring,
setmetatable, pairs, ipairs, unpack, rawget, rawset,
pcall, type, table, string

local abi = require "syscall.abi"

return function(S, hh, c, C, types)

local ret64, retnum, retfd, retbool, retptr = hh.ret64, hh.retnum, hh.retfd, hh.retbool, hh.retptr

local ffi = require "ffi"
local errno = ffi.errno

local h = require "syscall.helpers"

local istype, mktype, getfd = h.istype, h.mktype, h.getfd

local t, pt, s = types.t, types.pt, types.s

-- TODO lutimes is implemented using setattrlist(2) in OSX

function S.getdirentries(fd, buf, size, basep)
  size = size or 4096
  buf = buf or t.buffer(size)
  local ret, err = C.getdirentries(getfd(fd), buf, size, basep)
  if ret == -1 then return nil, t.error(err or errno()) end
  return t.dirents(buf, ret)
end

return S

end

