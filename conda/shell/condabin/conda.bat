@REM Copyright (C) 2012 Anaconda, Inc
@REM SPDX-License-Identifier: BSD-3-Clause
@IF NOT DEFINED CONDA_EXE @SET _CE_M=
@IF NOT DEFINED CONDA_EXE @SET _CE_CONDA=
@IF NOT DEFINED CONDA_EXE @SET "CONDA_EXE=%~dp0..\Scripts\conda.exe"

@IF [%1]==[activate]   "%~dp0_conda_activate" %*
@IF [%1]==[deactivate] "%~dp0_conda_activate" %*

@SETLOCAL
@FOR %%A IN ("%~dp0\.") DO @SET _sysp=%%~dpA
@SET _sysp=%_sysp:~0,-1%
@SET PATH=%_sysp%;%_sysp%\Library\mingw-w64\bin;%_sysp%\Library\usr\bin;%_sysp%\Library\bin;%_sysp%\Scripts;%_sysp%\bin;%PATH%
@CALL "%CONDA_EXE%" %_CE_M% %_CE_CONDA% %*
REM @ENDLOCAL

@IF %errorlevel% NEQ 0 EXIT /B %errorlevel%

@IF [%1]==[install]   "%~dp0_conda_activate" reactivate
@IF [%1]==[update]    "%~dp0_conda_activate" reactivate
@IF [%1]==[upgrade]   "%~dp0_conda_activate" reactivate
@IF [%1]==[remove]    "%~dp0_conda_activate" reactivate
@IF [%1]==[uninstall] "%~dp0_conda_activate" reactivate
