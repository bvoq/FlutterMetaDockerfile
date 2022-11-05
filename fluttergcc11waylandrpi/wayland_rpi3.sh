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
if [ ! -d /workdir/meta-flutter ]; then
  git clone https://github.com/sony/meta-flutter.git
fi

if [ ! -d /workdir/meta-rasperrypi ]; then
  git clone git://git.yoctoproject.org/meta-raspberrypi.git -b kirkstone
fi

if [ ! -d /workdir/meta-openembedded ]; then
  git clone git://git.yoctoproject.org/meta-openembedded.git -b kirkstone
fi

rm -rf /workdir/build
source /workdir/poky/oe-init-build-env /workdir/build
echo 'MACHINE ?= "raspberrypi3"' >> /workdir/build/conf/local.conf
echo 'INHERIT += "rm_work"' >> /workdir/build/conf/local.conf # save space
echo 'IMAGE_FSTYPES = "tar.xz ext3 rpi-sdimg"' >> /workdir/build/conf/local.conf # get SD card image
echo 'ENABLE\_UART = "1"' >> /workdir/build/conf/local.conf # more rasperrypi settings.
echo 'EXTRA_IMAGE_FEATURES ?= "debug-tweaks"' >> /workdir/build/conf/local.conf # configure a root user for testing.
#RUN echo 'CLANGSDK = "1"' >> /home/yocto/build/conf/local.conf
cd /workdir/build
# MACHINE=qemuarm64 bitbake-layers add-layer ../meta-clang/
# MACHINE=qemuarm64 bitbake-layers add-layer ../meta-flutter/
# MACHINE=qemuarm64 bitbake flutter-wayland-client

