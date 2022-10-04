#!/bin/bash

freq=0
# Get CPU frequency
freq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)

# Output frequency in MHz
echo $((freq / 1000))
