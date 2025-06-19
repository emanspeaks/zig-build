:: cSpell:enableCompoundWords
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

set ZIG_BUILD=%ZIGROOT%/build
set "ZIG_BUILD_WIN=%ZIG_BUILD:/=\%"

set ZIG_STAGE3_BIN=%ZIG_BUILD%/stage3/bin
set "ZIG_STAGE3_BIN_WIN=%ZIG_STAGE3_BIN:/=\%"

set ZIG_STAGE3_EXE=%ZIG_STAGE3_BIN%/zig.exe
set "ZIG_STAGE3_EXE_WIN=%ZIG_STAGE3_EXE:/=\%"

set ZIG_STAGE4_EXE=%ZIG_BUILD%/stage4/bin/zig.exe
set "ZIG_STAGE4_EXE_WIN=%ZIG_STAGE4_EXE:/=\%"

:: set PATH to a very minimal set of values to limit bad dependency resolution
:: I think something in my path on work laptop is polluting dependencies,
:: probably zlib since that has caused problems for me in the past on this PC
set WINSYS32=%SystemRoot%\System32
set PATH=%ZIG_STAGE3_BIN%;%ZIGROOTBIN_WIN%;%ZIGROOTBIN_WIN%\%CMAKE_NAME%\bin;%WINSYS32%;%SystemRoot%;%WINSYS32%\Wbem;%WINSYS32%\WindowsPowerShell\v1.0\;%WINSYS32%\OpenSSH\;%ProgramFiles%\dotnet\;%LOCALAPPDATA%\Microsoft\WindowsApps;%LOCALAPPDATA%\Programs\Git\bin;%ProgramFiles%\Git\cmd

:: Override the cache directories because they won't actually help other Zig runs outside of this repo.
:: Runs of this script, however, will be testing alternate versions of zig, and ultimately would just
:: fill up space on the hard drive for no reason for other unrelated jobs otherwise.
set ZIG_GLOBAL_CACHE_DIR=%ZIG_BUILD_WIN%\zig-global-cache
set ZIG_LOCAL_CACHE_DIR=%ZIG_BUILD_WIN%\zig-local-cache

cd %ZIG_BUILD_WIN%
ninja install || goto :ninjafail
%ZIG_STAGE3_EXE_WIN% build -p stage4 -Denable-llvm -Dno-lib || goto :zigbuildfail
if %FULLTESTFLAG%==1 (
  %ZIG_STAGE4_EXE_WIN% build test -Denable-llvm || goto :zigtestfail
) else (
  %ZIG_STAGE4_EXE_WIN% build test-std -Dskip-release -Dskip-non-native || goto :zigtestfail
)

echo Zig debug successfully built!
goto :success

:ninjafail
:zigbuildfail
:zigtestfail
exit /b 1

:success
cd %ZIGROOT_WIN%
endlocal
