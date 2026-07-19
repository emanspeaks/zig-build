#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh

# stage3: original way
# . ./env-setup.sh
# ./build-devkit.sh || exit 1
# ./legacy/build-cmake.sh || exit 1
# ./legacy/build-ninja.sh || exit 1

# stage3: zig-only way
./build-stage3.sh || exit 1

./build-stage4-debug.sh || exit 1
echo Zig stages 3 and 4 successfully built!

./build-zls.sh || exit 1
echo ZLS successfully built!
