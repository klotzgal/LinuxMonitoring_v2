#!/bin/bash
# . ./validator.sh

while [ 1 -eq 1 ]
do
    CPU=$(lscpu | grep -e "CPU MHz" | awk '{print $3}')
    curl -X POST -H  "Content-Type: text/plain" --data "$CPU" http://localhost:9090/metrics/
    sleep 3
done




# valid $1 $2 $3
# if [ $? -eq 0 ]; then
# fi




