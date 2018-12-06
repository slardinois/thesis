#!/bin/bash

qemu-system-x86_64 -enable-kvm \
		   -m 1G \
		   -smp 2 \
		   -s \
		   -name "Debian VM" \
		   -hda ~/thesis/VM/srv6-nc.img \
		   -fsdev local,security_model=passthrough,id=fsdev0,path=/home/simon/thesis/VM/shared \
		   -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=shared