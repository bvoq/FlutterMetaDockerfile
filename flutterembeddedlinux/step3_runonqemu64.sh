#!/bin/bash
brew install qemu

# If not on macOS, choose your package manager:
# pacman -S qemu
# dnf install @virtualization 
# yum install qemu-kvm # RHEL/CentOS/etc.
# emerge --ask app-emulation/qemu # Gentoo
# zypper install qemu # SUSE



## Minimal required QEMU instance.
## First try to get the following command working and create a user on Fedora. Next enable hardware acceleration and :
## qemu-system-aarch64 -m 2048 -cpu cortex-a57 -smp 4 -M virt,accel=hvf,highmem=off -bios QEMU_EFI.fd -serial stdio -drive if=none,file=Fedora-Workstation-36-1.5.aarch64.raw,id=hd0  -device virtio-blk-device,drive=hd0 -device virtio-gpu-pci -device nec-usb-xhci -device usb-tablet -device usb-kbd

# To put the files on the disk you can either use an internet connection (see virtio-net) or virtual file systems. The below command does both. In addition:
# Faster, with hardware acceleration (), virtual filesystm and other niceness on macOS:
# The 'mon:' in the -serial line fixes ctrl+C so it doesn't kill qemu;
# -M virt,accel=hvf,highmem=off enables hardware acceleration on macOS without kvm. Unfortunately it limits memory use to 2048.
# The -display cocoa,show-cursor=on enables cursor on macOS.
# The virtfs command mounts the files

qemu-system-aarch64 \
-m 2048\
-cpu cortex-a57\
-smp 4\
-M virt,accel=hvf,highmem=off\
-bios QEMU_EFI.fd\
-serial mon:stdio\
-device virtio-net,netdev=hostnet0,mac=52:54:00:09:a4:37 -netdev user,id=hostnet0\
-drive if=none,file=Fedora-Workstation-36-1.5.aarch64.raw,id=hd0\
-device virtio-blk-device,drive=hd0\
-device virtio-gpu-pci\
-device nec-usb-xhci\
-device usb-tablet -device usb-kbd\
-display cocoa,show-cursor=on\
-virtfs local,path=./build,security_model=none,mount_tag=fluttersharedfolder


# then login to the Fedora work station (with UI unlocked so the view controller can run) and then run:
# mkdir /tmp/sharedfolder
# sudo mount -t 9p -o trans=virtio,version=9p2000.L fluttersharedfolder /tmp/sharedfolder
# cd /tmp/sharedfolder/elinux/arm64/release/bundle
# ./myproj -b .

# Note if you only have an ISO (eg. OpenSUSE tumbleweed with gnome):
# qemu-img create opensuse_image.img 8G
# qemu-system-aarch64 -cdrom openSUSE-Tumbleweed-DVD-aarch64-Snapshot20230119-Media.iso -hda opensuse_image.img  -m 2048 -cpu cortex-a57 -smp 4 -M virt,accel=hvf,highmem=off -bios QEMU_EFI.fd -serial stdio  -device virtio-net,netdev=hostnet0,mac=52:54:00:09:a4:37 -netdev user,id=hostnet0 -device virtio-gpu-pci -device nec-usb-xhci -device usb-tablet -device usb-kbd -display cocoa,show-cursor=on
# and finally run using:
# qemu-system-aarch64 -hda opensuse_image.img  -m 2048 -cpu cortex-a57 -smp 4 -M virt,accel=hvf,highmem=off -bios QEMU_EFI.fd -serial stdio  -device virtio-net,netdev=hostnet0,mac=52:54:00:09:a4:37 -netdev user,id=hostnet0 -device virtio-gpu-pci -device nec-usb-xhci -device usb-tablet -device usb-kbd -display cocoa,show-cursor=on -virtfs local,path=./build,security_model=none,mount_tag=fluttersharedfolder
