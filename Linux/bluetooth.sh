#/bin/sh

BLUETOOTH_STATE=`bluetoothctl show | grep Powered | cut -d' ' -f 2`

function help()
{
    cat << HELP_MSG
    
    Usage: $(basename $0) <option>

    This script allows to control the bluetooth

    Options:
        --help | -h         Display this usage message 
        --disable | -d      Disable bluetooth
        --enable | -e       Enable bluetooth
        --toggle | -t       Toggle bluetooth

HELP_MSG

}


if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    help;

elif [[ "$1" == "--disable" || "$1" == "-d" ]]; then
    bluetoothctl power off
    notify-send "Bluetooth" "Bluetooth disabled"

elif [[ "$1" == "--enable" || "$1" == "-e" ]]; then
    bluetoothctl power on
    notify-send "Bluetooth" "Bluetooth enabled"

elif [[ "$1" == "--toggle" || "$1" == "-t" ]]; then
    if [[ "$BLUETOOTH_STATE" == "yes" ]]; then
        bluetoothctl power off
        notify-send "Bluetooth" "Bluetooth disabled"

    elif [[ "$BLUETOOTH_STATE" == "no" ]]; then
        bluetoothctl power on
        notify-send "Bluetooth" "Bluetooth enabled"
    fi

else
    help;
fi
