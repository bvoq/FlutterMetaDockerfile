#!/bin/sh
cd /workdir
git clone --depth 1 https://github.com/ardera/flutter-engine-binaries-for-arm.git engine-binaries
engine-binaries/arm64/gen_snapshot_linux_x64_release \
  --deterministic \
  --snapshot_kind=app-aot-elf \
  --elf=build/flutter_assets/app.so \
  --strip \
#  --sim-use-hardfp \
  /workdir/kernel_snapshot.dill
