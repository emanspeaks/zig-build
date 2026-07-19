#!/usr/bin/env bash
#cSpell:enableCompoundWords
. ./common.sh
. ./env-setup.sh

. ./build-devkit.sh

# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe c++ -DCLANG_BUILD_STATIC -DLLVM_BUILD_STATIC -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -Wno-format -fno-exceptions -fno-rtti -fno-stack-protector -fvisibility-inlines-hidden -Wno-type-limits -Wno-missing-braces -Wno-comment -MD -MT CMakeFiles/zigcpp.dir/src/zig_llvm.cpp.obj -MF CMakeFiles\zigcpp.dir\src\zig_llvm.cpp.obj.d -o CMakeFiles/zigcpp.dir/src/zig_llvm.cpp.obj -c C:/scratch/git/zig-build/zig-src/src/zig_llvm.cpp
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe c++ -DCLANG_BUILD_STATIC -DLLVM_BUILD_STATIC -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -Wno-format -fno-exceptions -fno-rtti -fno-stack-protector -fvisibility-inlines-hidden -Wno-type-limits -Wno-missing-braces -Wno-comment -MD -MT CMakeFiles/zigcpp.dir/src/zig_llvm-ar.cpp.obj -MF CMakeFiles\zigcpp.dir\src\zig_llvm-ar.cpp.obj.d -o CMakeFiles/zigcpp.dir/src/zig_llvm-ar.cpp.obj -c C:/scratch/git/zig-build/zig-src/src/zig_llvm-ar.cpp
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe c++ -DCLANG_BUILD_STATIC -DLLVM_BUILD_STATIC -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -Wno-format -fno-exceptions -fno-rtti -fno-stack-protector -fvisibility-inlines-hidden -Wno-type-limits -Wno-missing-braces -Wno-comment -MD -MT CMakeFiles/zigcpp.dir/src/zig_clang_driver.cpp.obj -MF CMakeFiles\zigcpp.dir\src\zig_clang_driver.cpp.obj.d -o CMakeFiles/zigcpp.dir/src/zig_clang_driver.cpp.obj -c C:/scratch/git/zig-build/zig-src/src/zig_clang_driver.cpp
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe c++ -DCLANG_BUILD_STATIC -DLLVM_BUILD_STATIC -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -Wno-format -fno-exceptions -fno-rtti -fno-stack-protector -fvisibility-inlines-hidden -Wno-type-limits -Wno-missing-braces -Wno-comment -MD -MT CMakeFiles/zigcpp.dir/src/zig_clang_cc1_main.cpp.obj -MF CMakeFiles\zigcpp.dir\src\zig_clang_cc1_main.cpp.obj.d -o CMakeFiles/zigcpp.dir/src/zig_clang_cc1_main.cpp.obj -c C:/scratch/git/zig-build/zig-src/src/zig_clang_cc1_main.cpp
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe c++ -DCLANG_BUILD_STATIC -DLLVM_BUILD_STATIC -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -Wno-format -fno-exceptions -fno-rtti -fno-stack-protector -fvisibility-inlines-hidden -Wno-type-limits -Wno-missing-braces -Wno-comment -MD -MT CMakeFiles/zigcpp.dir/src/zig_clang_cc1as_main.cpp.obj -MF CMakeFiles\zigcpp.dir\src\zig_clang_cc1as_main.cpp.obj.d -o CMakeFiles/zigcpp.dir/src/zig_clang_cc1as_main.cpp.obj -c C:/scratch/git/zig-build/zig-src/src/zig_clang_cc1as_main.cpp
# C:\WINDOWS\system32\cmd.exe /C "cd . && C:\scratch\git\zig-build\bin\cmake-4.3.3\bin\cmake.exe -E rm -f zigcpp\libzigcpp.a && C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe ar qc zigcpp\libzigcpp.a  CMakeFiles/zigcpp.dir/src/zig_llvm.cpp.obj CMakeFiles/zigcpp.dir/src/zig_llvm-ar.cpp.obj CMakeFiles/zigcpp.dir/src/zig_clang_driver.cpp.obj CMakeFiles/zigcpp.dir/src/zig_clang_cc1_main.cpp.obj CMakeFiles/zigcpp.dir/src/zig_clang_cc1as_main.cpp.obj && C:\Users\emanspeaks\AppData\Local\Programs\Swift\Toolchains\6.3.3+Asserts\usr\bin\llvm-ranlib.exe zigcpp\libzigcpp.a && cd ."
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc   -O2 -g -DNDEBUG -std=c99 -O2 -MD -MT CMakeFiles/zig-wasm2c.dir/stage1/wasm2c.c.obj -MF CMakeFiles\zig-wasm2c.dir\stage1\wasm2c.c.obj.d -o CMakeFiles/zig-wasm2c.dir/stage1/wasm2c.c.obj -c C:/scratch/git/zig-build/zig-src/stage1/wasm2c.c
# C:\WINDOWS\system32\cmd.exe /C "cd . && C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc -O2 -g -DNDEBUG  CMakeFiles/zig-wasm2c.dir/stage1/wasm2c.c.obj -o zig-wasm2c.exe -Wl,--out-implib,libzig-wasm2c.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 && cd ."
# C:\WINDOWS\system32\cmd.exe /C "cd /D C:\scratch\git\zig-build\zig-src && C:\scratch\git\zig-build\build\cmake-inspect\zig-wasm2c.exe C:/scratch/git/zig-build/zig-src/stage1/zig1.wasm C:/scratch/git/zig-build/build/cmake-inspect/zig1.c"
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc   -O2 -g -DNDEBUG -std=c99 -Os -fno-strict-aliasing -MD -MT CMakeFiles/zig1.dir/zig1.c.obj -MF CMakeFiles\zig1.dir\zig1.c.obj.d -o CMakeFiles/zig1.dir/zig1.c.obj -c C:/scratch/git/zig-build/build/cmake-inspect/zig1.c
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc   -O2 -g -DNDEBUG -std=c99 -Os -fno-strict-aliasing -MD -MT CMakeFiles/zig1.dir/stage1/wasi.c.obj -MF CMakeFiles\zig1.dir\stage1\wasi.c.obj.d -o CMakeFiles/zig1.dir/stage1/wasi.c.obj -c C:/scratch/git/zig-build/zig-src/stage1/wasi.c
# C:\WINDOWS\system32\cmd.exe /C "cd . && C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc -O2 -g -DNDEBUG -Wl,--stack,0x10000000 CMakeFiles/zig1.dir/zig1.c.obj CMakeFiles/zig1.dir/stage1/wasi.c.obj -o zig1.exe -Wl,--out-implib,libzig1.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lm  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 && cd ."
# C:\WINDOWS\system32\cmd.exe /C "cd /D C:\scratch\git\zig-build\zig-src && C:\scratch\git\zig-build\build\cmake-inspect\zig1.exe C:/scratch/git/zig-build/zig-src/lib build-exe -ofmt=c -lc -OReleaseSmall --name zig2 -femit-bin="C:/scratch/git/zig-build/build/cmake-inspect/zig2.c" -target x86_64-windows-gnu --dep build_options -Mroot=src/main.zig -Mbuild_options=C:/scratch/git/zig-build/build/cmake-inspect/config.zig"
# C:\WINDOWS\system32\cmd.exe /C "cd /D C:\scratch\git\zig-build\zig-src && C:\scratch\git\zig-build\build\cmake-inspect\zig1.exe C:/scratch/git/zig-build/zig-src/lib build-obj -ofmt=c -OReleaseSmall --name compiler_rt -femit-bin="C:/scratch/git/zig-build/build/cmake-inspect/compiler_rt.c" -target x86_64-windows-gnu -Mroot=lib/compiler_rt.zig"
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/zig-src/stage1 -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -std=c99 -O0 -fno-sanitize=undefined -fno-stack-protector -fno-strict-aliasing -MD -MT CMakeFiles/zig2.dir/zig2.c.obj -MF CMakeFiles\zig2.dir\zig2.c.obj.d -o CMakeFiles/zig2.dir/zig2.c.obj -c C:/scratch/git/zig-build/build/cmake-inspect/zig2.c
# C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe cc -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/zig-src/stage1 -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -std=c99 -O0 -fno-sanitize=undefined -fno-stack-protector -fno-strict-aliasing -MD -MT CMakeFiles/zig2.dir/compiler_rt.c.obj -MF CMakeFiles\zig2.dir\compiler_rt.c.obj.d -o CMakeFiles/zig2.dir/compiler_rt.c.obj -c C:/scratch/git/zig-build/build/cmake-inspect/compiler_rt.c
# C:\WINDOWS\system32\cmd.exe /C "cd . && C:\scratch\git\zig-build\devkit-0.17.0-dev.203+073889523\bin\zig.exe c++ -O2 -g -DNDEBUG -Wl,--stack,0x10000000 @CMakeFiles\zig2.rsp -o zig2.exe -Wl,--out-implib,libzig2.dll.a -Wl,--major-image-version,0,--minor-image-version,0 && cd ."
# C:\WINDOWS\system32\cmd.exe /C "cd /D C:\scratch\git\zig-build\zig-src && C:\scratch\git\zig-build\build\cmake-inspect\zig2.exe build --zig-lib=C:/scratch/git/zig-build/zig-src/lib -Dversion-string=0.17.0-dev.1437+b34edd294 -Dtarget=native -Dcpu=native -Denable-llvm -Dconfig_h=C:/scratch/git/zig-build/build/cmake-inspect/config.h -Doptimize=ReleaseFast -Duse-zig-libcxx -Dno-lib --prefix C:/scratch/git/zig-build/build/cmake-inspect/stage3"
# C:\WINDOWS\system32\cmd.exe /C "cd /D C:\scratch\git\zig-build\build\cmake-inspect && C:\scratch\git\zig-build\bin\cmake-4.3.3\bin\cmake.exe -P cmake_install.cmake"


compile_obj() {
  local cmd="$1"
  local args="$2"
  local obj_dir="$3"
  local src_dir="$4"
  local src_file="$5"
  mkdir -p "$obj_dir"
  local obj_file="$obj_dir/$src_file.obj"
  "$DEVKIT_ZIG_EXE" $cmd $args -MD -MT "$obj_file" -MF "$obj_file.d" -o "$obj_file" -c "$src_dir/$src_file"
}

EXE_FLAGS="-Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32"
compile_exe() {
  local cmd="$1"
  local args="$2"
  local obj_dir="$3"
  local exe_name="$4"
  local obj_files="${@:5}"
  local exe_file="$obj_dir/$exe_name"
  "$DEVKIT_ZIG_EXE" $cmd $args -o "$exe_file" "-Wl,--out-implib,lib${exe_name}.dll.a"  $EXE_FLAGS $obj_files
}


C_DEFINES="-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS"
C_FLAGS="-O2 -g -DNDEBUG"
TARGET="x86_64-windows-gnu"

ZIGCPP_DIR="$ZIG_BUILD/zigcpp"
LLVM_DEFINES="-DCLANG_BUILD_STATIC -DLLVM_BUILD_STATIC ${C_DEFINES}"
LLVM_INCLUDES="-I${DEVKIT}/include"
LLVM_FLAGS="${C_FLAGS} -Wno-format -fno-exceptions -fno-rtti -fno-stack-protector -fvisibility-inlines-hidden -Wno-type-limits -Wno-missing-braces -Wno-comment"
LLVM_STATIC_LIB="$ZIGCPP_DIR/libzigcpp.a"
rm -f "$ZIGCPP_DIR/libzigcpp.a"
LLVM_SRC_FILES=("zig_llvm.cpp" "zig_llvm-ar.cpp" "zig_clang_driver.cpp" "zig_clang_cc1_main.cpp" "zig_clang_cc1as_main.cpp")
for SRC_FILE in "${LLVM_SRC_FILES[@]}"; do
  compile_obj c++ "$LLVM_DEFINES $LLVM_INCLUDES $LLVM_FLAGS" "$ZIGCPP_DIR" "$ZIG_SRC/src" "$SRC_FILE"
  "$DEVKIT_ZIG_EXE" ar qc "$LLVM_STATIC_LIB" "${ZIGCPP_DIR}/${SRC_FILE}.obj"
done
"$DEVKIT_ZIG_EXE" ranlib "$LLVM_STATIC_LIB"

WASM2C_DIR="$ZIG_BUILD/wasm2c"
WASM2C_SRC_FILE="wasm2c.c"
WASM2C_OBJ_FILE="$WASM2C_DIR/${WASM2C_SRC_FILE}.obj"
WASM2C_EXE_NAME="zig-wasm2c"
WASM2C_EXE="${WASM2C_DIR}/${WASM2C_EXE_NAME}.exe"
WASM2C_FLAGS="$C_FLAGS -std=c99 -O2"
compile_obj cc "$WASM2C_FLAGS" "$WASM2C_DIR" "$ZIG_SRC/stage1" "$WASM2C_SRC_FILE"
compile_exe cc "$WASM2C_FLAGS" "$WASM2C_DIR" "$WASM2C_EXE_NAME" "$WASM2C_OBJ_FILE"

cd $ZIG_SRC

ZIG1_DIR="$ZIG_BUILD/zig1"
ZIG1_SRC_FILE="zig1.c"
ZIG1_OBJ_FILE="${ZIG1_DIR}/${ZIG1_SRC_FILE}.obj"
ZIG1_FLAGS="$C_FLAGS -std=c99 -Os -fno-strict-aliasing"
"$WASM2C_EXE" "$ZIG_SRC/stage1/zig1.wasm" "$ZIG1_DIR/$ZIG1_SRC_FILE"
compile_obj cc "$ZIG1_FLAGS" "$ZIG1_DIR" "$ZIG1_DIR" "$ZIG1_SRC_FILE"

WASI_SRC_FILE="wasi.c"
WASI_OBJ_FILE="${ZIG1_DIR}/${WASI_SRC_FILE}.obj"
compile_obj cc "$ZIG1_FLAGS" "$ZIG1_DIR" "$ZIG_SRC/stage1" "$WASI_SRC_FILE"

ZIG1_EXE_NAME="zig1"
ZIG1_EXE="${ZIG1_DIR}/${ZIG1_EXE_NAME}.exe"
ZIG1_EXE_FLAGS="$C_FLAGS -Wl,--stack,0x10000000"
compile_exe cc "$ZIG1_EXE_FLAGS" "$ZIG1_EXE" "$ZIG1_OBJ_FILE" "$WASI_OBJ_FILE"

# $ZIG1_EXE $ZIG_SRC/lib build-exe -ofmt=c -lc -OReleaseSmall --name zig2 -femit-bin="$ZIG_BUILD/cmake-inspect/zig2.c" -target $TARGET --dep build_options -Mroot=src/main.zig -Mbuild_options="$ZIG_BUILD/cmake-inspect/config.zig"
# $ZIG1_EXE $ZIG_SRC/lib build-obj -ofmt=c -OReleaseSmall --name compiler_rt -femit-bin="$ZIG_BUILD/cmake-inspect/compiler_rt.c" -target $TARGET -Mroot=lib/compiler_rt.zig
# $DEVKIT_ZIG_EXE cc -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/zig-src/stage1 -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -std=c99 -O0 -fno-sanitize=undefined -fno-stack-protector -fno-strict-aliasing -MD -MT CMakeFiles/zig2.dir/zig2.c.obj -MF CMakeFiles\zig2.dir\zig2.c.obj.d -o CMakeFiles/zig2.dir/zig2.c.obj -c C:/scratch/git/zig-build/build/cmake-inspect/zig2.c
# $DEVKIT_ZIG_EXE cc -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -IC:/scratch/git/zig-build/zig-src/stage1 -IC:/scratch/git/zig-build/devkit-0.17.0-dev.203+073889523/include -O2 -g -DNDEBUG -std=c99 -O0 -fno-sanitize=undefined -fno-stack-protector -fno-strict-aliasing -MD -MT CMakeFiles/zig2.dir/compiler_rt.c.obj -MF CMakeFiles\zig2.dir\compiler_rt.c.obj.d -o CMakeFiles/zig2.dir/compiler_rt.c.obj -c C:/scratch/git/zig-build/build/cmake-inspect/compiler_rt.c
# cd . && $DEVKIT_ZIG_EXE c++ -O2 -g -DNDEBUG -Wl,--stack,0x10000000 @CMakeFiles\zig2.rsp -o zig2.exe -Wl,--out-implib,libzig2.dll.a -Wl,--major-image-version,0,--minor-image-version,0 && cd ."
# cd /D C:\scratch\git\zig-build\zig-src && $ZIG_BUILD/cmake-inspect/zig2.exe build --zig-lib=C:/scratch/git/zig-build/zig-src/lib -Dversion-string=0.17.0-dev.1437+b34edd294 -Dtarget=native -Dcpu=native -Denable-llvm -Dconfig_h=C:/scratch/git/zig-build/build/cmake-inspect/config.h -Doptimize=ReleaseFast -Duse-zig-libcxx -Dno-lib --prefix C:/scratch/git/zig-build/build/cmake-inspect/stage3"
# cd /D C:\scratch\git\zig-build\build\cmake-inspect && $CMAKE_EXE -P cmake_install.cmake"

# cd "$ZIG_SRC"
# $DEVKIT_ZIG_EXE build -p stage3 $ZIG_BUILD_TYPE_RELWITHDEBINFO --search-prefix $DEVKIT --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86_64-windows-gnu || exit 1

# echo Build stage 3 complete, testing...
# if [ "$FULLTESTFLAG" -eq 1 ]; then
#   "$ZIG_STAGE3_EXE" build test 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# else
#   "$ZIG_STAGE3_EXE" build test-std -Dskip-release -Dskip-non-native 2>&1 | tee -a "$ZIG_BUILD_LOG" || exit 1
# fi
echo Build stage 1 complete.
