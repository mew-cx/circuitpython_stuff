# circuitpython_stuff
My bits'n'bobs for working with [Adafruit's CiruitPython](https://circuitpython.org/)

All collected here, as they're too small to merit separate repos.

--------------------------
# Easier CIRCUITPY access on Linux
Add the following to `/etc/fstab`:
```
# allow any user to "mount -L CIRCUITPY" or "mount /mnt/CIRCUITPY":
LABEL=CIRCUITPY /mnt/CIRCUITPY vfat defaults,noauto,users,noatime,flush,umask=0000 0 0
```
--------------------------

# Bookmarks

## CircuitPython in general
- https://circuitpython.org/
- https://github.com/mew-cx/circuitpython
- https://github.com/mew-cx/circuitpython-org
- https://github.com/mew-cx/circuitpython_stuff

## Sensirion's SPS30 particle sensor
- https://github.com/kevinjwalters/Adafruit_CircuitPython_SPS30

## Itaca Innovation's uChip board
- https://github.com/ITACAInnovation/uChip
- https://github.com/mew-cx/uChip_unpacked
- https://github.com/mew-cx/CircuitPython_uChipPowerManagement
- https://circuitpython.org/board/uchip/

## Other WIP
- https://github.com/mew-cx/CircuitPython_Soundgin
- https://github.com/mew-cx/CircuitPython_SpeakJet

