#!/bin/bash

# Tool to perform auto clicking at a specific interval
# 
# Usage: ./autoclicker_script <args>
#   
# Arguments:
#		-x			The x coordinate of the click 
#		-y			The y coordinate of the click
#		-t			The time interval to click
#		-m			The mouse button to click (1 or 2)
#
# Configuration: 
#   - Use `xdotool getmouselocation` to get the coords of the mouse
#   - Set the desired x, y, and sleep time with  and run   
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -x|--x-coord)
    X_COORD="$2"
    shift # past argument
    shift # past value
    ;;
    -y|--y-coord)
    Y_COORD="$2"
    shift # past argument
    shift # past value
    ;;
    -t|--time)
    TIME_INTERVAL="$2"
    shift # past argument
    shift # past value
    ;;
		-b|--button)
    MOUSE_BUTTON="$2"
    shift # past argument
    shift # past value
    ;;
esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

while [ 1 ]; do
    xdotool mousemove $X_COORD $Y_COORD click $MOUSE_BUTTON &
    sleep $TIME_INTERVAL
done
