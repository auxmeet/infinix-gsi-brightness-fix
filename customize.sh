#!/system/bin/sh

MIN_MAGISK=26400

if [ -z "$MAGISK_VER_CODE" ] || [ "$MAGISK_VER_CODE" -lt "$MIN_MAGISK" ]; then
  abort "! Requires Magisk 26.4+ (current: ${MAGISK_VER:-unknown})"
fi

ui_print "- Infinix GSI brightness fix"
ui_print "- Magisk $MAGISK_VER"
