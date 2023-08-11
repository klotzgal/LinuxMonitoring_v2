#!/bin/bash
. ./validator.sh
. ./delete_files.sh

valid $1 $2 $3
if [ $? -eq 0 ]; then
    if [ $1 -eq 1 ]; then
        log_del
    elif [ $1 -eq 2 ]; then
        time_del
    elif [ $1 -eq 3 ]; then
        mask_del
    fi
fi




