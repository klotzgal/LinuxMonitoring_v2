#!/bin/bash

nameGen() {
    path=$1
    number=$2
    str=$3

    # парсим строку на массив уникальных букв
    for (( i=0; i < ${#str}; i++ )) do
        if !(echo ${arr[@]} | grep -qw "${str:$i:1}") then
            arr+=(${str:$i:1})
        fi
    done
    echo "|${arr[@]}|${#arr[@]}"

    res=""
    # res=${res// /} # замена пробелов на ничто
    limit=$((249 - ${#arr[@]}))
    
# первый способ записи макс имени
    j=0
    pref=""
    letter=${arr[$j]}
    echo pref = $pref
    postf="${arr[@]}_$(date "+%d%m%y")"
    postf=${postf// /}
    postf=${postf:1}
    count=0
    while [ $count -lt $number ]; do
        for (( i=1; i < $limit; i++ )) do
            res=$letter$res
            count=$(($count + 1))
            if [ $count -ge $number ]; then
                break
            fi
        done
        echo $pref$res$postf
        pref=$pref${arr[$j]}
        j=$(($j + 1))
        letter=${arr[$j]}
        postf=${postf:1}
        res=""
    done


    echo $count

    res=$pref$res$postf
    # mkdir $res

}