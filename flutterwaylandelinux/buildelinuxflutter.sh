#!/bin/bash
# note needs to be bin/bash, since source has to be available.
source /workdir/poky2/environment-setup-cortexa57-poky-linux
export CC=${CLANGCC}
export CXX=${CLANGCXX}
echo $CC
echo $CXX
echo $(which clang++)
git clone https://github.com/sony/flutter-elinux.git /workdir/flutter-elinux
export PATH=$PATH:/workdir/flutter-elinux/bin
sudo apt install libegl1-mesa libgles2-mesa libxkbcommon-dev -y
# Wayland
sudo apt install libwayland-dev -y
sudo apt install cmake -y
# DRM
# sudo apt install libdrm-dev libgbm-dev libinput-dev libudev-dev libsystemd-dev -y

cd /workdir
## potential fix on some machines
# mv /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/ld /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/ld.x86_64
# cp -a /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-ld /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/ld

# create if it does not exist
flutter-elinux create myproj
cd myproj
# flutter-elinux pub cache clean
# flutter-elinux clean
# flutter-elinux pub get
flutter-elinux build elinux --target-arch=arm64 --target-compiler-triple=aarch64-poky-linux --target-sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux/
