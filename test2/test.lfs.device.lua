#! /usr/bin/env luajit

local function testwith(lfs, target)
	local x = lfs.attributes("/")
	assert(type(x.dev)=="number")
	assert(type(x.rdev)=="number")
	if target then
		local y = lfs.symlinkattributes(target)
		assert(type(y.dev)=="number")
		assert(type(y.rdev)=="number")
	end
end
local target = arg[1]
testwith( require"lfs", target )
testwith( require"syscall.lfs", target )
print("ok")
