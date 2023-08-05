#!/bin/bash

folders_and_files() {
    nameGen $1 $2 $3 &> /dev/null # названия папок
    all_folders=(${generated_names[@]})
    nameGen $path $4 $5 files &> /dev/null # названия файлов
    all_files=(${generated_names[@]})
    # echo -n "" > log.txt
    for folder in ${all_folders[@]} 
    do
        if [ $(df / | grep / | awk '{print $4}') -gt 1048576 ]; then
            mkdir $folder &> /dev/null
            echo "$folder [$(date "+%d-%m-%Y")] " >> log.txt
            for file in ${all_files[@]} 
            do
                fallocate -l ${6%??}KB $folder/$file &> /dev/null
                echo "$folder/$file [$(date "+%d-%m-%Y")] ${6%??}KB" >> log.txt
            done
        fi
    done
}
