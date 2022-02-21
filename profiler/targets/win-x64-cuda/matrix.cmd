@echo off

REM  Copyright (c) 2018-2021, Carnegie Mellon University
REM  See LICENSE for details

REM  Use cmake to build the project (PROJECT=time) for CUDA language (SUFFIX=cu) 

set SGBETEMPDIR=%cd%
COPY ..\..\targets\common\CMakeLists.txt %SGBETEMPDIR%\CMakeLists.txt
RENAME testcode.c testcode.cu
IF EXIST .\build ( rd /s /q build )
md build && cd build
cmake -DPROJECT:STRING=matrix -DSUFFIX:STRING=cu .. < nul
cmake --build . --config Release --target install < nul
cd ..

IF EXIST .\matrix.exe (
    .\matrix.exe > matrix.txt
) ELSE (
    type nul > matrix.txt
)
