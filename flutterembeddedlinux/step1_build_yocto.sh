#!/bin/sh
docker build -t fluttergcc11sdk .

docker volume create --name fluttergcc11sdkvolume -o size=20G 
docker run -it --rm -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk sudo chown -R build:build /workdir

# This only needs to be run once and can be commented once the fluttergcc11sdkvolume has been written.
# Note: This might make your container run out of memory. If so simply delete /workdir/build/tmp and rerun the bash script / the command.
docker run -it -v fluttergcc11sdkvolume:/workdir fluttergcc11sdk /home/build/buildsdk.sh
