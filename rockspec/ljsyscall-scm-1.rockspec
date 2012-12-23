package = "ljsyscall"
version = "scm-1"
source =
{
  url = "git://github.com/justincormack/ljsyscall.git";
  branch = "master";
}
description =
{
  summary = "LuaJIT Linux syscall FFI";
  homepage = "http://www.myriabit.com/ljsyscall/";
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
      ["syscall.include.constants-arm"] = "syscall/include/constants-arm.lua";
      ["syscall.include.constants"] = "syscall/include/constants.lua";
      ["syscall.include.constants-mips"] = "syscall/include/constants-mips.lua";
      ["syscall.include.constants-ppc"] = "syscall/include/constants-ppc.lua";
      ["syscall.include.constants-x64"] = "syscall/include/constants-x64.lua";
      ["syscall.include.constants-x86"] = "syscall/include/constants-x86.lua";
      ["syscall.include.headers"] = "syscall/include/headers.lua";
      ["syscall.include.headers-ppc"] = "syscall/include/headers-ppc.lua";
      ["syscall.include.headers-x64"] = "syscall/include/headers-x64.lua";
      ["syscall.include.headers-x86"] = "syscall/include/headers-x86.lua";
      ["syscall.include.helpers"] = "syscall/include/helpers.lua";
      ["syscall.include.ioctl-arm"] = "syscall/include/ioctl-arm.lua";
      ["syscall.include.ioctl"] = "syscall/include/ioctl.lua";
      ["syscall.include.ioctl-ppc"] = "syscall/include/ioctl-ppc.lua";
      ["syscall.include.types"] = "syscall/include/types.lua";
      ["syscall.nl"] = "syscall/nl.lua";
    };
  };
}
