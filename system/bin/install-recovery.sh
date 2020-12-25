#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8380416 7a3dd459d988954d92d31450f17ed1f38714f3b2 6172672 4c76108114aaf479c201a9c936483d02a9e05bec
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:8380416:7a3dd459d988954d92d31450f17ed1f38714f3b2; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6172672:4c76108114aaf479c201a9c936483d02a9e05bec EMMC:/dev/block/bootdevice/by-name/recovery 7a3dd459d988954d92d31450f17ed1f38714f3b2 8380416 4c76108114aaf479c201a9c936483d02a9e05bec:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
