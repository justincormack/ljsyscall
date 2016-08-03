-- module for netfilter code
-- will cover iptables, ip6tables, ebtables, arptables eventually
-- even less documentation than for netlink but it does not look too bad...

local require = require

local nf = {} -- exports

local S = require "syscall"
local c = S.c
local types = S.types
local t, s = types.t, types.s

function nf.socket(family)
  return S.socket(family, "raw", "raw")
end

local level = {
  [c.AF.INET] = c.IPPROTO.IP,
  [c.AF.INET6] = c.IPPROTO.IPV6,
}

function nf.version(family)
  family = family or c.AF.INET
  local sock, err = nf.socket(family)
  if not sock then return nil, err end
  local rev = t.xt_get_revision()
  local max, err = sock:getsockopt(level[family], c.IPT_SO_GET.REVISION_TARGET, rev, s.xt_get_revision);
  local ok, cerr = sock:close()
  if not ok then return nil, cerr end
  if not max then return nil, err end
  return max
end

return nf

