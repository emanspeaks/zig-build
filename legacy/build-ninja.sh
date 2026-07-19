#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh
. ./env-setup.sh

cd "$ZIG_BUILD"
ninja $NINJA_ARGS install 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# ninja $NINJA_ARGS install || exit 1
# ninja $NINJA_ARGS zig2.exe 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
echo Build stage 3 complete

# echo testing...
# cd "$ZIG_SRC"
# # "$ZIG_BUILD/zig2.exe" build "--zig-lib=$ZIG_SRC/lib" "-Dconfig_h=$ZIG_BUILD/config.h" --prefix "$ZIG_BUILD/stage3" --verbose-cc --verbose-link -Denable-llvm -Duse-zig-libcxx -Dno-lib $ZIG_BUILD_TYPE 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# # "$ZIG_EXE" build -p "$ZIG_BUILD/stage3" $ZIG_BUILD_TYPE --verbose-cc --verbose-link --search-prefix "$DEVKIT" --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# # "$ZIG_BUILD/zig2.exe" build -p "$ZIG_BUILD/stage3" $ZIG_BUILD_TYPE "-Dconfig_h=$ZIG_BUILD/config.h" --verbose-cc --verbose-link --search-prefix "$DEVKIT" --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# # "$ZIG_BUILD/zig2.exe" build -p "$ZIG_BUILD/stage3" $ZIG_BUILD_TYPE --verbose-cc --verbose-link --search-prefix "$DEVKIT" -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# if [ "$FULLTESTFLAG" -eq 1 ]; then
#   "$ZIG_STAGE3_EXE" build test 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# else
#   "$ZIG_STAGE3_EXE" build test-std -Dskip-release -Dskip-non-native 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# fi
# echo Build stage 3 complete.
