#!/bin/bash
brew install qemu

# If not on macOS, choose your poison:
# pacman -S qemu
# dnf install @virtualization 
# yum install qemu-kvm # RHEL/CentOS/etc.
# emerge --ask app-emulation/qemu # Gentoo
# zypper install qemu # SUSE

qemu-system-aarch64 -m 2048 -cpu cortex-a57 -smp 2 -M virt -bios QEMU_EFI.fd -serial stdio  -device virtio-net,netdev=hostnet0,mac=52:54:00:09:a4:37 -netdev user,id=hostnet0 -drive if=none,file=Fedora-Workstation-36-1.5.aarch64.raw,id=hd0  -device virtio-blk-device,drive=hd0 -device virtio-gpu-pci -device nec-usb-xhci -device usb-tablet -device usb-kbd
