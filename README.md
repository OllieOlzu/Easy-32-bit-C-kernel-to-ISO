# Easy-32-bit-C-kernel-to-ISO

A simple way to turn a 32 bit protected mode C kernel file into a iso file using GRUB

# HOW TO USE IN LINUX

1: Make sure these are installed:

    sudo apt update
    sudo apt install build-essential gcc-multilib grub-pc-bin xorriso nasm qemu-system-x86 git dos2unix

2: In a new folder, clone the files here with this script:

    git clone https://github.com/OllieOlzu/Easy-32-bit-C-kernel-to-ISO .

3: Make the required files executeable:

    dos2unix build.sh 
    chmod +x build.sh 
    dos2unix reset.sh 
    chmod +x reset.sh

4: Modify kernel.c to your liking, it's preset to a simple script that says a green "HELLO" on a blue background. If you want some more egsamples that cover the bacics of reading keys, arrays, restarting the script, and making simple games check out https://github.com/OllieOlzu/32-bit-C-kernel-code.

# HOW TO BUILD, RUN, AND RESET

Run build.sh to build and run it:

    ./build.sh

It should boot into QEMU with your kernel running. 

Reset by simply running reset.sh:

    ./reset.sh

You will now have the same files as before you ran build.sh, you can modify kernel.c and when your ready, build it again.

# THINGS YOU CAN CUSTOMISE

You can customise kernel.c of cource to change what code get executed, but apart from that you can change grub.cfg (found in iso/boot/grub/grub.cfg) where you can make a gui get displayed and time out by changing the timeout variable. This can be useful because if you rename the kernel.bin that just got made in iso/boot to a diffrent name, reset.sh won't delete it and you can change grub.cfg to have a second menu entry that will boot the permedent bin file, efectively making a permedent addition to your ISO, that you can run at any time in the grub GUI.

Using this method, I made Ollie's ISO that you can find here: https://github.com/OllieOlzu/OlliesISO

You can also change the name of the ISO file that gets made by changing variables.sh, and also if QEMU should run when build.sh is run. 

IMPORTANT: Make sure to allways run reset.sh BEFORE changing variables.sh, otherwise the previous ISO file sill still be there when reset.sh is run.


