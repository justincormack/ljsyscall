-- OSX specific syscalls

local require = require

return function(S, hh, c, C, types)

local retbool = hh.retbool

local ffi = require "ffi"
local errno = ffi.errno

local h = require "syscall.helpers"

local t = types.t

-- TODO lutimes is implemented using setattrlist(2) in OSX

function S.grantpt(fd) return S.ioctl(fd, "TIOCPTYGRANT") end
function S.unlockpt(fd) return S.ioctl(fd, "TIOCPTYUNLK") end
function S.ptsname(fd)
  local buf = t.buffer(128)
  local ok, err = S.ioctl(fd, "TIOCPTYGNAME", buf)
  if not ok then return nil, err end
  return ffi.string(buf)
end

function S.mach_absolute_time() return C.mach_absolute_time() end
function S.mach_task_self() return C.mach_task_self_ end
function S.mach_host_self() return C.mach_host_self() end
function S.mach_port_deallocate(task, name) return retbool(C.mach_port_deallocate(task or S.mach_task_self(), name)) end

function S.host_get_clock_service(host, clock_id, clock_serv)
  clock_serv = clock_serv or t.clock_serv1()
  local ok, err = C.host_get_clock_service(host or S.mach_host_self(), c.CLOCKTYPE[clock_id or "SYSTEM"], clock_serv)
  if not ok then return nil, err end
  return clock_serv[0]
end

-- TODO when mach ports do gc, can add 'clock_serv or S.host_get_clock_service()'
function S.clock_get_time(clock_serv, cur_time)
  cur_time = cur_time or t.mach_timespec()
  local ok, err = C.clock_get_time(clock_serv, cur_time)
  if not ok then return nil, err end
  return cur_time
end

-- cannot find out how to get new stat type from fstatat
function S.fstatat(fd, path, buf, flags)
  if not buf then buf = t.stat32() end
  local ret, err = C.fstatat(c.AT_FDCWD[fd], path, buf, c.AT[flags])
  if ret == -1 then return nil, t.error(err or errno()) end
  return buf
end

return S

end

