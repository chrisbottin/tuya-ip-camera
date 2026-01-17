# Boot Access

The following instructions describe how to set up a serial console connection to the camera device using an Onion Omega2.

## Using UART Serial Console with Onion Omega2

Connect TX, RX, GND from the camera to the Omega2 (https://docs.onion.io/omega2-docs/uart1.html)

SSH to Omega2 using password `onioneer`:

```
ssh root@192.168.3.1
```

Start serial console logging to file using screen:

```
rm /mnt/sda1/camera.log
screen -L -Logfile /mnt/sda1/camera.log /dev/ttyS1 115200
```

Use `ctrl+A, D` to detach, `ctrl+A, K` to kill. `screen -r` to reattach.

## Copy log file to local machine

```
scp -r root@192.168.3.1:/mnt/sda1/loosafe.log /Users/user/Downloads/camera.log
```

