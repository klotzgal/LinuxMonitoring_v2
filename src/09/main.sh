#!/bin/bash
# . ./validator.sh

HTML=/var/www/html/metrics/metrics.html

while [ 1 -eq 1 ]
do
    echo -n "" > $HTML
    
    CPU=$(lscpu | grep -e "CPU MHz" | awk '{print $3}' ) #| awk 'BEGIN {FS="."}{ print $1}')
#     curl -X POST -H  "Content-Type: text/plain" --ipv4 --data "$CPU" http://localhost:12345/metrics
    echo "<!DOCTYPE html><html><head>">> $HTML
    echo "<title>My exporter</title></head><body>">> $HTML
    echo "# HELP avail_cpu CPU stats<br>">> $HTML
    echo "# TYPE avail_cpu counter<br>">> $HTML
    echo "avail_cpu $CPU<br></body>">> $HTML
    sleep 3
done 





# valid $1 $2 $3
# if [ $? -eq 0 ]; then
# fi




