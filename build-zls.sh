#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh

cd "$ZLS_SRC"
"$ZIG_EXE" build -p "$ZLS_BUILD" -Doptimize=ReleaseSafe || exit 1
echo Build ZLS complete.
