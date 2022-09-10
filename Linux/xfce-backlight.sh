#!/bin/bash

BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/brightness`
STEP=244

function help()
{
    cat << HELP_MSG
    
    Usage: $(basename $0) <option>

    This script allows to control the screen brightness

    Options:
        -inc        Increment screen brightness
        -dec        Decrement screen brightness

HELP_MSG

}

if [[ "$1" == "-inc" ]]; then
    pkexec xfpm-power-backlight-helper --set-brightness $(($BRIGHTNESS + $STEP))

elif [[ "$1" == "-dec" ]]; then
    pkexec xfpm-power-backlight-helper --set-brightness $(($BRIGHTNESS - $STEP))
else
    help;
fi

