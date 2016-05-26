-- OSX fcntl
-- TODO incomplete, lots missing

local require, tonumber = require, tonumber

local function init(types)

local c = require "syscall.osx.constants"

local t = types.t

local h = require "syscall.helpers"

local ctobool, booltoc = h.ctobool, h.booltoc

local fcntl = {
  commands = {
    [c.F.SETFL] = function(arg) return c.O[arg] end,
    [c.F.SETFD] = function(arg) return c.FD[arg] end,
    [c.F.GETLK] = t.flock,
    [c.F.SETLK] = t.flock,
    [c.F.SETLKW] = t.flock,
    [c.F.SETNOSIGPIPE] = function(arg) return booltoc(arg) end,
  },
  ret = {
    [c.F.DUPFD] = function(ret) return t.fd(ret) end,
    [c.F.DUPFD_CLOEXEC] = function(ret) return t.fd(ret) end,
    [c.F.GETFD] = function(ret) return tonumber(ret) end,
    [c.F.GETFL] = function(ret) return tonumber(ret) end,
    [c.F.GETOWN] = function(ret) return tonumber(ret) end,
    [c.F.GETLK] = function(ret, arg) return arg end,
    [c.F.GETNOSIGPIPE] = function(ret) return ctobool(ret) end,
  }
}

return fcntl

end

return {init = init}

