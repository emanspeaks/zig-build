#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh
# . ./env-setup.sh

./build-release-stage3.sh || exit 1
./build-debug-stage4.sh || exit 1
echo Zig stages 3 and 4 successfully built!

./build-zls.sh || exit 1
echo ZLS successfully built!
