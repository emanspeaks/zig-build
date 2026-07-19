#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh

cd "$ZLS_SRC"
# "$ZIG_EXE" build -p "$ZLS_PREFIX" -Doptimize=ReleaseSafe || exit 1
"$ZIG_STAGE3_EXE" build -p "$ZLS_PREFIX" -Doptimize=ReleaseSafe || exit 1
echo Build ZLS complete.
