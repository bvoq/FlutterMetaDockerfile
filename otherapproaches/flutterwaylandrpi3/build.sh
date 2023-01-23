#!/bin/sh
# Build the container.
docker build -t flutterwaylandrpi3 .
# only create mount if it does not exist. build will be removed anyways.
docker volume create --name flutterwaylandrpi3volume -o size=100G 
# Set permissions
docker run -it --rm -v flutterwaylandrpi3volume:/workdir flutterwaylandrpi3 sudo chown -R build:build /workdir
# Install flutter wayland
docker run -it -v flutterwaylandrpi3volume:/workdir flutterwaylandrpi3 /home/build/wayland_rpi3.sh
# Enter the container to check out the results
docker run -it -v flutterwaylandrpi3volume:/workdir flutterwaylandrpi3 /bin/bash

# After building result create a dummy container to copy away the volume storage.
docker container create --name dummy_rpi3 -v flutterwaylandrpi3volume:/root hello-world
docker cp dummy_rpi3:/root/build/tmp/deploy deploy_wayland_rpi3
