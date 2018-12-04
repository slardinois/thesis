#!/bin/bash

qemu-system-x86_64 -enable-kvm \
		   -m 1G \
		   -smp 2 \
		   -nographic \
		   -s \
		   -name "SRV6 NC VM" \
		   -net nic \
		   -net user,hostname=srv6-nc,hostfwd=tcp::2222-:22 \
		   -initrd ramdisk.img \
		   -kernel ../linux-srv6-nc/arch/x86/boot/bzImage \
		   -drive file=srv6-nc.img,if=virtio,format=raw \
		   -append 'root=/dev/vda1 console=ttyS0 nokaslr' # nokaslr needed for dbg