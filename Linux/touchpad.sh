#/bin/sh

function help()
{
    cat << HELP_MSG
    
    Usage: $(basename $0) <option>

    This script allows to control the touchpad

    Options:
        --help | -h         Display this usage message 
        --disable | -d      Disable touchpad
        --enable | -e       Enable touchpad

HELP_MSG

}


if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    help;

elif [[ "$1" == "--disable" || "$1" == "-d" ]]; then
    xinput disable "ETPS/2 Elantech Touchpad"
    notify-send "Touchpad" "Touchpad disabled"

elif [[ "$1" == "--enable" || "$1" == "-e" ]]; then
    xinput enable "ETPS/2 Elantech Touchpad"
    notify-send "Touchpad" "Touchpad enabled"

else
    help;
fi
