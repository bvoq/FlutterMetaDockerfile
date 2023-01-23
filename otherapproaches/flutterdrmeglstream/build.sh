#!/bin/sh
# Build the container.
docker build -t flutterdrmeglstream .
# only create mount if it does not exist. build will be removed anyways.
docker volume create --name flutterdrmeglstreamvolume -o size=100G 
# Set permissions
docker run -it --rm -v flutterdrmeglstreamvolume:/workdir flutterdrmeglstream sudo chown -R build:build /workdir
# Install flutter drmeglstream
docker run -it -v flutterdrmeglstreamvolume:/workdir flutterdrmeglstream /home/build/drmeglstream.sh
# Enter the container to check out the results
docker run -it -v flutterdrmeglstreamvolume:/workdir flutterdrmeglstream /bin/bash

