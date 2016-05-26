-- This sets up the table of C functions
-- For OSX we hope we do not need many overrides

local require, setmetatable, pcall = require, setmetatable, pcall

local ffi = require "ffi"

local function inlibc_fn(k) return ffi.C[k] end

-- Syscalls that just return ENOSYS but are in libc. Note these might vary by version in future
local nosys_calls = {
  mlockall = true,
}

local C = setmetatable({}, {
  __index = function(C, k)
    if nosys_calls[k] then return nil end
    if pcall(inlibc_fn, k) then
      C[k] = ffi.C[k] -- add to table, so no need for this slow path again
      return C[k]
    else
      return nil
    end
  end
})

-- new stat structure, else get legacy one; could use syscalls instead
-- does not work for fstatat
C.stat = C.stat64
C.fstat = C.fstat64
C.lstat = C.lstat64

-- TODO create syscall table. Except I cannot find how to call them, neither C.syscall nor C._syscall seems to exist
--[[
local getdirentries = 196
local getdirentries64 = 344

function C.getdirentries(fd, buf, len, basep)
  return C._syscall(getdirentries64, int(fd), void(buf), int(len), void(basep))
end
]]

-- cannot find these anywhere! Apparently not there since 64 bit inodes?
--C.getdirentries = ffi.C._getdirentries
--C.sigaction = ffi.C._sigaction

return C


