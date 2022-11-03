#!/bin/sh
# Build the container.
docker build -t fluttergcc11wayland .
# only create mount if it does not exist. build will be removed anyways.
docker volume create --name fluttergcc11waylandvolume -o size=100G 
# Set permissions
docker run -it --rm -v fluttergcc11waylandvolume:/workdir fluttergcc11wayland sudo chown -R build:build /workdir
# Install flutter wayland
docker run -it -v fluttergcc11waylandvolume:/workdir fluttergcc11wayland /home/build/wayland.sh
# Enter the container to check out the results
docker run -it -v fluttergcc11waylandvolume:/workdir fluttergcc11wayland /bin/bash

