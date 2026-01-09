ENTRY(boot) /* the boot function is the entry point of the program */

/* *(.foo) means put the foo section at this point, from all files */
/* ALIGN(4) align toa 4 byte boundary */

SECTIONS {
  /* base address */
  . = 0x80200000;

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
}

