#!/usr/bin/env bash
#cSpell:enableCompoundWords

mkdir -p "$DOWNLOADS"
mkdir -p "$ZIGROOTBIN"
mkdir -p "$ZIG_BUILD"
mkdir -p "$ZIG_BUILD_LOG_DIR"
[ -L "$ZIG_BUILD/lib" ] || ln -s "$ZIG_SRC/lib" "$ZIG_BUILD/lib"
