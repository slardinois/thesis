#!/bin/bash

qemu-system-x86_64 -enable-kvm \
		   -m 1G \
		   -smp 2 \
		   -nographic \
		   -s \
		   -name "SRV6 NC VM" \
		   -net nic,vlan=0,model=virtio -net user,vlan=0 \
		   -initrd ~/thesis/VM/ramdisk.img \
		   -kernel ../linux-srv6-nc/arch/x86/boot/bzImage \
		   -drive file=~/thesis/VM/srv6-nc.img,if=virtio,format=raw \
		   -append 'root=/dev/vda1 console=ttyS0 nokaslr' \
		   -fsdev local,security_model=passthrough,id=fsdev0,path=/home/simon/thesis/VM/shared \
		   -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=shared