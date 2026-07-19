#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh
. ./env-setup.sh

# precompute paths and file names
DEVKIT_LONGNAME=zig+llvm+lld+clang-x86_64-windows-gnu-$DEVKIT_VERSION
DEVKIT_ZIP=$DOWNLOADS/$DEVKIT_NAME.zip

[ -x "$DEVKIT_ZIG_EXE" ] && DEVKIT_VER_TMP=$("$DEVKIT_ZIG_EXE" version)
if [ "$DEVKIT_VER_TMP" != "$DEVKIT_VERSION" ]; then
  [ -f "$DEVKIT_ZIP" ] || curl -o "$DEVKIT_ZIP" -L "https://ziglang.org/deps/$DEVKIT_LONGNAME.zip" || exit 1
  rm -rf "$DEVKIT"
  safe-unzip "$DEVKIT_ZIP" "$ZIGROOT" || exit 1
  mv "$ZIGROOT/$DEVKIT_LONGNAME" "$DEVKIT"
fi
echo Devkit ready
