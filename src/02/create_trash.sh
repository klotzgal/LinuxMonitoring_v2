#!/bin/bash

free_space() {
    str=$(df / -BM | grep / | awk '{print $4}')
    echo ${str//M/}
}

gen_all_path() {
    all_path=()
    for file in $(find / -type d -writable 2> /dev/null)
    do
    # ([ $file != "/bin" ] && [ $file != "/sbin" ])
        if !(echo "$file" | grep -E -qe "/bin" -e "/sbin" -e "/dev" -e "LinuxMonitoring") then
            all_path+=($file)
        fi
    done

}

folders_and_files() {
    local path=$4
    local size=$3
    nameGen $(($RANDOM % 100)) $1 &> /dev/null # названия папок
    all_folders=(${generated_names[@]})
    nameGen $(($RANDOM % 1000)) $2 files &> /dev/null # названия файлов
    all_files=(${generated_names[@]})
    
    for folder in ${all_folders[@]} 
    do
        if [ $(free_space) -le 1024 ]; then
            break
        fi
        echo "$path/$folder [$(date "+%d-%m-%Y")] " >> log.txt
        mkdir $path/$folder &> /dev/null
        for file in ${all_files[@]} 
        do
            if [ $(free_space) -le 1024 ]; then
                break
            fi
            echo "$path/$folder/$file [$(date "+%d-%m-%Y")] ${size%??}MB" >> log.txt
            fallocate -l ${size%??}MB $path/$folder/$file &> /dev/null 
        done
    done
}


while_df() {
    gen_all_path

    while ([ 0 != ${#all_path[@]} ])
    do 
    if [ $(free_space) -le 1024 ]; then
        break
    fi
        local i=$(($RANDOM % ${#all_path[@]}))
        path=${all_path[$i]}
        unset 'all_files[$i]'
        all_path=(${all_path[@]})
        folders_and_files $1 $2 $3 $path
    done
}