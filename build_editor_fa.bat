@echo off
setlocal
set VCVARS="C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
set CMAKE="C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
call %VCVARS%

set SRC=D:\AI\PROGRAMER\IMSProg\IMSProg_editor
set BLD=D:\AI\PROGRAMER\IMSProg\build\editor_fa
set QTKIT=D:\AI\PROGRAMER\IMSProg\Qt\6.9.3\msvc2022_64

%CMAKE% -S %SRC% -B %BLD% -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%QTKIT% -DIMSPROG_FORCE_FA_IR=ON
if errorlevel 1 exit /b 1

%CMAKE% --build %BLD%
if errorlevel 1 exit /b 1

echo EDITOR FA BUILD OK
