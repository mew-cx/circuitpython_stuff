REM bossac191_uChip_cp732.bat -- http://mew.cx/ 2022-08-14
REM Use BOSSAC on Windows 10 to flash CircuitPython binary file onto Itaca uChip.
@echo off
REM https://circuitpython.org/board/uchip/
REM https://github.com/shumatech/BOSSA/releases/tag/1.9.1
REM https://downloads.circuitpython.org/bin/uchip/en_US/adafruit-circuitpython-uchip-en_US-7.3.2.bin
REM https://learn.adafruit.com/welcome-to-circuitpython/non-uf2-installation

REM The BOSSAC commandline executable.
set BOSSAC="C:\Program Files (x86)\BOSSA\bossac.exe"

REM The CircuitPython .bin image file. (_not_ a .uf2 file!)
set BINFILE=".\adafruit-circuitpython-uchip-en_US-7.3.2.bin"

REM The serial port for uChip.  Edit to match your own.
set PORT=COM6

REM For M0 boards, which have an 8kB bootloader.  uChip uses this.
set OFFSET="--offset=0x2000"
REM For M4 boards, which have a 16kB bootloader.
REM set OFFSET="--offset=0x4000"

echo.
echo Ensure the uChip is in bootloader mode, and port %PORT% is correct.
pause
echo.

echo Querying the device, to ensure it is operating properly.
%BOSSAC% --port=%PORT% --info

echo.
echo Proceed to write?
pause
echo.

REM Make it so.
echo Writing to the device.
echo.
set WRITE=--erase --write --verify --reset
%BOSSAC% --port=%PORT% %OFFSET% %WRITE% %BINFILE%

echo Finished
pause

REM eof
