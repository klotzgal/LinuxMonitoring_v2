#!/bin/bash

parse_str() {
    str=$1
    # парсим строку на массив уникальных букв
    echo массив как строка ${str:3:1}
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
        echo last = ${arr[-1]}
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
    letter=${arr[$j]}
    postf="${arr[@]}_$(date "+%d%m%y")"
    postf=${postf// /}
    postf=${postf:1}
    j=0
    count=0
    complete_leters=""
    generated_names=""
}

# * Принимает путь, число папок, строку символов и генерировать имена файлов или папок 
nameGen() {
    path=$1
    number=$2
    str=$3
    is_file=$4
    parse_str $str $is_file # arr, ext
    echo "|${arr[@]}|${#arr[@]}|$ext|${#ext}"
    init # вспомогательные аргументы
    echo "" > log.txt
    while [ $count -lt $number ]; do
        for (( i=1; i < $limit; i++ )) do
            filler=$letter$filler
            echo "$path$pref$filler$postf$ext" >> log.txt
            generated_names+=($path$pref$filler$postf$ext)
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
            limit=$((249 - ${#arr[@]}))
            if [ $j -eq ${#arr[@]} ]; then
                break
                # TODO: Убать брейк
            fi
        fi
        filler=""
    done
    echo $count
}

