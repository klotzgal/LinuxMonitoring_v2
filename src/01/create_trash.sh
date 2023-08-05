#!/bin/bash

folders_and_files() {
    nameGen $1 $2 $3 # названия папок
    all_folders=(${generated_names[@]})
    nameGen $a $4 $5 files
    all_files=(${generated_names[@]})
    disk_size=$(df / | grep / | awk '{print $2}')
    for folder in ${all_folders[@]} 
    do
        disk_used=$(df / | grep / | awk '{print $3}')
        if [ $(echo "$disk_size - $disk_used" | bc) -lt 1048576 ]; then
            break
        fi
        mkdir $folder
        # echo $folder
        for file in ${all_files[@]} 
        do
            disk_used=$(df / | grep / | awk '{print $3}')
            if [ $(echo "$disk_size - $disk_used" | bc) -lt 1048576 ]; then
                break
            fi
            # echo $folder/$file
            fallocate -l $6KB $folder/$file  
            
        done
    done

    

    # nameGen $1 $2 $3 files
    echo 

    # nameGen $a $2 $5 1

    
    echo arr = ${s[224]}

}