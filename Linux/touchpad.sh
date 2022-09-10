#/bin/sh

TOUCHPAD="ETPS/2 Elantech Touchpad"

function help()
{
    cat << HELP_MSG
    
    Usage: $(basename $0) <option>

    This script allows to control the touchpad

    Options:
        --help | -h         Display this usage message 
        --disable | -d      Disable touchpad
        --enable | -e       Enable touchpad
        --toggle | -t       Toggle touchpad

HELP_MSG

}


if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    help;

elif [[ "$1" == "--disable" || "$1" == "-d" ]]; then
    xinput disable "$TOUCHPAD"
    notify-send "Touchpad" "Touchpad disabled"

elif [[ "$1" == "--enable" || "$1" == "-e" ]]; then
    xinput enable "$TOUCHPAD"
    notify-send "Touchpad" "Touchpad enabled"

elif [[ "$1" == "--toggle" || "$1" == "-t" ]]; then
    TOUCHPAD_STATE=`xinput list-props "$TOUCHPAD" | grep "Device Enabled" | cut -d ':' -f2 | xargs`
    if [[ "$TOUCHPAD_STATE" == "1" ]]; then
        xinput disable "$TOUCHPAD"
        notify-send "Touchpad" "Touchpad disabled"

    elif [[ "$TOUCHPAD_STATE" == "0" ]]; then
        xinput enable "$TOUCHPAD"
        notify-send "Touchpad" "Touchpad enabled"
    fi

else
    help;
fi
