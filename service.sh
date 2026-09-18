#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

BACKLIGHT_MAX=
for NODE in \
  /sys/class/leds/lcd-backlight/max_brightness \
  /sys/class/backlight/sprd_backlight/max_brightness \
  /sys/class/backlight/panel0-backlight/max_brightness; do
  if [ -r "$NODE" ]; then
    BACKLIGHT_MAX=$(cat "$NODE" 2>/dev/null)
    [ -n "$BACKLIGHT_MAX" ] && break
  fi
done

[ -z "$BACKLIGHT_MAX" ] && BACKLIGHT_MAX=4095

resetprop persist.sys.qcom-brightness "$BACKLIGHT_MAX"
