#!/bin/bash
. ./validator.sh
. ./generate_names.sh
. ./create_trash.sh

valid $1 $2 $3
if [ $? -eq 0 ]; then
    folders_and_files $1 $2 $3
fi




