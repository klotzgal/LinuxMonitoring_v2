#!/bin/bash
. ./validator.sh

valid $1 $2 $3 $4 $5 $6

for (( i=1; i <= 4; i++ )) do
    sleep 1
    echo -ne "$i" 
    if [ $i -lt 4 ]
    then
        echo -ne "\r"
    else
        echo
    fi
done