#!/bin/bash
. ./validator.sh
. ./delete_files.sh

# cur_path=$(pwd)
# del $1
# cd $cur_path


valid $1 $2 $3
if [ $? -eq 0 ]; then
    if [ $1 -eq 1 ]; then
        echo log_del
        log_del
    elif [ $1 -eq 2 ]; then
        echo time_del
        time_del
    elif [ $1 -eq 3 ]; then
        echo mask_del
        mask_del
    fi
fi




