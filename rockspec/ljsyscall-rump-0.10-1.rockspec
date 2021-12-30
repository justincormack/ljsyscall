package = "ljsyscall-rump"
version = "0.10-1"
source =
{
  url = "https://github.com/justincormack/ljsyscall/archive/v0.10.tar.gz";
  dir = "ljsyscall-0.10";
}

description =
{
  summary = "Rump kernel support for LuaJIT syscall FFI";
  homepage = "https://github.com/justincormack/ljsyscall";
  license = "MIT";
}
dependencies =
{
  "lua == 5.1"; -- In fact this should be "luajit >= 2.0.0"
  "ljsyscall == 0.10";
}

local netbsd_modules =
{
  modules =
  {
    ["syscall.netbsd.syscalls"] = "syscall/netbsd/syscalls.lua";
    ["syscall.netbsd.c"] = "syscall/netbsd/c.lua";
    ["syscall.netbsd.constants"] = "syscall/netbsd/constants.lua";
    ["syscall.netbsd.ffitypes"] = "syscall/netbsd/ffitypes.lua";
    ["syscall.netbsd.ffifunctions"] = "syscall/netbsd/ffifunctions.lua";
    ["syscall.netbsd.ioctl"] = "syscall/netbsd/ioctl.lua";
    ["syscall.netbsd.types"] = "syscall/netbsd/types.lua";
    ["syscall.netbsd.fcntl"] = "syscall/netbsd/fcntl.lua";
    ["syscall.netbsd.errors"] = "syscall/netbsd/errors.lua";
    ["syscall.netbsd.util"] = "syscall/netbsd/util.lua";
    ["syscall.netbsd.nr"] = "syscall/netbsd/nr.lua";
    ["syscall.netbsd.init"] = "syscall/netbsd/init.lua";
    ["syscall.netbsd.version"] = "syscall/netbsd/version.lua";
  }
}

local netbsd_modules_linux =
{
  modules =
  {
    ["syscall.netbsd.syscalls"] = "syscall/netbsd/syscalls.lua";
    ["syscall.netbsd.c"] = "syscall/netbsd/c.lua";
    ["syscall.netbsd.constants"] = "syscall/netbsd/constants.lua";
    ["syscall.netbsd.ffitypes"] = "syscall/netbsd/ffitypes.lua";
    ["syscall.netbsd.ffifunctions"] = "syscall/netbsd/ffifunctions.lua";
    ["syscall.netbsd.ioctl"] = "syscall/netbsd/ioctl.lua";
    ["syscall.netbsd.types"] = "syscall/netbsd/types.lua";
    ["syscall.netbsd.fcntl"] = "syscall/netbsd/fcntl.lua";
    ["syscall.netbsd.errors"] = "syscall/netbsd/errors.lua";
    ["syscall.netbsd.util"] = "syscall/netbsd/util.lua";
    ["syscall.netbsd.nr"] = "syscall/netbsd/nr.lua";
    ["syscall.netbsd.init"] = "syscall/netbsd/init.lua";
    ["syscall.netbsd.version"] = "syscall/netbsd/version.lua";

    ["syscall.bsd.syscalls"] = "syscall/bsd/syscalls.lua";
    ["syscall.bsd.ffi"] = "syscall/bsd/ffi.lua";
    ["syscall.bsd.types"] = "syscall/bsd/types.lua";
  }
}

build =
{
  type = "builtin";
  modules =
  {
    ["syscall.rump.init"] = "syscall/rump/init.lua";
    ["syscall.rump.c"] = "syscall/rump/c.lua";
    ["syscall.rump.ffirump"] = "syscall/rump/ffirump.lua";
  };
  platforms = {
    linux = netbsd_modules_linux;
    macosx = netbsd_modules;
    freebsd = netbsd_modules;
    openbsd = netbsd_modules;
  }
}
