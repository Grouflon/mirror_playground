@echo off

:: rmdir /S /Q build

mkdir build
pushd build
cmake -G "Visual Studio 15 2017" ..
popd

echo.
echo Finished! Open build/mirror_playground.sln in Visual Studio to build.

IF "%1"=="--no-prompt" goto :done
:: pause so the user can see the output if they double clicked the configure script
pause

:done
