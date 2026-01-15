ENTRY(start)

SECTIONS {
  . = 0x1000000;

  /* machine code */
  .text :{
    KEEP(*(.text.stast));
    *(.text .text.*);
  }

  /* read only data */
  .rodata : ALIGN(4) {
    *(.rodata .rodata.*);
  }

  /* data with intial values */
  .data : ALIGN(4) {
    *(.data .data.*);
  }

  /* data with inital 0s */
  .bss : ALIGN(4) {
    *.(.bss .bss.* .sbss .sbss.*);

    . = ALIGN(16);
    . += 64 * 1024; /* 64KB */
    __stack_top = .;

    ASSERT(. < 0x1800000, "executable too large");
  }
}

