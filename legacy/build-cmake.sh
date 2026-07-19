#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh
. ./env-setup.sh

# precompute paths and file names
CMAKE_LONGNAME=cmake-$CMAKE_VERSION-windows-x86_64
CMAKE_ZIP=$DOWNLOADS/$CMAKE_NAME.zip
NINJA_ZIP=$DOWNLOADS/ninja-$NINJA_VERSION-win.zip

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
cmake "$ZIG_SRC" -GNinja -DCMAKE_PREFIX_PATH="$DEVKIT" -DCMAKE_C_COMPILER="$DEVKIT_ZIG_EXE;cc" -DCMAKE_CXX_COMPILER="$DEVKIT_ZIG_EXE;c++" -DCMAKE_AR="$DEVKIT_ZIG_EXE" -DZIG_AR_WORKAROUND=ON -DCMAKE_RANLIB="$DEVKIT_ZIG_EXE" -DCMAKE_PROJECT_INCLUDE="$ZIGROOT/cmake-hooks/zig-ranlib-workaround.cmake" -DZIG_STATIC=ON -DZIG_USE_LLVM_CONFIG=OFF $ZIG_CMAKE_FLAGS 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
echo CMake ready
