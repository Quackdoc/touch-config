#!/bin/bash

# Command to check if Squeekboard is visible
IS_VISIBLE=$(dbus-send --print-reply --dest=sm.puri.OSK0 /sm/puri/OSK0 org.freedesktop.DBus.Properties.Get string:"sm.puri.OSK0" string:"Visible" | grep -o 'true\|false')

# Check if the output is true or false and run the respective command
if [ "$IS_VISIBLE" = "true" ]; then
    busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b false
elif [ "$IS_VISIBLE" = "false" ]; then
    busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true
else
  notify-send "squeekboard not running"
fi
