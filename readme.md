# zig-build

A collection of scripts to automate building the [Zig](https://ziglang.org) compiler from source.

Currently, this is only written for Windows, but eventually it will also support other platforms.

This addresses cloning the [Zig source repo](https://github.com/ziglang/zig.git), downloading portable versions of Cmake, Ninja, and the Zig LLVM devkit as necessary, and then checks out a known good commit of Zig to do the build.  It also locally sets `$PATH` to a minimal set of values due to issues with other libraries installed on the machine polluting the build.

## Usage

1. Run `build-release-stage3`, which will set up the build environment and produce a release version of the Zig executable.
2. Run `build-debug-stage4` after any local changes to the source to build a debug version of the executable bootstrapped from the release version.
