#!/bin/bash

while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
  bat_status=$(cat /sys/class/power_supply/BAT0/status)

  if [ "$bat_status" = "Discharging" ]; then
    if [ "$bat_lvl" -le 15 ] && [ "$bat_lvl" -gt 5 ]; then
      notify-send --urgency=normal "Low Battery" "$bat_lvl% remaining"
      sleep 300
    elif [ "$bat_lvl" -le 5 ]; then
      notify-send --urgency=critical "CRITICAL BATTERY" "System will shutdown soon! ($bat_lvl%)"
      sleep 60
    else
      sleep 120
    fi
  else
    sleep 300
  fi
done
