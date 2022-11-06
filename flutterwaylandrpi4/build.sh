#!/bin/sh
# Build the container.
docker build -t flutterwaylandrpi4 .
# only create mount if it does not exist. build will be removed anyways.
docker volume create --name flutterwaylandrpi4volume -o size=100G 
# Set permissions
docker run -it --rm -v flutterwaylandrpi4volume:/workdir flutterwaylandrpi4 sudo chown -R build:build /workdir
# Install flutter wayland
docker run -it -v flutterwaylandrpi4volume:/workdir flutterwaylandrpi4 /home/build/wayland_rpi4.sh
# Enter the container to check out the results
docker run -it -v flutterwaylandrpi4volume:/workdir flutterwaylandrpi4 /bin/bash

# After building result create a dummy container to copy away the volume storage.
docker container create --name dummy_rpi4 -v flutterwaylandrpi4volume:/root hello-world
docker cp dummy_rpi4:/root/build/tmp/deploy deploy_wayland_rpi4
