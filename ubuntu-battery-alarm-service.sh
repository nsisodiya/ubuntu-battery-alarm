#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Example service started at ${DATE}" | systemd-cat -p info

while true;
do 
    echo ""
    charging_level=$(cat /sys/class/power_supply/BAT0/capacity)
    charging_status=$(cat /sys/class/power_supply/BAT0/status)
    echo "Cuttent charing level is $charging_level and Battery is $charging_status"
    if [ "$charging_status" == "Discharging" ];then
        if (( charging_level < 10 )); then
            echo "Battery is LOW and Less than 10% & Discharging"
            amixer set 'Master' 100%
            paplay /usr/share/sounds/ubuntu/ringtones/Bliss.ogg
        fi
    fi
    sleep 5; 
done