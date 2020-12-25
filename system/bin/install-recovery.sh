#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8669184 657d7b0f6cbf8e070b7f5ae5f28fd2a4d3c310f5 6209536 edc6ee7a25be443b6a8f6d5716da2b203f41a4ad
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:8669184:657d7b0f6cbf8e070b7f5ae5f28fd2a4d3c310f5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6209536:edc6ee7a25be443b6a8f6d5716da2b203f41a4ad EMMC:/dev/block/bootdevice/by-name/recovery 657d7b0f6cbf8e070b7f5ae5f28fd2a4d3c310f5 8669184 edc6ee7a25be443b6a8f6d5716da2b203f41a4ad:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
