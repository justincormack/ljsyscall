-- fcntl is one of those bits of the Unix API that is a bit random, so give it its own file

local require, tonumber = require, tonumber

local function init(types)

local c = require "syscall.linux.constants"

local t = types.t

local fcntl = {
  commands = {
    [c.F.SETFL] = function(arg) return c.O[arg] end,
    [c.F.SETFD] = function(arg) return c.FD[arg] end,
    [c.F.GETLK] = t.flock,
    [c.F.SETLK] = t.flock,
    [c.F.SETLKW] = t.flock,
  },
  ret = {
    [c.F.DUPFD] = function(ret) return t.fd(ret) end,
    [c.F.DUPFD_CLOEXEC] = function(ret) return t.fd(ret) end,
    [c.F.GETFD] = function(ret) return tonumber(ret) end,
    [c.F.GETFL] = function(ret) return tonumber(ret) end,
    [c.F.GETLEASE] = function(ret) return tonumber(ret) end,
    [c.F.GETOWN] = function(ret) return tonumber(ret) end,
    [c.F.GETSIG] = function(ret) return tonumber(ret) end,
    [c.F.GETPIPE_SZ] = function(ret) return tonumber(ret) end,
    [c.F.GETLK] = function(ret, arg) return arg end,
  }
}

return fcntl

end

return {init = init}

