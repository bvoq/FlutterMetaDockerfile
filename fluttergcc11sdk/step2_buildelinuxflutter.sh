#!/bin/sh
source /workdir/poky2/environment-setup-cortexa57-poky-linux
export CC=${CLANGCC}
export CXX=${CLANGCXX}
git clone https://github.com/sony/flutter-elinux.git /workdir/flutter-elinux
export PATH=$PATH:/workdir/flutter-elinux/bin
sudo apt install libegl1-mesa libgles2-mesa libxkbcommon-dev -y
# Wayland
sudo apt install libwayland-dev -y
# DRM
# sudo apt install libdrm-dev libgbm-dev libinput-dev libudev-dev libsystemd-dev -y

cd /workdir
## potential fix
# mv /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/ld /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/ld.x86_64
# cp -a /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-ld /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/ld
sudo mv /workdir/poky2/sysroots/

# building
flutter-elinux create myproj
cd myproj
flutter-elinux build elinux --target-arch=arm64 --target-compiler-triple=aarch64-poky-linux --target-sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux/

qemu-system-aarch64 -m 2048 -cpu cortex-a57 -smp 2 -M virt -bios QEMU_EFI.fd -serial stdio  -device virtio-net,netdev=hostnet0,mac=52:54:00:09:a4:37 -netdev user,id=hostnet0 -drive if=none,file=Fedora-Workstation-36-1.5.aarch64.raw,id=hd0  -device virtio-blk-device,drive=hd0 -device virtio-gpu-pci -device nec-usb-xhci -device usb-tablet -device usb-kbd
