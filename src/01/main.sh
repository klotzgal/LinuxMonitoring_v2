#!/bin/bash
. ./validator.sh
. ./generate_names.sh
. ./create_trash.sh

path=$1
if [ ${path: -1} != "/" ]; then
    path="$path/"
fi

valid $path $2 $3 $4 $5 $6
if [ $? -eq 0 ]; then
    folders_and_files $path $2 $3 $4 $5 $6
fi




