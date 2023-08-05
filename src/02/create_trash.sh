#!/bin/bash

gen_all_path() {
    echo -n "" > l.txt
    all_path=()
    for file in $(find / -type d -writable 2> /dev/null)
    do
        if ([ $file != "/bin" ] && [ $file != "/sbin" ]) then
        echo $file
            all_path+=($file)
            echo $file >> l.txt
        fi
    done

}

folders_and_files() {
    gen_all_path
    nameGen $(($RANDOM % 100)) $1 &> /dev/null # названия папок
    all_folders=(${generated_names[@]})
    nameGen $RANDOM $2 files &> /dev/null # названия файлов
    all_files=(${generated_names[@]})
    echo $(($RANDOM % 100))
    echo $all_files
    # for folder in ${all_folders[@]} 
    # do
    #     if [ $(df / | grep / | awk '{print $4}') -gt 1048576 ]; then
    #         mkdir $folder &> /dev/null
    #         echo "$folder [$(date "+%d-%m-%Y")] " >> log.txt
    #         for file in ${all_files[@]} 
    #         do
    #             fallocate -l $6KB $folder/$file &> /dev/null
    #             echo "$folder/$file [$(date "+%d-%m-%Y")] $6KB" >> log.txt
    #         done
    #     fi
    # done
    # echo ${all_path[@]} > 1.txt
}

