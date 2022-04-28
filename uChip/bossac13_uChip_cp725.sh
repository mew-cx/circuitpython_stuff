#! /bin/bash -x
# bossac13_uChip_cp725.bat -- http://mew.cx/ 2022-04-27
# Use BOSSAC to flash CircuitPython binary file to Itaca uChip.
@echo off
# https://circuitpython.org/board/uchip/
# https://github.com/shumatech/BOSSA/releases/tag/1.9.1
# https://downloads.circuitpython.org/bin/uchip/en_US/adafruit-circuitpython-uchip-en_US-7.2.3.bin
# https://learn.adafruit.com/welcome-to-circuitpython/non-uf2-installation

# The BOSSAC commandline executable.
set BOSSAC="C:\Program Files (x86)\BOSSA\bossac.exe"

# The CircuitPython .bin image file. (_not_ a .uf2 file!)
set BINFILE=".\adafruit-circuitpython-uchip-en_US-7.2.3.bin"

# The serial port for uChip.  Edit to match your own.
set PORT=COM38

# For M0 boards, which have an 8kB bootloader.  uChip uses this.
set OFFSET="--offset=0x2000"
# For M4 boards, which have a 16kB bootloader.
# set OFFSET="--offset=0x4000"

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

# Make it so.
echo Writing to the device.
echo.
set WRITE=--erase --write --verify --reset
# set WRITE=--erase --write --verify --debug --reset
%BOSSAC% --port=%PORT% %OFFSET% %WRITE% %BINFILE%

echo Finished
pause

# eof
