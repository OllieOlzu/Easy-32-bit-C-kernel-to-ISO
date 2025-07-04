#!/usr/bin/env bash
set -e

# === Configuration ===
source variables.sh

# === Create necessary directories ===
mkdir -p build 

# === Assemble Multiboot Header ===
nasm -f elf multiboot_header.asm -o build/multiboot_header.o

# === Compile kernel.c (32-bit freestanding) ===
gcc -m32 -ffreestanding -c kernel.c -o build/kernel.o

# === Link to 32-bit ELF binary ===
ld -m elf_i386 -T link.ld build/multiboot_header.o build/kernel.o -o build/kernel.bin

# === Copy kernel to ISO folder ===
cp build/kernel.bin iso/boot/

# === Build ISO ===
grub-mkrescue -o $ISO_NAME.iso iso

# === Optional: Run with QEMU ===
qemu-system-i386 -cdrom $ISO_NAME.iso
