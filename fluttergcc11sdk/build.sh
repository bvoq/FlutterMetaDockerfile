#!/bin/sh
docker build -t fluttergcc11sdk .
docker volume create --name fluttergcc11sdkvolume -o size=100G 
#docker run -it --storage-opt size=100G fluttergcc11wayland
docker run -it --rm -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk sudo chown -R build:build /workdir
docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /home/build/sdk.sh
docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /bin/bash

docker container create --name dummysdk -v fluttergcc11sdkvolume:/root hello-world
docker cp dummysdk:/root/build/tmp/deploy deploy_sdk
