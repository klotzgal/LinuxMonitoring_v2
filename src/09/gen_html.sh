#!/bin/bash

HTML=/var/www/html/metrics/metrics.html
echo Html updating
while sleep 5
do
    CPU=$(top -b | head -n 3 | tail -n 1 | awk '{print $2}')
    RAM=$(free | grep Mem | awk '{print $2}')
    RAM_USED=$(free | grep Mem | awk '{print $3}')
    DISK=$(df / | grep / | awk '{print $2}')
    DISK_USED=$(df / | grep / | awk '{print $3}')
    echo "# HELP cpu CPU stats"> $HTML
    echo "# TYPE cpu gauge">> $HTML
    echo "cpu $CPU">> $HTML
    echo "# HELP ram_all bytes of RAM">> $HTML
    echo "# TYPE ram_all gauge">> $HTML
    echo "ram_all $RAM">> $HTML
    echo "# HELP ram_used used bytes of RAM">> $HTML
    echo "# TYPE ram_used gauge">> $HTML
    echo "ram_used $RAM_USED">> $HTML
    echo "# HELP disk_space bytes of all disk space">> $HTML
    echo "# TYPE disk_space gauge">> $HTML
    echo "disk_space $DISK">> $HTML
    echo "# HELP disk_space_used bytes of all disk space">> $HTML
    echo "# TYPE disk_space_used gauge">> $HTML
    echo "disk_space_used $DISK_USED">> $HTML
done



