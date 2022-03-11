REM bossac_uChip_cp720 -- mew@mew.cx 2022-03-10
REM Flash CircuitPython 7.2.0 to Itaca uChip with BOSSAC 1.9.1
@echo off
REM https://downloads.circuitpython.org/bin/uchip/en_US/adafruit-circuitpython-uchip-en_US-7.2.0.bin
REM https://github.com/shumatech/BOSSA/releases/tag/1.9.1
REM https://learn.adafruit.com/adafruit-feather-m0-express-designed-for-circuit-python-circuitpython/uf2-bootloader-details

REM The BOSSAC commandline executable
set BOSSAC="C:\Program Files (x86)\BOSSA\bossac.exe"

REM The CircuitPython .bin image file (_not_ a .uf2 file!)
set BINFILE="C:\Users\Mike Weiblen\Desktop\adafruit0301\uf2\adafruit-circuitpython-uchip-en_US-7.2.0.bin"

REM The serial port for uChip
set PORT="--port=COM5"

REM For M0 boards, which have an 8kB bootloader
set OFFSET="--offset=0x2000"
REM For M4 boards, which have a 16kB bootloader
REM set OFFSET="--offset=0x4000"

echo.
echo Ensure the uChip is in bootloader mode, and %PORT% is correct
pause
echo.

echo Querying the device, to ensure it is operating properly
%BOSSAC% %PORT% --info

echo.
echo Proceed to write?
pause
echo.

REM Make it so
echo Writing to the device
echo.
REM set WRITE=--erase --write --verify --debug --reset
set WRITE=--erase --write --verify --reset
%BOSSAC% %PORT% %OFFSET% %WRITE% %BINFILE%

echo Finished
pause

REM eof
