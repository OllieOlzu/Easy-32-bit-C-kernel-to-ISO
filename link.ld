/* link.ld */
OUTPUT_FORMAT(elf32-i386)
ENTRY(kernel_main)

SECTIONS {
  . = 1M;

  .text : {
    *(.multiboot)
    *(.text*)
  }

  .rodata : { *(.rodata*) }
  .data : { *(.data*) }
  .bss : {
    *(.bss*)
    *(COMMON)
  }
}
