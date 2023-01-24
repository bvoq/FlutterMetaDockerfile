# Docker installation for flutter embedded linux
`flutterwaylandelinux` is finished and complete, the others are tests and might help you for your specific use case.

First run `step1_build_yocto.sh` which will compile yocto itself and install flutter-embedded.
Second run `step2_build_embedded_flutter_app.sh` which will copy over myproj flutter project, compile it, and put it back at the same location.

Lastly, you need a distro to run the build.
Check out `step3_runonqemu64.sh` for an example.

