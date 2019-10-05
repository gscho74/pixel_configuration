#!/bin/bash
 
USER=gscho
 
grep -q close /proc/acpi/button/lid/*/state
 
if [ $? = 0 ]; then
  su -c  "/opt/kbd-backlight.sh fade" - $USER
  /usr/bin/amixer -q sset Front mute
fi
 
grep -q open /proc/acpi/button/lid/*/state
 
if [ $? = 0 ]; then
  su -c  "/opt/kbd-backlight.sh fade" - $USER
  aplay -d 1 /dev/zero
  /usr/bin/amixer -q sset Front unmute
fi
