# How to Discover Root Password on Camera Device

Setup serial console (see boot/README.md):

```
screen -L -Logfile /mnt/sda1/camera.log /dev/ttyS1 115200
```

Start Camera device and enter U-Boot console by pressing any key during countdown.

Set up `bootargs` to start shell only:

```
setenv bootargs console=ttyS1,115200n8 mem=40M@0x0 rmem=24M@0x2800000 init=/bin/sh rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),1472k(kernel),1024k(root),384K(config),-(appfs)
```

Boot the system:

```
boot
```

Mount filesystems following scripts in `/etc/init.d/` following steps in `/etc/init.d/S01udev` and `/etc/init.d/S02moutfs`:

```
mount -t proc proc /proc
mount -t tmpfs tmpfs /dev
mount -a
```

Initial Show disk usage

```
> df -h

Filesystem                Size      Used Available Use% Mounted on
/dev/root                 1.0M      1.0M         0 100% /
tmpfs                    17.4M         0     17.4M   0% /dev
tmpfs                    17.4M         0     17.4M   0% /tmp
tmpfs                    17.4M         0     17.4M   0% /run
/dev/mtdblock3          384.0K    356.0K     28.0K  93% /mnt/flash
/dev/mtdblock4            4.3M      4.3M         0 100% /mnt/flash/Server
```

Get hashed password from `passwd` file:

```
> cat /mnt/flash/Server/etc/passwd
root:$1$EnVGPLqH$Jwh/FgaqrrHwHsmzHibnc1:0:0::/root:/bin/sh
```

Google the hashed password "$1$EnVGPLqH$Jwh/FgaqrrHwHsmzHibnc1" to find password, bingo! -> `hkipc2016`

We have successfully discovered the root password.

```
user: root
password: hkipc2016
```
