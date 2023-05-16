#!/bin/bash
echo "TTY devices"
ls /dev/ | grep "ttyACM"
echo -e "\n"

echo "USB devices"
ls /dev/ | grep "ttyUSB"