-- tables of constants for OSX

local h = require "syscall.helpers"

local octal, multiflags, charflags, swapflags, strflag, atflag, modeflags
  = h.octal, h.multiflags, h.charflags, h.swapflags, h.strflag, h.atflag, h.modeflags

local c = {}

c.STD = strflag {
  IN_FILENO = 0,
  OUT_FILENO = 1,
  ERR_FILENO = 2,
  IN = 0,
  OUT = 1,
  ERR = 2,
}

c.PATH_MAX = 1024

c.E = strflag {
  PERM          =  1,
  NOENT         =  2,
  SRCH          =  3,
  INTR          =  4,
  IO            =  5,
  NXIO          =  6,
  ["2BIG"]      =  7,
  NOEXEC        =  8,
  BADF          =  9,
  CHILD         = 10,
  DEADLK	= 11,
  NOMEM         = 12,
  ACCES         = 13,
  FAULT         = 14,
  NOTBLK        = 15,
  BUSY          = 16,
  EXIST         = 17,
  XDEV          = 18,
  NODEV         = 19,
  NOTDIR        = 20,
  ISDIR         = 21,
  INVAL         = 22,
  NFILE         = 23,
  MFILE         = 24,
  NOTTY         = 25,
  TXTBSY        = 26,
  FBIG          = 27,
  NOSPC         = 28,
  SPIPE         = 29,
  ROFS          = 30,
  MLINK         = 31,
  PIPE          = 32,
  DOM           = 33,
  RANGE         = 34,
  AGAIN		= 35,
  INPROGRESS	= 36,
  ALREADY	= 37,
  NOTSOCK	= 38,
  DESTADDRREQ	= 39,
  MSGSIZE	= 40,
  PROTOTYPE	= 41,
  NOPROTOOPT	= 42,
  PROTONOSUPPORT= 43,
  SOCKTNOSUPPORT= 44,
  OPNOTSUPP	= 45,
  PFNOSUPPORT	= 46,
  AFNOSUPPORT	= 47,
  ADDRINUSE	= 48,
  ADDRNOTAVAIL	= 49,
  NETDOWN	= 50,
  NETUNREACH	= 51,
  NETRESET	= 52,
  CONNABORTED	= 53,
  CONNRESET	= 54,
  NOBUFS	= 55,
  ISCONN	= 56,
  NOTCONN	= 57,
  SHUTDOWN	= 58,
  TOOMANYREFS	= 59,
  TIMEDOUT	= 60,
  CONNREFUSED	= 61,
  LOOP		= 62,
  NAMETOOLONG	= 63,
  HOSTDOWN	= 64,
  HOSTUNREACH	= 65,
  NOTEMPTY	= 66,
  PROCLIM	= 67,
  USERS		= 68,
  DQUOT		= 69,
  STALE		= 70,
  REMOTE	= 71,
  BADRPC	= 72,
  RPCMISMATCH	= 73,
  PROGUNAVAIL	= 74,
  PROGMISMATCH	= 75,
  PROCUNAVAIL	= 76,
  NOLCK		= 77,
  NOSYS		= 78,
  FTYPE		= 79,
  AUTH		= 80,
  NEEDAUTH	= 81,
  IDRM		= 82,
  NOMSG		= 83,
  OVERFLOW	= 84,
  BADEXEC	= 85,
  BADARCH	= 86,
  SHLIBVERS	= 87,
  BADMACHO	= 88,
  CANCELED	= 89,
  IDRM		= 90,
  NOMSG		= 91,
  ILSEQ		= 92,
  NOATTR	= 93,
  BADMSG	= 94,
  MULTIHOP	= 95,
  NODATA	= 96,
  NOLINK        = 97,
  NOSR          = 98,
  NOSTR         = 99,
  PROTO         = 100,
  TIME          = 101,
  OPNOTSUPP	= 102,
  NOPOLICY      = 103,
  NOTRECOVERABLE= 104,
  OWNERDEAD     = 105,
  QFULL        	= 106,
}

-- alternate names
c.E.WOULDBLOCK    = c.E.EAGAIN
c.E.DEADLOCK      = c.E.EDEADLK

c.AF = strflag {
  UNSPEC      = 0,
  LOCAL       = 1,
  INET        = 2,
  IMPLINK     = 3,
  PUP         = 4,
  CHAOS       = 5,
  NS          = 6,
  ISO         = 7,
  ECMA        = 8,
  DATAKIT     = 9,
  CCITT       = 10,
  SNA         = 11,
  DECNET      = 12,
  DLI         = 13,
  LAT         = 14,
  HYLINK      = 15,
  APPLETALK   = 16,
  ROUTE       = 17,
  LINK        = 18,
  COIP        = 20,
  CNT         = 21,
  IPX         = 23,
  SIP         = 24,
  NDRV        = 27,
  ISDN        = 28,
  INET6       = 30,
  NATM        = 31,
  SYSTEM      = 32,
  NETBIOS     = 33,
  PPP         = 34,
}

c.AF.UNIX = c.AF.LOCAL
c.AF.OSI = c.AF.ISO
c.AF.E164 = c.AF.ISDN

c.O = multiflags {
  RDONLY      = 0x0000,
  WRONLY      = 0x0001,
  RDWR        = 0x0002,
  ACCMODE     = 0x0003,
  NONBLOCK    = 0x0004,
  APPEND      = 0x0008,
  SHLOCK      = 0x0010,
  EXLOCK      = 0x0020,
  ASYNC       = 0x0040,
  SYNC        = 0x0080,
  NOFOLLOW    = 0x0100,
  CREAT       = 0x0200,
  TRUNC       = 0x0400,
  EXCL        = 0x0800,
  EVTONLY     = 0x8000,
  NOCTTY      = 0x20000,
  DIRECTORY   = 0x100000,
  DSYNC       = 0x400000,
  CLOEXEC     = 0x1000000,
}

-- sigaction, note renamed SIGACT from SIG_
c.SIGACT = strflag {
  ERR = -1,
  DFL =  0,
  IGN =  1,
  HOLD = 5,
}

c.SIG = strflag {
  HUP = 1,
  INT = 2,
  QUIT = 3,
  ILL = 4,
  TRAP = 5,
  ABRT = 6,
  EMT = 7,
  FPE = 8,
  KILL = 9,
  BUS = 10,
  SEGV = 11,
  SYS = 12,
  PIPE = 13,
  ALRM = 14,
  TERM = 15,
  URG = 16,
  STOP = 17,
  TSTP = 18,
  CONT = 19,
  CHLD = 20,
  TTIN = 21,
  TTOU = 22,
  IO   = 23,
  XCPU = 24,
  XFSZ = 25,
  VTALRM = 26,
  PROF = 27,
  WINCH = 28,
  INFO = 29,
  USR1 = 30,
  USR2 = 31,
}

-- sigprocmask note renaming of SIG to SIGPM
c.SIGPM = strflag {
  BLOCK     = 1,
  UNBLOCK   = 2,
  SETMASK   = 3,
}

c.SA = multiflags {
  ONSTACK   = 0x0001,
  RESTART   = 0x0002,
  RESETHAND = 0x0004,
  NOCLDSTOP = 0x0008,
  NODEFER   = 0x0010,
  NOCLDWAIT = 0x0020,
  USERTRAMP = 0x0100,
  ["64REGSET"] = 0x0200,
}

c.EXIT = strflag {
  SUCCESS = 0,
  FAILURE = 1,
}

c.OK = charflags {
  R = 4,
  W = 2,
  X = 1,
  F = 0,
}

c.MODE = modeflags {
  SUID = octal('04000'),
  SGID = octal('02000'),
  STXT = octal('01000'),
  RWXU = octal('00700'),
  RUSR = octal('00400'),
  WUSR = octal('00200'),
  XUSR = octal('00100'),
  RWXG = octal('00070'),
  RGRP = octal('00040'),
  WGRP = octal('00020'),
  XGRP = octal('00010'),
  RWXO = octal('00007'),
  ROTH = octal('00004'),
  WOTH = octal('00002'),
  XOTH = octal('00001'),
}

c.SEEK = strflag {
  SET = 0,
  CUR = 1,
  END = 2,
}

c.SOCK = strflag {
  STREAM    = 1,
  DGRAM     = 2,
  RAW       = 3,
  RDM       = 4,
  SEQPACKET = 5,
}

c.IPPROTO = strflag {
  IP             = 0,
  HOPOPTS        = 0,
  ICMP           = 1,
  IGMP           = 2,
  GGP            = 3,
  IPV4           = 4,
  IPIP           = 4,
  TCP            = 6,
  ST             = 7,
  EGP            = 8,
  PIGP           = 9,
  RCCMON         = 10,
  NVPII          = 11,
  PUP            = 12,
  ARGUS          = 13,
  EMCON          = 14,
  XNET           = 15,
  CHAOS          = 16,
  UDP            = 17,
  MUX            = 18,
  MEAS           = 19,
  HMP            = 20,
  PRM            = 21,
  IDP            = 22,
  TRUNK1         = 23,
  TRUNK2         = 24,
  LEAF1          = 25,
  LEAF2          = 26,
  RDP            = 27,
  IRTP           = 28,
  TP             = 29,
  BLT            = 30,
  NSP            = 31,
  INP            = 32,
  SEP            = 33,
  ["3PC"]        = 34,
  IDPR           = 35,
  XTP            = 36,
  DDP            = 37,
  CMTP           = 38,
  TPXX           = 39,
  IL             = 40,
  IPV6           = 41,
  SDRP           = 42,
  ROUTING        = 43,
  FRAGMENT       = 44,
  IDRP           = 45,
  RSVP           = 46,
  GRE            = 47,
  MHRP           = 48,
  BHA            = 49,
  ESP            = 50,
  AH             = 51,
  INLSP          = 52,
  SWIPE          = 53,
  NHRP           = 54,
  ICMPV6         = 58,
  NONE           = 59,
  DSTOPTS        = 60,
  AHIP           = 61,
  CFTP           = 62,
  HELLO          = 63,
  SATEXPAK       = 64,
  KRYPTOLAN      = 65,
  RVD            = 66,
  IPPC           = 67,
  ADFS           = 68,
  SATMON         = 69,
  VISA           = 70,
  IPCV           = 71,
  CPNX           = 72,
  CPHB           = 73,
  WSN            = 74,
  PVP            = 75,
  BRSATMON       = 76,
  ND             = 77,
  WBMON          = 78,
  WBEXPAK        = 79,
  EON            = 80,
  VMTP           = 81,
  SVMTP          = 82,
  VINES          = 83,
  TTP            = 84,
  IGP            = 85,
  DGP            = 86,
  TCF            = 87,
  IGRP           = 88,
  OSPFIGP        = 89,
  SRPC           = 90,
  LARP           = 91,
  MTP            = 92,
  AX25           = 93,
  IPEIP          = 94,
  MICP           = 95,
  SCCSP          = 96,
  ETHERIP        = 97,
  ENCAP          = 98,
  APES           = 99,
  GMTP           = 100,
  PIM            = 103,
  IPCOMP         = 108,
  PGM            = 113,
  SCTP           = 132,
  DIVERT         = 254,
  RAW            = 255,
}

c.MSG = multiflags {
  OOB             = 0x1,
  PEEK            = 0x2,
  DONTROUTE       = 0x4,
  EOR             = 0x8,
  TRUNC           = 0x10,
  CTRUNC          = 0x20,
  WAITALL         = 0x40,
  DONTWAIT        = 0x80,
  EOF             = 0x100,
  WAITSTREAM      = 0x200,
  FLUSH           = 0x400,
  HOLD            = 0x800,
  SEND            = 0x1000,
  HAVEMORE        = 0x2000,
  RCVMORE         = 0x4000,
  NEEDSA          = 0x10000,
}

c.F = strflag {
  DUPFD       = 0,
  GETFD       = 1,
  SETFD       = 2,
  GETFL       = 3,
  SETFL       = 4,
  GETOWN      = 5,
  SETOWN      = 6,
  GETLK       = 7,
  SETLK       = 8,
  SETLKW      = 9,
  FLUSH_DATA  = 40,
  CHKCLEAN    = 41,
  PREALLOCATE = 42,
  SETSIZE     = 43,
  RDADVISE    = 44,
  RDAHEAD     = 45,
  READBOOTSTRAP= 46,
  WRITEBOOTSTRAP= 47,
  NOCACHE     = 48,
  LOG2PHYS    = 49,
  GETPATH     = 50,
  FULLFSYNC   = 51,
  PATHPKG_CHECK= 52,
  FREEZE_FS   = 53,
  THAW_FS     = 54,
  GLOBAL_NOCACHE= 55,
  ADDSIGS     = 59,
  MARKDEPENDENCY= 60,
  ADDFILESIGS = 61,
  NODIRECT    = 62,
  GETPROTECTIONCLASS = 63,
  SETPROTECTIONCLASS = 64,
  LOG2PHYS_EXT= 65,
  GETLKPID             = 66,
  DUPFD_CLOEXEC        = 67,
  SETBACKINGSTORE      = 70,
  GETPATH_MTMINFO      = 71,
  SETNOSIGPIPE         = 73,
  GETNOSIGPIPE         = 74,
  TRANSCODEKEY         = 75,
  SINGLE_WRITER        = 76,
  GETPROTECTIONLEVEL   = 77,
}

c.FD = multiflags {
  CLOEXEC = 1,
}

-- note changed from F_ to FCNTL_LOCK
c.FCNTL_LOCK = strflag {
  RDLCK = 1,
  UNLCK = 2,
  WRLCK = 3,
}

c.S_I = multiflags {
  FMT   = octal('0170000'),
  FSOCK = octal('0140000'),
  FLNK  = octal('0120000'),
  FREG  = octal('0100000'),
  FBLK  = octal('0060000'),
  FDIR  = octal('0040000'),
  FCHR  = octal('0020000'),
  FIFO  = octal('0010000'),
  SUID  = octal('0004000'),
  SGID  = octal('0002000'),
  STXT  = octal('0001000'),
  RWXU  = octal('00700'),
  RUSR  = octal('00400'),
  WUSR  = octal('00200'),
  XUSR  = octal('00100'),
  RWXG  = octal('00070'),
  RGRP  = octal('00040'),
  WGRP  = octal('00020'),
  XGRP  = octal('00010'),
  RWXO  = octal('00007'),
  ROTH  = octal('00004'),
  WOTH  = octal('00002'),
  XOTH  = octal('00001'),
}

c.SOMAXCONN = 128

c.SHUT = strflag {
  RD   = 0,
  WR   = 1,
  RDWR = 2,
}

return c

