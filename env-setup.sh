#!/usr/bin/env bash
#cSpell:enableCompoundWords

mkdir -p "$DOWNLOADS"
mkdir -p "$ZIGROOTBIN"
mkdir -p "$ZIG_BUILD"
# mkdir -p "$ZIG_BUILD_LOG_DIR"
# bin/zig2, bin/zig3, bin/zig find their lib dir by walking ancestors of the
# exe path looking for lib/std/std.zig, so link it at the repo root.
[ -L "$ZIGROOT/lib" ] || ln -s "$ZIG_SRC/lib" "$ZIGROOT/lib"
# stale link from when zig2/stage3 lived in build/
[ -L "$ZIG_BUILD/lib" ] && rm "$ZIG_BUILD/lib"
true
