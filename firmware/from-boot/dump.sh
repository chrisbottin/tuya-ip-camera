
ssh root@192.168.3.1

rm /mnt/sda1/loosafe.log
screen -L -Logfile /mnt/sda1/loosafe.log /dev/ttyS1 115200

# ctrl+A, D to detach
# ctrl+A, K to kill

# to reattach
screen -r

# Dump flash memory to console
sf probe
sf read 0x80600000 0x0 0x0800000
md 0x80600000 0x0200000 # 0x0200000 = 2,097,152 = 0x0800000 / 4 (4 bytes per bite)

#8,388,608  -> 0x0800000
#16,777,216 -> 0x1000000

scp -r root@192.168.3.1:/mnt/sda1/loosafe.log /Users/chrisbottin/Workspace/personal/loosafe/firmware/loosafe-firmware.log

python3 hexparser.py loosafe-firmware.log loosafe-firmware.bin

#cat loosafe-firmware.log | sed -E "s/^[0-9a-f]{8}: //i" | sed -E "s/ {4}.{16}\r?$//" > loosafe-fulldump.hex
#xxd -revert -plain loosafe-fulldump.hex loosafe-fulldump.bin
#binwalk loosafe-fulldump.bin
#
#cat loosafe-firmware.log | sed -E "s/^[0-9a-f]{8}: //i" | sed -E "s/ {4}.{16}\r?$//" > loosafe-firmware5.hex
#xxd -revert -plain loosafe-firmware5.hex loosafe-firmware5.bin
#binwalk loosafe-firmware5.bin
#
#cat test1.log | sed -E "s/^[0-9a-f]{8}: //i" | sed -E "s/ {4}.{16}\r?$//" > test1.hex
#xxd -revert -plain loosafe-firmware4.hex loosafe-firmware4.bin
#binwalk loosafe-firmware4.bin
