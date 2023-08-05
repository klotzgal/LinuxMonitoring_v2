#!/bin/bash

parse_str() {
    str=$1
    arr=()
    # парсим строку на массив уникальных букв
    for (( i=0; (i < ${#str}); i++ )) do
        if [ ${str:$i:1} == "." ]; then
            i=$(($i+1))
            break
            # TODO: Убрать брейк 
        elif !(echo ${arr[@]} | grep -q "${str:$i:1}" ) then
            arr+=(${str:$i:1})
        fi
    done
    if [ $# -eq 2 ]; then
        ext=""
        while [ $i -lt ${#str} ]; do
            ext=${str:$i:1}$ext
            i=$(($i+1))
        done
        ext=.$ext
    fi
}

init() {
    filler=""
    limit=$((250 - ${#arr[@]} - ${#ext}))
    pref=""
    j=0
    letter=${arr[$j]}
    postf="${arr[@]}_$(date "+%d%m%y")"
    postf=${postf// /}
    postf=${postf:1}
    count=0
    complete_leters=""
    generated_names=()
}

# * Принимает путь, число папок, строку символов и генерировать имена файлов или папок 
nameGen() {
    path=$1
    number=$2
    parse_str $3 $4 # arr, ext
    init # вспомогательные аргументы
    while [ $count -lt $number ]; do
        for (( i=1; i < $limit; i++ )) do
            filler=$letter$filler
            if [ $# -eq 4 ]; then
                generated_names+=($pref$filler$postf$ext)
            else
                generated_names+=($path$pref$filler$postf$ext)
            fi
            count=$(($count + 1))
            if [ $count -ge $number ]; then
                break
            fi
        done
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
            limit=$((248 - ${#arr[@]}))
            if [ $j -eq ${#arr[@]} ]; then
                break
                # TODO: Убать брейк
            fi
        fi
        filler=""
    done
}

