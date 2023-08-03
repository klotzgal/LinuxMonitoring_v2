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
    limit=$((250 - ${#arr[@]}))
    
    j=0
    pref=""
    letter=${arr[$j]}
    postf="${arr[@]}_$(date "+%d%m%y")"
    postf=${postf// /}
    postf=${postf:1}
    count=0
    complete_leters=""
    while [ $count -lt $number ]; do
        for (( i=1; i < $limit; i++ )) do
            res=$letter$res
            count=$(($count + 1))
            if [ $count -ge $number ]; then
                break
            fi
        done
        # echo "$pref[$res]$postf"
        # увеличение префикса и уменьшения предела
        if ([ $limit -gt 2 ] && [ $j -ne 0 ]) then
            pref=$pref${arr[$(($j - 1))]}
            limit=$(($limit - 1))
        # если префикс максимален, то переводим символ заполнения 
        # на следующий и переформируем остальные элементы
        else
            pref=$complete_leters${arr[$j]}
            complete_leters=$complete_leters${arr[$j]}
            j=$(($j + 1))
            letter=${arr[$j]}
            postf=${postf:1}
            limit=$((249 - ${#arr[@]}))
            if [ $j -eq ${#arr[@]} ]; then
                break
            fi
        fi
        mkdir ~/test/$pref$res$postf
        res=""
    done


    echo $count

    # res=$pref$res$postf
    

}

