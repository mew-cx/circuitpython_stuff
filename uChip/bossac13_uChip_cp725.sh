#! /bin/bash -x
# bossac13_uChip_cp725.bat -- http://mew.cx/ 2022-04-27
# Use BOSSAC to flash CircuitPython binary file onto Itaca uChip.
# Ubuntu 18.04 LTS: "apt install bossa-cli" installs bossa-cli_1.3~20120408-5.1_amd64.deb
# https://circuitpython.org/board/uchip/
# https://downloads.circuitpython.org/bin/uchip/en_US/adafruit-circuitpython-uchip-en_US-7.2.5.bin
# https://learn.adafruit.com/welcome-to-circuitpython/non-uf2-installation

# The BOSSAC commandline executable.
BOSSAC="/usr/bin/bossac"

# The CircuitPython .bin image file. (_not_ a .uf2 file!)
BINFILE="./adafruit-circuitpython-uchip-en_US-7.2.5.bin"

# The serial port for uChip.  Edit to match your own.
PORT="COM38"

# For M0 boards, which have an 8kB bootloader.  uChip uses this.
OFFSET="--offset=0x2000"
# For M4 boards, which have a 16kB bootloader.
# OFFSET="--offset=0x4000"

echo
echo "Ensure the uChip is in bootloader mode, and port $PORT is correct."
read -p "Press any key to continue . . . "
echo

echo "Querying the device, to ensure it is operating properly."
$BOSSAC --port=$PORT --info

echo
echo "Proceed to write?"
read -p "Press any key to continue . . . "
echo

# Make it so.
echo "Writing to the device."
echo
WRITE="--erase --write --verify --reset"
$BOSSAC --port=$PORT $OFFSET $WRITE $BINFILE

echo Finished

# eof
