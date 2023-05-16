#!/bin/bash

##### Colors #####
RED=$'\e[91m'
RESET=$'\e[0m'
YELLOW=$'\e[93m'
GREEN=$'\e[92m'
PURPLE=$'\e[95m'
##### Variables #####
SENDER=/dev/ttyUSB0
RECEIVER=/dev/ttyACM0
SESION_NAME="logs-for-receiver"
##### Functions #####
break_line () {
  echo -e "\n"
}

break_line
echo "${YELLOW}Flashing on ${PURPLE}[Sender] ${YELLOW}module ${RESET}"
break_line
tinygo flash -target=esp32 -port=${SENDER} ./sender/main.go
break_line

echo "${YELLOW}Flashing on ${PURPLE}[Receiver] ${YELLOW}module ${RESET}"
break_line
tinygo flash -target=esp32 -port=${RECEIVER} ./receiver/main.go
break_line

echo "${YELLOW}Opening ${PURPLE}[Receiver] ${YELLOW}log console ${RESET}"
sleep 3s
GNOME_TERMINAL_SCREEN="" gnome-terminal --wait -- screen -S "${SESION_NAME}" /dev/ttyACM0 9600
echo "${RED}Ending screen sesion"
screen -S "${SESION_NAME}" -X quit