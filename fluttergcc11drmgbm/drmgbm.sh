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

#rm -rf /workdir/build
source /workdir/poky/oe-init-build-env /workdir/build
echo 'MACHINE ?= "qemuarm64"' >> /workdir/build/conf/local.conf
echo 'DISTRO_FEATURES:append = " systemd"' >> /workdir/build/conf/local.conf
#RUN echo 'CLANGSDK = "1"' >> /home/yocto/build/conf/local.conf
cd /workdir/build
MACHINE=qemuarm64 bitbake-layers add-layer ../meta-clang/
MACHINE=qemuarm64 bitbake-layers add-layer ../meta-flutter/
MACHINE=qemuarm64 bitbake flutter-drm-gbm-backend

