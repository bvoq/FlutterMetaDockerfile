# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/cmake

# The command to remove a file.
RM = /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workdir/myproj/elinux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workdir/myproj/build/elinux/arm64/release

# Include any dependencies generated for this target.
include runner/CMakeFiles/myproj.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include runner/CMakeFiles/myproj.dir/compiler_depend.make

# Include the progress variables for this target.
include runner/CMakeFiles/myproj.dir/progress.make

# Include the compile flags for this target's objects.
include runner/CMakeFiles/myproj.dir/flags.make

runner/CMakeFiles/myproj.dir/flutter_window.cc.o: runner/CMakeFiles/myproj.dir/flags.make
runner/CMakeFiles/myproj.dir/flutter_window.cc.o: /workdir/myproj/elinux/runner/flutter_window.cc
runner/CMakeFiles/myproj.dir/flutter_window.cc.o: runner/CMakeFiles/myproj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workdir/myproj/build/elinux/arm64/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object runner/CMakeFiles/myproj.dir/flutter_window.cc.o"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT runner/CMakeFiles/myproj.dir/flutter_window.cc.o -MF CMakeFiles/myproj.dir/flutter_window.cc.o.d -o CMakeFiles/myproj.dir/flutter_window.cc.o -c /workdir/myproj/elinux/runner/flutter_window.cc

runner/CMakeFiles/myproj.dir/flutter_window.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/myproj.dir/flutter_window.cc.i"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workdir/myproj/elinux/runner/flutter_window.cc > CMakeFiles/myproj.dir/flutter_window.cc.i

runner/CMakeFiles/myproj.dir/flutter_window.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/myproj.dir/flutter_window.cc.s"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workdir/myproj/elinux/runner/flutter_window.cc -o CMakeFiles/myproj.dir/flutter_window.cc.s

runner/CMakeFiles/myproj.dir/main.cc.o: runner/CMakeFiles/myproj.dir/flags.make
runner/CMakeFiles/myproj.dir/main.cc.o: /workdir/myproj/elinux/runner/main.cc
runner/CMakeFiles/myproj.dir/main.cc.o: runner/CMakeFiles/myproj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workdir/myproj/build/elinux/arm64/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object runner/CMakeFiles/myproj.dir/main.cc.o"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT runner/CMakeFiles/myproj.dir/main.cc.o -MF CMakeFiles/myproj.dir/main.cc.o.d -o CMakeFiles/myproj.dir/main.cc.o -c /workdir/myproj/elinux/runner/main.cc

runner/CMakeFiles/myproj.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/myproj.dir/main.cc.i"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workdir/myproj/elinux/runner/main.cc > CMakeFiles/myproj.dir/main.cc.i

runner/CMakeFiles/myproj.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/myproj.dir/main.cc.s"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workdir/myproj/elinux/runner/main.cc -o CMakeFiles/myproj.dir/main.cc.s

runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o: runner/CMakeFiles/myproj.dir/flags.make
runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o: /workdir/myproj/elinux/flutter/generated_plugin_registrant.cc
runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o: runner/CMakeFiles/myproj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workdir/myproj/build/elinux/arm64/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o -MF CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o.d -o CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o -c /workdir/myproj/elinux/flutter/generated_plugin_registrant.cc

runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.i"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workdir/myproj/elinux/flutter/generated_plugin_registrant.cc > CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.i

runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.s"
	cd /workdir/myproj/build/elinux/arm64/release/runner && /workdir/poky2/sysroots/x86_64-pokysdk-linux/usr/bin/clang++ --target=aarch64-poky-linux --sysroot=/workdir/poky2/sysroots/cortexa57-poky-linux $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workdir/myproj/elinux/flutter/generated_plugin_registrant.cc -o CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.s

# Object files for target myproj
myproj_OBJECTS = \
"CMakeFiles/myproj.dir/flutter_window.cc.o" \
"CMakeFiles/myproj.dir/main.cc.o" \
"CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o"

# External object files for target myproj
myproj_EXTERNAL_OBJECTS =

runner/myproj: runner/CMakeFiles/myproj.dir/flutter_window.cc.o
runner/myproj: runner/CMakeFiles/myproj.dir/main.cc.o
runner/myproj: runner/CMakeFiles/myproj.dir/__/flutter/generated_plugin_registrant.cc.o
runner/myproj: runner/CMakeFiles/myproj.dir/build.make
runner/myproj: flutter/libflutter_wrapper_app.a
runner/myproj: /workdir/myproj/elinux/flutter/ephemeral/libflutter_engine.so
runner/myproj: /workdir/myproj/elinux/flutter/ephemeral/libflutter_elinux_wayland.so
runner/myproj: runner/CMakeFiles/myproj.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workdir/myproj/build/elinux/arm64/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable myproj"
	cd /workdir/myproj/build/elinux/arm64/release/runner && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/myproj.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
runner/CMakeFiles/myproj.dir/build: runner/myproj
.PHONY : runner/CMakeFiles/myproj.dir/build

runner/CMakeFiles/myproj.dir/clean:
	cd /workdir/myproj/build/elinux/arm64/release/runner && $(CMAKE_COMMAND) -P CMakeFiles/myproj.dir/cmake_clean.cmake
.PHONY : runner/CMakeFiles/myproj.dir/clean

runner/CMakeFiles/myproj.dir/depend:
	cd /workdir/myproj/build/elinux/arm64/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workdir/myproj/elinux /workdir/myproj/elinux/runner /workdir/myproj/build/elinux/arm64/release /workdir/myproj/build/elinux/arm64/release/runner /workdir/myproj/build/elinux/arm64/release/runner/CMakeFiles/myproj.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : runner/CMakeFiles/myproj.dir/depend
