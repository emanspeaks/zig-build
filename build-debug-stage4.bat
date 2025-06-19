setlocal
set FULLTESTFLAG=0

:: Make sure to use forward slashes (/) for all path separators
:: (otherwise CMake will try to interpret backslashes as escapes and fail).
:: We will assume all paths are POSIX except those ending in `_WIN`.
set ZIGROOT=%~dp0
set "ZIGROOT=%ZIGROOT:~0,-1%"
set "ZIGROOT=%ZIGROOT:\=/%"
set "ZIGROOT_WIN=%ZIGROOT:/=\%"

set ZIG_SRC=%ZIGROOT%/zig-src
set "ZIG_SRC_WIN=%ZIG_SRC:/=\%"

set ZIG_BUILD=%ZIG_SRC%/build
set "ZIG_BUILD_WIN=%ZIG_BUILD:/=\%"

set ZIG_STAGE3_EXE=%ZIG_BUILD%/stage3/bin/zig.exe
set "ZIG_STAGE3_EXE_WIN=%ZIG_STAGE3_EXE:/=\%"

set ZIG_STAGE4_EXE=%ZIG_BUILD%/stage4/bin/zig.exe
set "ZIG_STAGE4_EXE_WIN=%ZIG_STAGE4_EXE:/=\%"

ninja install || goto :ninjafail
%ZIG_STAGE3_EXE_WIN% build -p stage4 -Denable-llvm -Dno-lib || goto :zigbuildfail
if %FULLTESTFLAG%==1 (
  %ZIG_STAGE4_EXE_WIN% build test -Denable-llvm || goto :zigtestfail
) else (
  %ZIG_STAGE4_EXE_WIN% build test-std -Dskip-release -Dskip-non-native || goto :zigtestfail
)

:ninjafail
:zigbuildfail
:zigtestfail
cd %ZIGROOT_WIN%
endlocal
