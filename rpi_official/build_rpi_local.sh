# Compiling app
git clone flutter_gallery
cd flutter_gallery
# flutter_gallery is developed against flutter master.
# this should be the latest compatible version with flutter stable.
git checkout 1dfcd617a260e4468f0883d7dfbfdfe3d021f7b3
flutter build bundle
# For Flutter < 3.3.0 
# dart ${$(which flutter)%/*}/cache/dart-sdk/bin/snapshots/frontend_server.dart.snapshot --sdk-root ${$(which flutter)%/*}/cache/artifacts/engine/common/flutter_patched_sdk_product --target=flutter --aot --tfa -Ddart.vm.product=true --packages .dart_tool/.package --output-dill build/kernel_snapshot.dill --verbose --depfile build/kernel_snapshot.d lib/main.dart
# For Flutter > 3.3.0 
dart ${$(which flutter)%/*}/cache/dart-sdk/bin/snapshots/frontend_server.dart.snapshot --sdk-root ${$(which flutter)%/*}/cache/artifacts/engine/common/flutter_patched_sdk_product --target=flutter --aot --tfa -Ddart.vm.product=true --packages .dart_tool/package_config.json --output-dill build/kernel_snapshot.dill --verbose --depfile build/kernel_snapshot.d lib/main.dart
cd ..



#!/bin/sh
docker build -t flutterrpiofficial .
docker volume create --name flutterrpiofficialvolume # -o size=1G
#docker run -it --storage-opt size=100G fluttergcc11wayland
docker run -it --rm -v flutterpiofficialvolume:/workdir flutterpiofficial sudo chown -R build:build /workdir
docker run -it -v flutterpiofficialvolume:/workdir flutterpiofficial /home/build/sdk.sh
docker run -it -v flutterpiofficialvolume:/workdir flutterpiofficial /bin/bash
