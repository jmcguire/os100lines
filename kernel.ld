ENTRY(boot) /* the boot function is the entry point of the program */

/* this is all about defining where in the memory the different parts of the program go */
/* *(.foo) means put the foo section at this point, from all files */
/* ALIGN(4) align toa 4 byte boundary */
/* __foo_bar = . means create a constant that the C code can access called __foo_bar that is set to the current address */

SECTIONS {
  /* base address */
  . = 0x80200000;
  __kernel_base = .;

  /* program code */
  .text :{
    KEEP(*(.text.boot));
    *(.text .text.*);
  }

  /* constant data */
  .rodata : ALIGN(4) {
    *(.rodata .rodata.*);
  }

  /* read/write data */
  .data : ALIGN(4) {
    *(.data .data.*);
  }

  /* read/write data initialized with 0 */
  .bss : ALIGN(4) {
    __bss = .;
    *(.bss .bss.* .sbss .sbss.*);
    __bss_end = .;
  }

  . = ALIGN(4);
  . += 126 + 1024; /* 128KB  for the kernel stack */
  __stack_top = .;

  /* some space for the memory allocator, starting at the top of the stack */
  . = ALIGN(4096); /* in 4k chunks, which is a typical page size */
  __free_ram = .;
  . += 64 * 1024 * 1024; /* 64MB */
  __free_ram_end = .;
}

