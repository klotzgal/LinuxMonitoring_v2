#!/bin/bash

nameGen() {
    str=$2


    # парсим строку на массив уникальных букв
    for (( i=0; i < ${#str}; i++ )) do
        if !(echo ${arr[@]} | grep -qw "${str:$i:1}") then
            arr+=(${str:$i:1})
            echo ${str:$i:1}
        fi
    done
    echo "|${arr[@]}|${#arr[@]}"

    res=${arr[@]}
    res=${res// /} # замена пробелов на ничто
    limit=$((249 - ${#arr[@]}))
    pref=${arr[0]}
    echo pref = $pref
# первый способ записи макс имени
    for (( i=1; i < $limit; i++ )) do
        res=${pref}a${res:${#pref}}
    done
    last="_$(date "+%d%m%y")"



    res=$res"_$(date "+%d%m%y")"
    mkdir $res

}