; multiboot_header.asm
section .multiboot
align 4

MAGIC           equ 0x1BADB002
FLAGS           equ 0x00000003
CHECKSUM        equ -(MAGIC + FLAGS)

dd MAGIC
dd FLAGS
dd CHECKSUM
