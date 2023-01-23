#!/bin/sh
# Build the container.
docker build -t flutterubuntu20 .
# only create mount if it does not exist. build will be removed anyways.
docker volume create --name flutterubuntu20volume -o size=100G 
# Set permissions
docker run -it --rm -v flutterubuntu20volume:/workdir flutterubuntu20 sudo chown -R build:build /workdir
# Install flutter wayland
docker run -it -v flutterubuntu20volume:/workdir flutterubuntu20 /home/build/wayland.sh
# Enter the container to check out the results
docker run -it -v flutterubuntu20volume:/workdir flutterubuntu20 /bin/bash

