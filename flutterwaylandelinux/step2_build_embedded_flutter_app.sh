#!/bin/sh

# copy local myproj flutter files to volume
docker container create --name dummycopycontainer -v fluttergcc11sdkvolume:/workdir hello-world
docker cp myproj dummycopycontainer:/workdir/
docker rm dummycopycontainer
docker run -it --rm -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk sudo chown -R build:build /workdir/myproj
# build flutter files
docker build -t fluttergcc11sdk .
docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /home/build/buildelinuxflutter.sh
# copy result back
docker container create --name dummycopycontainer -v fluttergcc11sdkvolume:/workdir hello-world
docker cp dummycopycontainer:/workdir/myproj/build build
docker rm dummycopycontainer

# for debugging purposes:
#docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /bin/bash

