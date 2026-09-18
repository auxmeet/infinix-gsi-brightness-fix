# gsi-brightness-fix

Brightness fix for **Infinix** phones when running a **GSI** (e.g. Pixel Experience).

On stock firmware the panel often exposes `max_brightness` up to **4095**, while GSI may scale the slider as if the max were **255**, so the screen stays dim.

## How it works

After boot, `service.sh`:

1. Reads `max_brightness` from the Unisoc/backlight sysfs node.
2. Sets **`persist.sys.qcom-brightness`** via **`resetprop`** — property name from **Phh Treble GSI** (not Qualcomm-specific).

If the node is missing, **4095** is used as fallback.

The module includes **`skip_mount`** (no `/system` overlay) — only the boot script runs.

## Install (Magisk 26.4+ required)

Installation aborts on Magisk older than **26.4** (`versionCode` 26400).

1. Zip these files at the **root** of the archive:
   - `module.prop`
   - `service.sh`
   - `customize.sh`
   - `skip_mount`
   - `META-INF/com/google/android/update-binary`
   - `META-INF/com/google/android/updater-script` (contents: `#MAGISK`)
2. **Magisk 26.4+** → Modules → Install from storage → reboot.

When you install from the Magisk app, it replaces `update-binary` with its own `module_installer.sh` (expected).

## Tested on

- Device: Infinix Hot 12 Pro (X668C)
- Firmware: Pixel Experience 12 (GSI)
- Magisk: **26.4**

## If brightness is still wrong

In **Phh Treble Settings**, enable **Use alternate backlight scale** and save to treble presets.

## Check

```sh
getprop persist.sys.qcom-brightness
cat /sys/class/leds/lcd-backlight/max_brightness
```

Values should match after reboot.
