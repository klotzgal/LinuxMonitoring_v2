#!/bin/bash
. ./validator.sh
. ./generate_names.sh
. ./create_trash.sh


valid $1 $2 $3
if [ $? -eq 0 ]; then
    echo  "" > log.log
    echo "start time $(date "+%H:%M:%S")"
    echo "start time $(date "+%H:%M:%S")" >> log.log
    while_df $1 $2 $3
    echo "end time $(date "+%H:%M:%S")"
    echo "end time $(date "+%H:%M:%S")" >> log.log
fi




