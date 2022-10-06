#!/bin/sh

RES=$(playerctl status)

if [ $RES == "Playing" ]; then
    echo "||"
else
    echo ">"
fi
