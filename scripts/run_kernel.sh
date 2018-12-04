#!/bin/bash

qemu-system-x86_64 -enable-kvm \
		   -m 1G \
		   -smp 2 \
		   -nographic \
		   -s \
		   -name "SRV6 NC Kernel" \
		   -initrd ramdisk.img \
		   -kernel ../linux-srv6-nc/arch/x86/boot/bzImage \
		   -append "console=ttyS0 nokaslr" # nokaslr needed for dbg
