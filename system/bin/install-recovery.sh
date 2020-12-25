#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8697856 c82d0917a14219f562c5dfb1a89b24fe8d3c5c8c 6238208 6de8f9b904f7eafa129d524f72162fd09a389438
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:8697856:c82d0917a14219f562c5dfb1a89b24fe8d3c5c8c; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6238208:6de8f9b904f7eafa129d524f72162fd09a389438 EMMC:/dev/block/bootdevice/by-name/recovery c82d0917a14219f562c5dfb1a89b24fe8d3c5c8c 8697856 6de8f9b904f7eafa129d524f72162fd09a389438:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
