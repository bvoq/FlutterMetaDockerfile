#!/bin/sh
docker build -t fluttergcc11wayland .
#docker volume create --name fluttergcc11waylandvolume -o size=100G 
#docker run -it --storage-opt size=100G fluttergcc11wayland
docker run -it --rm -v fluttergcc11waylandvolume:/workdir fluttergcc11wayland sudo chown -R build:build /workdir
docker run -it -v fluttergcc11waylandvolume:/workdir fluttergcc11wayland /home/build/wayland.sh
docker run -it -v fluttergcc11waylandvolume:/workdir fluttergcc11wayland /bin/bash

