:: cSpell:enableCompoundWords
setlocal
set FULLTESTFLAG=0

:: check these versions before running!
set DEVKIT_VERSION=0.15.0-dev.233+7c85dc460
set NINJA_VERSION=1.13.0
set CMAKE_VERSION=4.0.3
@REM set ZIG_CMAKE_FLAGS=-DCMAKE_BUILD_TYPE=Release -DZIG_NO_LIB=ON
set ZIG_CMAKE_FLAGS=-DCMAKE_BUILD_TYPE=RelWithDebInfo -DZIG_NO_LIB=ON
@REM set ZIG_CMAKE_FLAGS=-DCMAKE_BUILD_TYPE=RelWithDebInfo -DZIG_NO_LIB=ON -DZIG_EXTRA_BUILD_ARGS=-j1

:: precompute paths and file names
set DEVKIT_LONGNAME=zig+llvm+lld+clang-x86_64-windows-gnu-%DEVKIT_VERSION%
set DEVKIT_NAME=devkit-%DEVKIT_VERSION%
set CMAKE_LONGNAME=cmake-%CMAKE_VERSION%-windows-x86_64
set CMAKE_NAME=cmake-%CMAKE_VERSION%

:: Make sure to use forward slashes (/) for all path separators
:: (otherwise CMake will try to interpret backslashes as escapes and fail).
:: We will assume all paths are POSIX except those ending in `_WIN`.
set ZIGROOT=%~dp0
set "ZIGROOT=%ZIGROOT:~0,-1%"
set "ZIGROOT=%ZIGROOT:\=/%"
set "ZIGROOT_WIN=%ZIGROOT:/=\%"

set ZIGROOTBIN=%ZIGROOT%/bin
set "ZIGROOTBIN_WIN=%ZIGROOTBIN:/=\%"

set DOWNLOADS=%ZIGROOT%/downloads
set "DOWNLOADS_WIN=%DOWNLOADS:/=\%"

set DEVKIT=%ZIGROOT%/%DEVKIT_NAME%
set "DEVKIT_WIN=%DEVKIT:/=\%"

set ZIG_SRC=%ZIGROOT%/zig-src
set "ZIG_SRC_WIN=%ZIG_SRC:/=\%"

set ZIG_BUILD=%ZIGROOT%/build
set "ZIG_BUILD_WIN=%ZIG_BUILD:/=\%"

set CMAKE_DIR=%ZIGROOTBIN%/%CMAKE_NAME%
set "CMAKE_DIR_WIN=%CMAKE_DIR:/=\%"

set ZIG_EXE=%DEVKIT%/bin/zig.exe
set "ZIG_EXE_WIN=%ZIG_EXE:/=\%"

set ZIG_STAGE3_EXE=%ZIG_BUILD%/stage3/bin/zig.exe
set "ZIG_STAGE3_EXE_WIN=%ZIG_STAGE3_EXE:/=\%"

set NINJA_EXE=%ZIGROOTBIN%/ninja.exe
set "NINJA_EXE_WIN=%NINJA_EXE:/=\%"

set CMAKE_EXE=%CMAKE_DIR%/bin/cmake.exe
set "CMAKE_EXE_WIN=%CMAKE_EXE:/=\%"

set DEVKIT_ZIP=%DOWNLOADS_WIN%\%DEVKIT_NAME%.zip
set "DEVKIT_ZIP_WIN=%DEVKIT_ZIP:/=\%"

set CMAKE_ZIP=%DOWNLOADS_WIN%\%CMAKE_NAME%.zip
set "CMAKE_ZIP_WIN=%CMAKE_ZIP:/=\%"

set NINJA_ZIP=%DOWNLOADS_WIN%\ninja-%NINJA_VERSION%-win.zip
set "NINJA_ZIP_WIN=%NINJA_ZIP:/=\%"

mkdir %DOWNLOADS_WIN%
mkdir %ZIGROOTBIN_WIN%
mkdir %ZIG_BUILD_WIN%
mklink /d %ZIG_BUILD_WIN%\lib %ZIG_SRC_WIN%\lib

:: set PATH to a very minimal set of values to limit bad dependency resolution
:: I think something in my path on work laptop is polluting dependencies,
:: probably zlib since that has caused problems for me in the past on this PC
set WINSYS32=%SystemRoot%\System32
set PATH=%ZIGROOTBIN_WIN%;%ZIGROOTBIN_WIN%\%CMAKE_NAME%\bin;%WINSYS32%;%SystemRoot%;%WINSYS32%\Wbem;%WINSYS32%\WindowsPowerShell\v1.0\;%WINSYS32%\OpenSSH\;%ProgramFiles%\dotnet\;%LOCALAPPDATA%\Microsoft\WindowsApps;%LOCALAPPDATA%\Programs\Git\bin;%ProgramFiles%\Git\cmd

:: Override the cache directories because they won't actually help other Zig runs outside of this repo.
:: Runs of this script, however, will be testing alternate versions of zig, and ultimately would just
:: fill up space on the hard drive for no reason for other unrelated jobs otherwise.
set ZIG_GLOBAL_CACHE_DIR=%ZIG_BUILD_WIN%\zig-global-cache
set ZIG_LOCAL_CACHE_DIR=%ZIG_BUILD_WIN%\zig-local-cache

set DEVKIT_VER_TMP=
if exist %ZIG_EXE_WIN% (for /F "tokens=*" %%g in ('%ZIG_EXE_WIN% version') do (set DEVKIT_VER_TMP=%%g))
if not "%DEVKIT_VER_TMP%" == "%DEVKIT_VERSION%" (
  if not exist %DEVKIT_ZIP_WIN% (curl -o %DEVKIT_ZIP_WIN% -L https://ziglang.org/deps/%DEVKIT_LONGNAME%.zip || goto :curlfail)
  if exist %DEVKIT_WIN% (rmdir /S /Q %DEVKIT_WIN%)
  tar -xmSf %DEVKIT_ZIP_WIN% || goto :tarfail
  move %DEVKIT_LONGNAME% %DEVKIT_NAME%
)

set CMAKE_VER_TMP=
if exist %CMAKE_EXE_WIN% (for /F "tokens=3" %%g in ('%CMAKE_EXE_WIN% --version') do (
  set CMAKE_VER_TMP=%%g
  goto :checkcmake
))
:checkcmake
if not "%CMAKE_VER_TMP%" == "%CMAKE_VERSION%" (
  if not exist %CMAKE_ZIP_WIN% (curl -o %CMAKE_ZIP_WIN% -L https://github.com/Kitware/CMake/releases/download/v%CMAKE_VERSION%/cmake-%CMAKE_VERSION%-windows-x86_64.zip || goto :curlfail)
  cd %ZIGROOTBIN_WIN%
  if exist %CMAKE_DIR_WIN% (rmdir /S /Q %CMAKE_DIR_WIN%)
  tar -xmSf %CMAKE_ZIP_WIN% || goto :tarfail
  move %CMAKE_LONGNAME% %CMAKE_NAME%
)

set NINJA_VER_TMP=
if exist %NINJA_EXE_WIN% (for /F "tokens=*" %%g in ('%NINJA_EXE_WIN% --version') do (set NINJA_VER_TMP=%%g))
if not "%NINJA_VER_TMP%" == "%NINJA_VERSION%" (
  if not exist %NINJA_ZIP_WIN% (curl -o %NINJA_ZIP_WIN% -L https://github.com/ninja-build/ninja/releases/download/v%NINJA_VERSION%/ninja-win.zip || goto :curlfail)
  cd %ZIGROOTBIN_WIN%
  tar -xmSf %NINJA_ZIP_WIN% || goto :tarfail
  cd %ZIGROOT_WIN%
)

cd %ZIG_BUILD_WIN%
cmake %ZIG_SRC% -GNinja -DCMAKE_PREFIX_PATH="%DEVKIT%" -DCMAKE_C_COMPILER="%ZIG_EXE%;cc" -DCMAKE_CXX_COMPILER="%ZIG_EXE%;c++" -DCMAKE_AR="%ZIG_EXE%" -DZIG_AR_WORKAROUND=ON -DZIG_STATIC=ON -DZIG_USE_LLVM_CONFIG=OFF %ZIG_CMAKE_FLAGS% || goto :cmakefail
ninja install || goto :ninjafail

cd %ZIG_SRC_WIN%
if %FULLTESTFLAG%==1 (
  %ZIG_STAGE3_EXE_WIN% build test || goto :zigtestfail
) else (
  %ZIG_STAGE3_EXE_WIN% build test-std -Dskip-release -Dskip-non-native || goto :zigtestfail
)

cd %ZIGROOT_WIN%
call build-debug-stage4 || goto :stage4fail
echo Zig successfully built!
goto :success

:curlfail
:tarfail
:cmakefail
:ninjafail
:zigtestfail
:stage4fail
exit /b 1

:success
cd %ZIGROOT_WIN%
endlocal
