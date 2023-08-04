#!/bin/bash
. ./validator.sh
. ./generate_name.sh

a=$1
if [ ${a: -1} != "/" ]; then
    a="$a/"
fi

valid $a $2 $3 $4 $5 $6
if [ $? -eq 1 ]; then
    exit 1
fi

# nameGen $a $2 $3

nameGen $a $2 $5 "f"

s=(${generated_names[@]})
echo arr = ${s[224]}


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

