#!/bin/bash

HTML=/var/www/html/metrics/metrics.html

while [ 1 -eq 1 ]
do
    CPU=$(lscpu | grep -e "CPU MHz" | awk '{print $3}' | awk 'BEGIN {FS="."}{ print $1}')
    RAM=$(free | grep Mem | awk '{print $7}')
    DISK=$(df / | grep / | awk '{print $4}')
    DISK=${DISK/G/}
    echo "# HELP avail_cpu CPU stats"> $HTML
    echo "# TYPE avail_cpu gauge">> $HTML
    echo "avail_cpu $CPU">> $HTML
    echo "# HELP avail_ram available bytes RAM">> $HTML
    echo "# TYPE avail_ram gauge">> $HTML
    echo "avail_ram $RAM">> $HTML
    echo "# HELP avail_disk_space bytes of available disk space">> $HTML
    echo "# TYPE avail_disk_space gauge">> $HTML
    echo "avail_disk_space $DISK">> $HTML
    sleep 3
done



