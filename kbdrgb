#!/bin/bash

kbdrgb() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 'R G B'"
        exit 1
    fi

    RGB=$1
    echo $RGB | sudo tee /sys/class/leds/rgb:kbd_backlight/multi_intensity
}

kbdrgb "$1"
