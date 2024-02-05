#!/bin/bash

POWEROFF="Power off"
REBOOT="Reboot"
# SUSPEND="Suspend"
# HIBERNATE="Hibernate"
LOGOUT="Logout"


if [ x"$@" = x"${POWEROFF}" ]; then
    systemctl poweroff
    exit 0

elif [ x"$@" = x"${REBOOT}" ]; then
    systemctl reboot
    exit 0

# elif [ x"$@" = x"${SUSPEND}" ]; then
#     systemctl suspend
#     exit 0
# 
# elif [ x"$@" = x"${HIBERNATE}" ]; then
#     systemctl hibernate
#     exit 0

elif [ x"$@" = x"${LOGOUT}" ]; then
    i3-msg exit
    exit 0
fi


echo $POWEROFF
echo $REBOOT
# echo $SUSPEND
# echo $HIBERNATE
echo $LOGOUT
