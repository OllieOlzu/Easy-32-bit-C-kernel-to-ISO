#!/usr/bin/env bash
set -e

# === Configuration ===
KERNEL_NAME=kernel
ISO_DIR=iso
BUILD_DIR=build

# === Clean previous build ===
rm -rf $BUILD_DIR $ISO_DIR/myos.iso
mkdir -p $BUILD_DIR $ISO_DIR/boot/grub

# === Assemble Multiboot Header ===
nasm -f elf multiboot_header.asm -o $BUILD_DIR/multiboot_header.o

# === Compile kernel.c (32-bit freestanding) ===
gcc -m32 -ffreestanding -c kernel.c -o $BUILD_DIR/kernel.o

# === Link to 32-bit ELF binary ===
ld -m elf_i386 -T link.ld $BUILD_DIR/multiboot_header.o $BUILD_DIR/kernel.o -o $BUILD_DIR/$KERNEL_NAME.bin

# === Copy kernel to ISO folder ===
cp $BUILD_DIR/$KERNEL_NAME.bin $ISO_DIR/boot/

# === Create GRUB config ===
cat > $ISO_DIR/boot/grub/grub.cfg <<EOF
set timeout=0
set default=0

menuentry "My OS" {
    multiboot /boot/$KERNEL_NAME.bin
    boot
}
EOF

# === Build ISO ===
grub-mkrescue -o myos.iso $ISO_DIR

# === Optional: Run with QEMU ===
qemu-system-i386 -cdrom myos.iso
