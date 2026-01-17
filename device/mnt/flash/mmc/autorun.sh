# /mnt/flash/mmc/autorun.sh
# This script runs automatically when the device boots up.
# Executed from /mnt/flash/Server/script/autorun.sh

# Setup
# touch /mnt/flash/mmc/autorun.sh
# vi /mnt/flash/mmc/autorun.sh
# cat /mnt/flash/mmc/autorun.sh
# stat /mnt/flash/mmc/autorun.sh
# sudo suvi stat /mnt/flash/Server/script/autorun.sh
# ls -na /mnt/flash/Server/web/browse

# Apply patch (if present) to hiapp, runs once only
if [ -f /mnt/flash/mmc/hiapp ];then
  cp /mnt/flash/mmc/hiapp /mnt/flash/Server/LINUX/hiapp__patched
  mv /mnt/flash/mmc/hiapp /mnt/flash/mmc/hiapp__patch_applied
  echo "hiapp patch applied"
else
  echo "No hiapp patch found"
fi


killall softwdg hiapp
cd /mnt/flash/mmc/hiapp
