# FlutterMetaDockerfile
Attempt at creating a Dockerfile for Sony/meta-flutter.

Unfortunately, it currently fails because GOMA is not installed.

```
| ERROR at //flutter/shell/common/shell_io_manager_unittests.cc:13:11: Include not allowed.
| #include "flutter/testing/test_gl_surface.h"
|           ^--------------------------------
| It is not in any dependency of
|   //flutter/shell/common:shell_unittests
| The include file is in the target(s):
|   //flutter/testing:opengl
| which should somehow be reachable.
| GOMA usage was specified but can't be found, falling back to local builds. Set the GOMA_DIR environment variable to fix GOMA.
| Using prebuilt Dart SDK binary. If you are editing Dart sources and wish to compile the Dart SDK, set `--no-prebuilt-dart-sdk`.
| Generating GN files in: out/linux_release_arm64
| WARNING: exit code 1 from a shell command.
ERROR: Task (/workdir/meta-flutter/recipes-graphics/flutter-engine/flutter-engine.bb:do_configure) failed with exit code '1'
```
