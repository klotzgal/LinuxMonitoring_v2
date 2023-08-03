#!/bin/bash

parse_str() {
    str=$1
        # парсим строку на массив уникальных букв
    for (( i=0; i < ${#str}; i++ )) do
        if !(echo ${arr[@]} | grep -qw "${str:$i:1}") then
            arr+=(${str:$i:1})
        fi
    done
    if [ $# -eq 2 ]; then
        ext=""
        arr+=(".")
        echo ${arr}
        # while [ ${arr: -1} != "." ]; do
        #     ext=${arr: -1}$ext
        #     arr
        # done

    fi

}

init() {
    res=""
    limit=$((250 - ${#arr[@]}))
    pref=""
    letter=${arr[$j]}
    postf="${arr[@]}_$(date "+%d%m%y")"
    postf=${postf// /}
    postf=${postf:1}
    j=0
    count=0
    complete_leters=""
}

nameGen() {
    path=$1
    number=$2
    str=$3
    ext=$4
    parse_str $str $ext # arr
    echo "|${arr[@]}|${#arr[@]}"
    # вспомогательные аргументы
    init
    while [ $count -lt $number ]; do
        for (( i=1; i < $limit; i++ )) do
            res=$letter$res
            echo "$path$pref$res$postf" >> log.txt
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
        # mkdir $path$pref$res$postf
        # touch $path$pref$res$postf.rr
        res=""
    done
    echo $count
}

