#! /usr/bin/env luajit

local function safe_lfs_dir(lfs_dir, dir)
	local f, k
	local ok, err = pcall(function() f,k = lfs_dir(dir) end)
	if not ok or not f then
		print("safe_lfs_dir: catched error:", err)
		return function()end
	end
	return f, k
end

local function testwith(lfs, target)
	local success = true
	local count = 0
	for f in safe_lfs_dir(lfs.dir, target) do
		count = count+1
		print(count, f)
	end
	local ok, err = pcall(function() return lfs.dir("/nonexistant") end)
	if ok then
		print("error should be raised")
		success = false
	end
	return success
end
local target = arg[1] or "/"
if not testwith(require"lfs", target) then print("lfs failure") end
if not testwith(require"syscall.lfs", target) then print("syscall.lfs failure") end
