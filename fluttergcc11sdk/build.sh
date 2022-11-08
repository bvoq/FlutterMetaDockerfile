#!/bin/sh
docker build -t fluttergcc11sdk .
#docker volume create --name fluttergcc11sdkvolume -o size=100G 
#docker run -it --storage-opt size=100G fluttergcc11wayland
docker run -it --rm -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk sudo chown -R build:build /workdir
docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /home/build/sdk.sh
docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /bin/bash

docker container create --name dummyelinux -v fluttergcc11sdkvolume:/root hello-world
docker cp dummyelinux:/root/build/tmp/deploy deploy_sdk
docker cp dummyelinux:/root/myproj myproj


qemu-system-aarch64 -m 2048 -cpu cortex-a57 -smp 2 -M virt -bios QEMU_EFI.fd -serial stdio  -device virtio-net,netdev=hostnet0,mac=52:54:00:09:a4:37 -netdev user,id=hostnet0 -drive if=none,file=Fedora-Workstation-36-1.5.aarch64.raw,id=hd0  -device virtio-blk-device,drive=hd0 -device virtio-gpu-pci -device nec-usb-xhci -device usb-tablet -device usb-kbd
