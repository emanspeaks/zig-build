#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh
. ./env-setup.sh

# precompute paths and file names
DEVKIT_LONGNAME=zig+llvm+lld+clang-x86_64-windows-gnu-$DEVKIT_VERSION
CMAKE_LONGNAME=cmake-$CMAKE_VERSION-windows-x86_64
DEVKIT_ZIP=$DOWNLOADS/$DEVKIT_NAME.zip
CMAKE_ZIP=$DOWNLOADS/$CMAKE_NAME.zip
NINJA_ZIP=$DOWNLOADS/ninja-$NINJA_VERSION-win.zip

[ -x "$ZIG_EXE" ] && DEVKIT_VER_TMP=$("$ZIG_EXE" version)
if [ "$DEVKIT_VER_TMP" != "$DEVKIT_VERSION" ]; then
  [ -f "$DEVKIT_ZIP" ] || curl -o "$DEVKIT_ZIP" -L "https://ziglang.org/deps/$DEVKIT_LONGNAME.zip" || exit 1
  rm -rf "$DEVKIT"
  safe-unzip "$DEVKIT_ZIP" "$ZIGROOT" || exit 1
  mv "$ZIGROOT/$DEVKIT_LONGNAME" "$DEVKIT"
fi

[ -x "$CMAKE_EXE" ] && CMAKE_VER_TMP=$("$CMAKE_EXE" --version | head -n 1 | awk '{print $3}')
if [ "$CMAKE_VER_TMP" != "$CMAKE_VERSION" ]; then
  [ -f "$CMAKE_ZIP" ] || curl -o "$CMAKE_ZIP" -L "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/$CMAKE_LONGNAME.zip" || exit 1
  rm -rf "$CMAKE_DIR"
  safe-unzip "$CMAKE_ZIP" "$ZIGROOTBIN" || exit 1
  mv "$ZIGROOTBIN/$CMAKE_LONGNAME" "$CMAKE_DIR"
fi

[ -x "$NINJA_EXE" ] && NINJA_VER_TMP=$("$NINJA_EXE" --version)
if [ "$NINJA_VER_TMP" != "$NINJA_VERSION" ]; then
  [ -f "$NINJA_ZIP" ] || curl -o "$NINJA_ZIP" -L "https://github.com/ninja-build/ninja/releases/download/v$NINJA_VERSION/ninja-win.zip" || exit 1
  rm -rf "$NINJA_EXE"
  safe-unzip "$NINJA_ZIP" "$ZIGROOTBIN" || exit 1
fi

cd "$ZIG_BUILD"
cmake "$ZIG_SRC" -GNinja -DCMAKE_PREFIX_PATH="$DEVKIT" -DCMAKE_C_COMPILER="$ZIG_EXE;cc" -DCMAKE_CXX_COMPILER="$ZIG_EXE;c++" -DCMAKE_AR="$ZIG_EXE" -DZIG_AR_WORKAROUND=ON -DZIG_STATIC=ON -DZIG_USE_LLVM_CONFIG=OFF $ZIG_CMAKE_FLAGS 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
ninja $NINJA_ARGS install 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# ninja $NINJA_ARGS install || exit 1
# ninja $NINJA_ARGS zig2.exe 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1

cd "$ZIG_SRC"
# "$ZIG_BUILD/zig2.exe" build "--zig-lib=$ZIG_SRC/lib" "-Dconfig_h=$ZIG_BUILD/config.h" --prefix "$ZIG_BUILD/stage3" --verbose-cc --verbose-link -Denable-llvm -Duse-zig-libcxx -Dno-lib $ZIG_BUILD_TYPE 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# "$ZIG_EXE" build -p "$ZIG_BUILD/stage3" $ZIG_BUILD_TYPE --verbose-cc --verbose-link --search-prefix "$DEVKIT" --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# "$ZIG_BUILD/zig2.exe" build -p "$ZIG_BUILD/stage3" $ZIG_BUILD_TYPE "-Dconfig_h=$ZIG_BUILD/config.h" --verbose-cc --verbose-link --search-prefix "$DEVKIT" --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# "$ZIG_BUILD/zig2.exe" build -p "$ZIG_BUILD/stage3" $ZIG_BUILD_TYPE --verbose-cc --verbose-link --search-prefix "$DEVKIT" -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
echo Build stage 3 complete, testing...
if [ "$FULLTESTFLAG" -eq 1 ]; then
  "$ZIG_STAGE3_EXE" build test 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
else
  "$ZIG_STAGE3_EXE" build test-std -Dskip-release -Dskip-non-native 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
fi
echo Build stage 3 complete.
