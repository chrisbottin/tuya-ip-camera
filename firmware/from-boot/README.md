# Flash Dump Extraction using boot on the device

## Connect to Onion Omega2

Connect to device using user `root` and password `onioneer`.

```
ssh root@192.168.3.1
```

Add SD Card to the device which is mounted at `/mnt/sda1`.

Set up serial connection to the camera device.

```
rm /mnt/sda1/flashdump.log
screen -L -Logfile /mnt/sda1/flashdump.log /dev/ttyS1 115200
```

Screen Command options:

* `ctrl+A, D` to detach
* `ctrl+A, K` to kill

## Dump Flash Memory

Start Camera device in boot mode by pressing any key during the countdown.


### Saving firmware via UART logs (not reliable)

Load flash memory to RAM (source https://github.com/OpenIPC/wiki/blob/master/en/help-uboot.md#saving-original-firmware-without-using-tftp)

```
mw.b 0x80600000 0xff 0x0800000
sf probe 0
sf read 0x80600000 0x0 0x0800000
md.b 0x80600000 0x0800000
```

This can take about 1 hour to complete. Use `ctrl+A, D` to detach and `screen -r` to reattach.

Transfer the log file to computer using `scp`

```
scp -r root@192.168.3.1:/mnt/sda1/flashdump.log ./using-uart-logs/flashdump.log
```

Trim the start of the log file before the memory dump, First line should be `80600000: ....`

Use Python script to convert log file to binary firmware file.

Notes: Found some incomplete lines

```
80752f10 / 00152f10: 130f e516 2db1 cac4 ec54 3d85 1338 c62d  ....-....T=..8.
80752f20 / 00152f20: 0576 6776 0e1b 9559 a867 97f4 4a12 e889  .vgv...Y.g..J...
80752f30 / 00152f30: 22ce 6e91 5aa4 0bcd e85b 7125 9404 ec07  ".n.Z....[q%...
```

```
python3 hexparser.py ./using-uart-logs/flashdump.log ./using-uart-logs/flashdump.bin
```

Verify the binary file against a flash dump from Shell

```
xxd ./using-uart-logs/flashdump.bin > ./using-uart-logs/flashdump.hex
vimdiff ./using-uart-logs/flashdump.hex ../../from-shell/flashdump.hex
```

### Saving firmware via SD card (source https://github.com/OpenIPC/wiki/blob/master/en/help-uboot.md#saving-firmware-via-sd-card)

```
mmc dev 0
mmc erase 0x10 0x4000
```

```
mw.b 0x80600000 0xff 0x0800000
sf probe 0
sf read 0x80600000 0x0 0x0800000
mmc write 0x80600000 0x10 0x4000
```

Remove the card from the camera and insert it into a computer running Mac/Linux. Use `dd` command to copy data from the card to a binary file on the computer.

```
diskutil list # on Mac to find the device name
fdisk -l # on Linux to find the device name

sudo dd bs=512 skip=16 count=16384 if=/dev/disk4 of=./flashdump.bin
```

### Saving firmware via TFTP

From https://openipc.org/cameras/vendors/ingenic/socs/t31n

```
mw.b 0x80600000 0xff 0x800000
sf probe 0; sf read 0x80600000 0x0 0x800000
tftpput 0x80600000 0x800000 backup-t31n-nor8m.bin
```

If there is no tftpput but tftp then run this instead

```
tftp 0x80600000 backup-t31n-nor8m.bin 0x800000
```

## Extract Firmware

Extract binary using `binwalkv3` by first creating the Docker image (https://github.com/ReFirmLabs/binwalk/wiki/Building-A-Binwalk-Docker-Image)

```
docker run -t -v ./:/analysis binwalkv3 -Me flashdump.bin
```