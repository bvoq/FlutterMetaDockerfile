#!/bin/bash

cd /workdir
## Install yocto kirkstone
if [ ! -d /workdir/poky ]; then
  # Direct way (fast)
  curl "http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.4/poky-d64bef1c7d713b92a51228e5ade945835e5a94a4.tar.bz2" > pokykirkstone.tar.bz2
  tar xjf pokykirkstone.tar.bz2
  # Github (slow)
  # RUN git clone git://git.yoctoproject.org/poky -b kirkstone
fi
if [ ! -d /workdir/meta-clang ]; then
  git clone https://github.com/kraj/meta-clang -b kirkstone
fi
if [ ! -f /workdir/meta-flutter ]; then
  git clone https://github.com/sony/meta-flutter.git
fi

#rm -rf /workdir/build
source /workdir/poky/oe-init-build-env /workdir/build
echo 'MACHINE ?= "qemuarm64"' >> /workdir/build/conf/local.conf
echo 'CLANGSDK = "1"' >> /workdir/build/conf/local.conf
cd /workdir/build
bitbake-layers add-layer ../meta-clang/
bitbake-layers add-layer ../meta-flutter/
bitbake core-image-weston -c populate_sdk
#./tmp/deploy/sdk/poky-glibc-x86_64-core-image-weston-aarch64-qemuarm64-toolchain-3.1.7.sh
echo /workdir/poky2 | ./tmp/deploy/sdk/poky-glibc-x86_64-core-image-weston-cortexa57-qemuarm64-toolchain-4.0.4.sh
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

