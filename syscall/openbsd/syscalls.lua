-- OpenBSD specific syscalls

local require = require

return function(S, hh, c, C, types)

local retbool = hh.retbool

local ffi = require "ffi"

local h = require "syscall.helpers"

local getfd = h.getfd

function S.reboot(howto) return C.reboot(c.RB[howto]) end

-- pty functions, using libc ones for now; the libc ones use a database of name to dev mappings
function S.ptsname(fd)
  local name = ffi.C.ptsname(getfd(fd))
  if not name then return nil end
  return ffi.string(name)
end

function S.grantpt(fd) return retbool(ffi.C.grantpt(getfd(fd))) end
function S.unlockpt(fd) return retbool(ffi.C.unlockpt(getfd(fd))) end

return S

end

