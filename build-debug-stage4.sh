#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh

cd "$ZIG_BUILD"
ninja install 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1

cd "$ZIG_SRC"
"$ZIG_STAGE3_EXE" build -p "$ZIG_STAGE4" -Denable-llvm -Dno-lib 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
if [ "$FULLTESTFLAG" -eq 1 ]; then
  "$ZIG_STAGE4_EXE" build test -Denable-llvm 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
else
  "$ZIG_STAGE4_EXE" build test-std -Dskip-release -Dskip-non-native 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
fi

echo Zig debug successfully built!
