#!/bin/bash
. ./validator.sh
. ./generate_names.sh
. ./create_trash.sh

a=$1
if [ ${a: -1} != "/" ]; then
    a="$a/"
fi

valid $a $2 $3 $4 $5 $6
if [ $? -eq 1 ]; then
    exit 1
fi

folders_and_files $a $2 $3 $4 $5 $6

# for (( i=1; i <= 4; i++ )) do
#     sleep 1
#     echo -ne "$i" 
#     if [ $i -lt 4 ]
#     then
#         echo -ne "\r"
#     else
#         echo
#     fi
# done

