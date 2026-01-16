https://operating-system-in-1000-lines.vercel.app/en/

├── disk/     - File system contents
├── common.c  - Kernel/user common library: printf, memset, ...
├── common.h  - Kernel/user common library: definitions of structs and constants
├── kernel.c  - Kernel: process management, system calls, device drivers, file system
├── kernel.h  - Kernel: definitions of structs and constants
├── kernel.ld - Kernel: linker script (memory layout definition)
├── shell.c   - Command-line shell
├── user.c    - User library: functions for system calls
├── user.h    - User library: definitions of structs and constants
├── user.ld   - User: linker script (memory layout definition)
└── run.sh    - Build script

./run.sh
quit with
CRTL+A C then type q

if you get something like:
  PANIC: kernel.c:302: unexpected trap scause=0000000f, stval=80214e30, sepc=010000b8
find what line what was with:
  llvm-addr2line -e shell.elf 0x010000b8

To add a new syscall:
  - common.h: add new definition SYS_foo
  - kernel.c: add new case to handle_syscall() that handles SYS_foo
  - user.c: add a function that the user code should if you need a sys call
  - shell.c: (optional) add a new elseif statement to look for that command, to test it

