#!/bin/bash

battery_status=$(acpi -b | awk '{print $3}' | tr -d ",")
battery_level=$(acpi -b | awk '{print $4}' | tr -d "[,|%]")

BATTERYFILE=/tmp/battery

_battery_warn_level=25
_battery_crit_level=15
_battery_susp_level=8


if  [ ! -f $BATTERYFILE ];then
    if [[ $battery_status != 'Discharging' ]];then
        echo "plugged" > $BATTERYFILE
    else
        echo "unplugged" > $BATTERYFILE
    fi
fi

battery=$(cat $BATTERYFILE)

if [[ $battery_status != 'Discharging' ]];then
    if [[ $battery != 'plugged' ]];then
        echo "plugged" > $BATTERYFILE
        battery=$(cat $BATTERYFILE)
        notify-send -u normal -t 6000 "Plugged" "The battery is now charging"
    fi
    exit 0;
else
    if [[ $battery == 'plugged' ]];then
        echo "unplugged" > $BATTERYFILE
        battery=$(cat $BATTERYFILE)
        notify-send -u normal -t 6000 "Unplugged" "The battery is now discharging"
    fi
fi

if [[ $battery == 'critical' ]];then
        notify-send -u critical -t 6000 "Critical" "Please recharge the battery"
        exit 0;
fi

if [[ $battery_level -le $_battery_susp_level ]] && [[ $battery_status == 'Discharging' ]] && [[ $battery != 'critical' ]];then
    echo "critical" > $BATTERYFILE
    systemctl suspend

elif [[ $battery_level -le $_battery_crit_level ]] && [[ $battery_status == 'Discharging' ]] && [[ $battery != 'low' ]] ;then
    echo "low" > $BATTERYFILE
    notify-send -u critical -t 8000 "Low Battery" "The battery level is critically low"

elif [[ $battery_level -le $_battery_warn_level ]] && [[ $battery_status == 'Discharging' ]] && [[ $battery != 'warn' ]];then
    echo "warn" > $BATTERYFILE
    notify-send -u normal -t 8000 "Low Battery" "The battery level is low"
fi

