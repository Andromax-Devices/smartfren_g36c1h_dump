#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8376320 504d8c9f506e0debde5a285706eed7d09ac53ca1 6184960 c1a1f8bccf4db164b611cf7f5ce708ac6e4a4b42
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:8376320:504d8c9f506e0debde5a285706eed7d09ac53ca1; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6184960:c1a1f8bccf4db164b611cf7f5ce708ac6e4a4b42 EMMC:/dev/block/bootdevice/by-name/recovery 504d8c9f506e0debde5a285706eed7d09ac53ca1 8376320 c1a1f8bccf4db164b611cf7f5ce708ac6e4a4b42:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
