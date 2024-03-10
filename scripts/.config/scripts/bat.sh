#!/bin/bash

while true
do
    bat=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $bat -lt 18 ]
    then
        dunstify "Battery low"
    elif [ $bat -lt 30 ]
    then
        dunstify --urgency="Critical" "Battery warning"
    fi
    sleep 20
done

