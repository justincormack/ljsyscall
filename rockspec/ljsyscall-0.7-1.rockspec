package = "ljsyscall"
version = "0.7-1"
source =
{
  url = "https://github.com/justincormack/ljsyscall/archive/v0.7.tar.gz";
  dir = "ljsyscall-0.7";
}
description =
{
  summary = "LuaJIT Linux syscall FFI";
  homepage = "https://github.com/justincormack/ljsyscall";
  license = "MIT";
}
dependencies =
{
  "lua == 5.1"; -- In fact this should be "luajit >= 2.0.0"
}
build =
{
  type = "none";
  install =
  {
    lua =
    {
      ["syscall"] = "syscall.lua";
      ["syscall.abi"] = "syscall/abi.lua";
      ["syscall.helpers"] = "syscall/helpers.lua";
      ["syscall.syscalls"] = "syscall/syscalls.lua";
      ["syscall.ffifunctions"] = "syscall/ffifunctions.lua";
      ["syscall.types"] = "syscall/types.lua";
      ["syscall.sharedtypes"] = "syscall/sharedtypes.lua";
      ["syscall.features"] = "syscall/features.lua";
      ["syscall.libc"] = "syscall/libc.lua";
      ["syscall.methods"] = "syscall/methods.lua";
      ["syscall.ffitypes"] = "syscall/ffitypes.lua";

      ["syscall.linux.syscalls"] = "syscall/linux/syscalls.lua";
      ["syscall.linux.c"] = "syscall/linux/c.lua";
      ["syscall.linux.constants"] = "syscall/linux/constants.lua";
      ["syscall.linux.ffitypes"] = "syscall/linux/ffitypes.lua";
      ["syscall.linux.ffifunctions"] = "syscall/linux/ffifunctions.lua";
      ["syscall.linux.ioctl"] = "syscall/linux/ioctl.lua";
      ["syscall.linux.types"] = "syscall/linux/types.lua";
      ["syscall.linux.fcntl"] = "syscall/linux/fcntl.lua";
      ["syscall.linux.errors"] = "syscall/linux/errors.lua";

      ["syscall.linux.nl"] = "syscall/linux/nl.lua";
      ["syscall.linux.netfilter"] = "syscall/linux/netfilter.lua";
      ["syscall.linux.util"] = "syscall/linux/util.lua";

      ["syscall.linux.arm.constants"] = "syscall/linux/arm/constants.lua";
      ["syscall.linux.arm.ffitypes"] = "syscall/linux/arm/ffitypes.lua";
      ["syscall.linux.arm.ioctl"] = "syscall/linux/arm/ioctl.lua";
      ["syscall.linux.mips.constants"] = "syscall/linux/mips/constants.lua";
      ["syscall.linux.ppc.constants"] = "syscall/linux/ppc/constants.lua";
      ["syscall.linux.ppc.ffitypes"] = "syscall/linux/ppc/ffitypes.lua";
      ["syscall.linux.ppc.ioctl"] = "syscall/linux/ppc/ioctl.lua";
      ["syscall.linux.x64.constants"] = "syscall/linux/x64/constants.lua";
      ["syscall.linux.x64.ffitypes"] = "syscall/linux/x64/ffitypes.lua";
      ["syscall.linux.x86.constants"] = "syscall/linux/x86/constants.lua";
      ["syscall.linux.x86.ffitypes"] = "syscall/linux/x86/ffitypes.lua";

      ["syscall.netbsd.syscalls"] = "syscall/netbsd/syscalls.lua";
      ["syscall.netbsd.c"] = "syscall/netbsd/c.lua";
      ["syscall.netbsd.constants"] = "syscall/netbsd/constants.lua";
      ["syscall.netbsd.ffitypes"] = "syscall/netbsd/ffitypes.lua";
      ["syscall.netbsd.ffifunctions"] = "syscall/netbsd/ffifunctions.lua";
      ["syscall.netbsd.ioctl"] = "syscall/netbsd/ioctl.lua";
      ["syscall.netbsd.types"] = "syscall/netbsd/types.lua";
      ["syscall.netbsd.fcntl"] = "syscall/netbsd/fcntl.lua";
      ["syscall.netbsd.errors"] = "syscall/netbsd/errors.lua";

      ["syscall.osx.syscalls"] = "syscall/osx/syscalls.lua";
      ["syscall.osx.c"] = "syscall/osx/c.lua";
      ["syscall.osx.constants"] = "syscall/osx/constants.lua";
      ["syscall.osx.ffitypes"] = "syscall/osx/ffitypes.lua";
      ["syscall.osx.ffifunctions"] = "syscall/osx/ffifunctions.lua";
      ["syscall.osx.ioctl"] = "syscall/osx/ioctl.lua";
      ["syscall.osx.types"] = "syscall/osx/types.lua";
      ["syscall.osx.fcntl"] = "syscall/osx/fcntl.lua";
      ["syscall.osx.errors"] = "syscall/osx/errors.lua";

      ["syscall.rump.init"] = "syscall/rump/init.lua";
      ["syscall.rump.c"] = "syscall/rump/c.lua";
      ["syscall.rump.types"] = "syscall/rump/types.lua";
    };
  };
}
