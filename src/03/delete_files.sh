#!/bin/bash

log_del() {
    all_filepath=($(cat ../02/log.log | awk '{print $1}'))
    cur_path=$(pwd)
    del &> /dev/null
    cd $cur_path
}

mask_del() {
    read -p "Введите маску:" mask
    echo $mask _070823
    all_filepath=($(find / -name "*$mask" 2>/dev/null))
    del &> /dev/null
}

datetime_valid() {
    local y="^[0-9]{4}$"
    local m1="^0[1-9]$"
    local m2="^1[0-2]$"
    local d1="^0[1-9]$"
    local d2="^[1-2][0-9]$"
    local d3="^3[0-1]$"
    local h1="^[0-1][0-9]$"
    local h2="^2[0-3]$"
    local MS="^[0-5][0-9]$"
    # колдую временной массив
    local str=${1//-/ }
    str=${str//:/ }
    str=($str)
    
    if ((echo "${str[0]}" | grep -E -q -e $y ) && \
        (echo "${str[1]}" | grep -E -q -e $m1 -e $m2 ) && \
        (echo "${str[2]}" | grep -E -q -e $d1 -e $d2 -e $d3 ) && \
        (echo "${str[3]}" | grep -E -q -e $h1 -e $h2 ) && \
        (echo "${str[4]}" | grep -E -q -e $MS ) && \
        (echo "${str[5]}" | grep -E -q -e $MS )) 
    then
        res=0
    else
        res=1
    fi
    return $res
}

time_del() {
    echo "Введите дату и время в формате \"$(date '+%Y-%m-%d %H:%M:%S')\""
    read -p "Время начала: " start_time
    read -p "Время конца: " end_time
    datetime_valid "$start_time"
    if [ $? -eq 0 ]; then
        datetime_valid "$end_time"
        if [ $? -eq 0 ]; then
            if [ "$start_time" == "$end_time" ]; then
                end_time=$(date "+%Y-%m-%d %H:%M:%S" -d "$end_time + second")
            fi
            
            if [ $(date -d "$start_time" +%s) -le $(date -d "$end_time" +%s) ]; then
                end_time=$(date "+%Y-%m-%d %H:%M:%S" -d "$end_time + second")
                all_filepath=($(find / -newermt "$start_time" -not -newermt "$end_time" \
                2>/dev/null))
                del &>/dev/null
            else
                echo "Время конца должно быть позже времени начала"
            fi             
        else
            echo "Неверный формат даты конца"
        fi
    else
        echo "Неверный формат даты начала"
    fi

}
del() {    
    for file in ${all_filepath[@]}
    do 
        if !(echo "$file" | grep -E -qe "/dev" -e "/bin" -e "/proc" -e "LinuxMonitoring") then
        path=${file%/*} 
        cd ${file%/*} 
        rm -rf ${file##*/}
        echo ${file##*/}
        fi
    done
}