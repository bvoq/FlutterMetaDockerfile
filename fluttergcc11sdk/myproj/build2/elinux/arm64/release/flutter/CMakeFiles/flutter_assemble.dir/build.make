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

# Utility rule file for flutter_assemble.

# Include any custom commands dependencies for this target.
include flutter/CMakeFiles/flutter_assemble.dir/compiler_depend.make

# Include the progress variables for this target.
include flutter/CMakeFiles/flutter_assemble.dir/progress.make

flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/libflutter_engine.so
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/libflutter_elinux_wayland.so
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/flutter_export.h
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/flutter_plugin_registrar.h
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/flutter_messenger.h
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/flutter_texture_registrar.h
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/flutter_elinux.h
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/flutter_platform_views.h
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/cpp_client_wrapper/core_implementations.cc
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/cpp_client_wrapper/standard_codec.cc
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/cpp_client_wrapper/plugin_registrar.cc
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/cpp_client_wrapper/flutter_engine.cc
flutter/CMakeFiles/flutter_assemble: /workdir/myproj/elinux/flutter/ephemeral/cpp_client_wrapper/flutter_view_controller.cc

flutter_assemble: flutter/CMakeFiles/flutter_assemble
flutter_assemble: flutter/CMakeFiles/flutter_assemble.dir/build.make
.PHONY : flutter_assemble

# Rule to build all files generated by this target.
flutter/CMakeFiles/flutter_assemble.dir/build: flutter_assemble
.PHONY : flutter/CMakeFiles/flutter_assemble.dir/build

flutter/CMakeFiles/flutter_assemble.dir/clean:
	cd /workdir/myproj/build/elinux/arm64/release/flutter && $(CMAKE_COMMAND) -P CMakeFiles/flutter_assemble.dir/cmake_clean.cmake
.PHONY : flutter/CMakeFiles/flutter_assemble.dir/clean

flutter/CMakeFiles/flutter_assemble.dir/depend:
	cd /workdir/myproj/build/elinux/arm64/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workdir/myproj/elinux /workdir/myproj/elinux/flutter /workdir/myproj/build/elinux/arm64/release /workdir/myproj/build/elinux/arm64/release/flutter /workdir/myproj/build/elinux/arm64/release/flutter/CMakeFiles/flutter_assemble.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : flutter/CMakeFiles/flutter_assemble.dir/depend

