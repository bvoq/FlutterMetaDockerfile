#!/bin/sh
# Build the container.
docker build -t fluttergcc11drmgbm .
# only create mount if it does not exist. build will be removed anyways.
docker volume create --name fluttergcc11drmgbmvolume -o size=100G 
# Set permissions
docker run -it --rm -v fluttergcc11drmgbmvolume:/workdir fluttergcc11drmgbm sudo chown -R build:build /workdir
# Install flutter drmgbm
docker run -it -v fluttergcc11drmgbmvolume:/workdir fluttergcc11drmgbm /home/build/drmgbm.sh
# Enter the container to check out the results
docker run -it -v fluttergcc11drmgbmvolume:/workdir fluttergcc11drmgbm /bin/bash

