-- This sets up the table of C functions

local require, setmetatable, pcall = require, setmetatable, pcall

local ffi = require "ffi"

require "syscall.freebsd.ffi"

local function inlibc_fn(k) return ffi.C[k] end

local C = setmetatable({}, {
  __index = function(C, k)
    if pcall(inlibc_fn, k) then
      C[k] = ffi.C[k] -- add to table, so no need for this slow path again
      return C[k]
    else
      return nil
    end
  end
})

-- quite a few FreeBSD functions are weak aliases to __sys_ prefixed versions, some seem to resolve but others do not, odd.
C.futimes = C.__sys_futimes
C.lutimes = C.__sys_lutimes
C.utimes = C.__sys_utimes
C.wait4 = C.__sys_wait4
C.sigaction = C.__sys_sigaction

return C

