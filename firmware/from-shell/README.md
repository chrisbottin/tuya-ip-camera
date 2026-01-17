# Flash Dump Extraction using shell on the device

## Dump Flash Memory

Connect to Camera device using user `root` and password `hkipc2016`.

```
telnet root@192.168.0.100
```

Create the `flashdump.bin` file using the following steps (source https://drmnsamoliu.github.io/flashdump.html)

```
rm /mnt/flash/mmc/firmware/flashdump.bin
touch /mnt/flash/mmc/firmware/flashdump.bin
cat /dev/mtdblock0 >> /mnt/flash/mmc/firmware/flashdump.bin
cat /dev/mtdblock1 >> /mnt/flash/mmc/firmware/flashdump.bin
cat /dev/mtdblock2 >> /mnt/flash/mmc/firmware/flashdump.bin
cat /dev/mtdblock3 >> /mnt/flash/mmc/firmware/flashdump.bin
cat /dev/mtdblock4 >> /mnt/flash/mmc/firmware/flashdump.bin
```


## Download Flash Dump

Add symbolic link to web server directory:

```
ln -s /mnt/flash/mmc/firmware/flashdump.bin /mnt/flash/data/flashdump.bin
```

Download using http://192.168.0.100:10081/flashdump.bin


## Extract Firmware

Extract binary using `binwalkv3` by first creating the Docker image (https://github.com/ReFirmLabs/binwalk/wiki/Building-A-Binwalk-Docker-Image)

```
docker run -t -v ./:/analysis binwalkv3 -Me flashdump.bin
```
