# Camera Info

## Telnet Access

```
> telnet 192.168.222.1
user: root
password: hkipc2016
```

## Wifi AP Mode Credentials

WiFi: SmartLife_8b676329
password: 12345678

WiFi MAC Address: 00:2a:2a:7e:c1:0d
IP: 192.168.222.1

## After Configuration

```
> uname -a

Linux ipc 3.10.14__isvp_swan_1.0__ #7 PREEMPT Tue Dec 22 21:28:36 CST 2020 mips GNU/Linux
```

```
> df -h

Filesystem                Size      Used Available Use% Mounted on
/dev/root                 1.0M      1.0M         0 100% /
tmpfs                    17.4M      8.0K     17.4M   0% /dev
tmpfs                    17.4M     16.0K     17.4M   0% /var
tmpfs                    17.4M    348.0K     17.1M   2% /tmp
tmpfs                    17.4M         0     17.4M   0% /run
/dev/mtdblock3          384.0K    136.0K    248.0K  35% /mnt/flash
/dev/mtdblock4            4.3M      4.3M         0 100% /mnt/flash/Server
/dev/mtdblock4            4.3M      4.3M         0 100% /usr/lib
/dev/mtdblock4            4.3M      4.3M         0 100% /etc
/dev/mtdblock4            4.3M      4.3M         0 100% /root
tmpfs                    17.4M    348.0K     17.1M   2% /tmp/web/jpgimage
tmpfs                    17.4M    348.0K     17.1M   2% /tmp/web/jpgmulreq
tmpfs                    17.4M    348.0K     17.1M   2% /tmp/web/mjpg
tmpfs                    17.4M    348.0K     17.1M   2% /tmp/web/mjpgstreamreq
tmpfs                    17.4M    348.0K     17.1M   2% /system
```

```
> mount

rootfs on / type rootfs (rw)
/dev/root on / type squashfs (ro,relatime)
tmpfs on /dev type tmpfs (rw,relatime)
tmpfs on /var type tmpfs (rw,relatime)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /tmp type tmpfs (rw,relatime)
tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
sysfs on /sys type sysfs (rw,relatime)
/dev/mtdblock3 on /mnt/flash type jffs2 (rw,relatime)
/dev/mtdblock4 on /mnt/flash/Server type squashfs (ro,relatime)
/dev/mtdblock4 on /usr/lib type squashfs (ro,relatime)
/dev/mtdblock4 on /etc type squashfs (ro,relatime)
/dev/mtdblock4 on /root type squashfs (ro,relatime)
tmpfs on /tmp/web/jpgimage type tmpfs (rw,relatime)
tmpfs on /tmp/web/jpgmulreq type tmpfs (rw,relatime)
tmpfs on /tmp/web/mjpg type tmpfs (rw,relatime)
tmpfs on /tmp/web/mjpgstreamreq type tmpfs (rw,relatime)
tmpfs on /system type tmpfs (rw,relatime)
/dev/mmcblk0p1 on /mnt/flash/mmc type vfat (rw,noatime,nodiratime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,tz=UTC,errors=remount-ro)
```

```
> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00008000 "boot"
mtd1: 00170000 00008000 "kernel"
mtd2: 00100000 00008000 "root"
mtd3: 00060000 00008000 "config"
mtd4: 004f0000 00008000 "appfs"
```

```
> cat /proc/partitions
major minor  #blocks  name
31        0        256 mtdblock0
31        1       1472 mtdblock1
31        2       1024 mtdblock2
31        3        384 mtdblock3
31        4       5056 mtdblock4
179        0  124868608 mmcblk0
179        1  124852224 mmcblk0p1
```


```
> netstat -nlp

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:10081           0.0.0.0:*               LISTEN      262/httpd
tcp        0      0 0.0.0.0:20203           0.0.0.0:*               LISTEN      197/watchall
tcp        0      0 0.0.0.0:6668            0.0.0.0:*               LISTEN      214/hiapp
tcp        0      0 0.0.0.0:23              0.0.0.0:*               LISTEN      68/telnetd
tcp        0      0 0.0.0.0:8088            0.0.0.0:*               LISTEN      214/hiapp
tcp        0      0 0.0.0.0:90              0.0.0.0:*               LISTEN      214/hiapp
netstat: /proc/net/tcp6: No such file or directory
udp        0      0 0.0.0.0:9985            0.0.0.0:*                           214/hiapp
udp        0      0 255.255.255.255:9985    0.0.0.0:*                           214/hiapp
udp        0      0 127.0.0.1:47883         0.0.0.0:*                           214/hiapp
udp        0      0 192.168.0.100:58646     0.0.0.0:*                           5710/wpa_supplicant
udp        0      0 0.0.0.0:6792            0.0.0.0:*                           214/hiapp
udp        0      0 192.168.200.88:46335    0.0.0.0:*                           214/hiapp
udp        0      0 0.0.0.0:9983            0.0.0.0:*                           197/watchall
udp        0      0 255.255.255.255:9983    0.0.0.0:*                           197/watchall
netstat: /proc/net/udp6: No such file or directory
netstat: /proc/net/raw6: No such file or directory
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node PID/Program name    Path
```

```
> ps

 ps
  PID USER       VSZ STAT COMMAND
    1 root      1824 S    {linuxrc} init
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    5 root         0 SW<  [kworker/0:0H]
    6 root         0 SW   [kworker/u2:0]
    7 root         0 SW   [rcu_preempt]
    8 root         0 SW   [rcu_bh]
    9 root         0 SW   [rcu_sched]
   10 root         0 SW   [watchdog/0]
   11 root         0 SW<  [khelper]
   12 root         0 SW<  [writeback]
   13 root         0 SW<  [bioset]
   14 root         0 SW<  [kblockd]
   15 root         0 SW   [khubd]
   17 root         0 SW<  [cfg80211]
   18 root         0 SW<  [rpciod]
   19 root         0 SW   [kswapd0]
   20 root         0 SW   [fsnotify_mark]
   21 root         0 SW<  [nfsiod]
   22 root         0 SW<  [crypto]
   40 root         0 SW<  [deferwq]
   41 root         0 SW<  [kworker/0:1H]
   57 root         0 SWN  [jffs2_gcd_mtd3]
   68 root      1820 S    telnetd
   76 root      1824 S    /sbin/getty -L console 115200 vt100
  108 root         0 SW   [mmcqd/0]
  140 root         0 SW   [irq/37-isp-m0]
  142 root         0 SW   [irq/38-isp-w02]
  197 root     17748 S    /root/watchall
  211 root      314m S    /mnt/flash/Server/mediaserver/sdk_app
  212 root      1000 S    /mnt/flash/Server/LINUX/syslogd
  214 root      316m S    /mnt/flash/Server/LINUX/hiapp
  220 root         0 DW   [isp_fw_process]
  257 root      2572 S    /mnt/flash/Server/LINUX/softwdg
  262 root      1812 S    httpd -p 10081 -h /mnt/flash/data
  300 root         0 SW   [hisi_frw]
  304 root         0 SW   [hisi_hcc_tx]
  305 root         0 SW   [hisi_hcc_rx]
  306 root         0 SW   [ksdioirqd/mmc1]
  307 root         0 SW<  [wlan_pm_wq]
 3679 root      1828 S    -sh
 5281 root         0 SW   [kworker/u2:2]
 5710 root      2188 S    /mnt/flash/Server/resource/wifi/wpa_supplicant -Dnl80211 -i wlan0 -c /etc/wpa_supplicant.conf -B
 5774 root      1828 S    udhcpc -i wlan0
 6433 root         0 SW   [kworker/0:1]
 7105 root         0 DW   [kworker/0:2]
 7777 root         0 SW   [kworker/0:0]
 8303 root      1816 R    ps
```

```
> ip addr

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
inet 127.0.0.1/8 scope host lo
valid_lft forever preferred_lft forever
2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
link/ether 00:2a:2a:7e:c1:0d brd ff:ff:ff:ff:ff:ff
3: Hisilicon0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 1000
link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
4: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
link/ether 00:2a:2a:7e:c1:0d brd ff:ff:ff:ff:ff:ff
inet 192.168.0.100/24 brd 192.168.0.255 scope global wlan0
valid_lft forever preferred_lft forever
5: ap0: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast qlen 1000
link/ether 00:2a:2a:7e:c1:0e brd ff:ff:ff:ff:ff:ff
```
