#!/bin/sh
docker container create --name dummysdk2 -v fluttergcc11sdkvolume:/root hello-world
docker cp dummysdk2:/root/build/tmp tmp_sdk
