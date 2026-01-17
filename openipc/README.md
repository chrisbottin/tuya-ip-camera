# OpenIPC Installation Guid


https://openipc.org/cameras/vendors/ingenic/socs/t31n

* Camera MAC Address: 00:2a:2a:7e:c1:0d
* Camera IP Address: 192.168.0.100
* TFTP server IP address: 192.168.0.218
* Flash Memory: NOR 8MB
* Firmware Version: Lite
* Network Interface: Ethernet + WiFi
* SD Card Slot: Yes

```
# Enter commands line by line! Do not copy and paste multiple lines at once!
setenv ipaddr 192.168.0.100; setenv serverip 192.168.0.218
mw.b 0x80600000 0xff 0x800000
tftpboot 0x80600000 openipc-t31n-lite-8mb.bin

# if there is no tftpboot but tftp then run this instead
tftp 0x80600000 openipc-t31n-lite-8mb.bin
sf probe 0; sf lock 0;
sf erase 0x0 0x800000; sf write 0x80600000 0x0 0x800000
reset
```