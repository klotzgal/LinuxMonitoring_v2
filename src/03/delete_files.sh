#!/bin/bash

log_del() {
    all_filepath=($(cat ../02/log.txt | awk '{print $1}'))
    cur_path=$(pwd)
    del &> /dev/null
    cd $cur_path
    echo  "" > ../02/log.txt
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
    # read -p "Время начала:" start_time
    # read -p "Время конца:" end_time
    start_time="2023-08-07 19:28:49"
    end_time="2023-08-07 20:20:49"

    echo start $start_time
    echo end $end_time
    datetime_valid "$start_time"
    if [ $? -eq 0 ]; then
        datetime_valid "$end_time"
        if [ $? -eq 0 ]; then
            echo "start/s $(date -d "$start_time" +%s)"
            echo "end/s   $(date -d "$end_time" +%s)"
            if [ $(date -d "$start_time" +%s) -le $(date -d "$end_time" +%s) ]; then
                
                all_filepath=($(find / -newermt "$start_time" -not -newermt "$end_time" \
                2>/dev/null))
                echo ${all_filepath[@]} > a.txt
                del
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
    # echo $all_filepath
    for file in ${all_filepath[@]}
    do 
        if !(echo "$file" | grep -E -qe "/dev" -e "s/dev" -e "/proc" -e "LinuxMonitoring") then
        # echo $file >> r.txt

        path=${file%/*} 
        cd ${file%/*} 
        rm -r ${file##*/}
        echo path
        echo ${file##*/}
        fi
    done



    # # cat ../01/log.txt | awk '{print $1}' | xargs rm
    # all_filepath=($(cat ../02/log.txt | awk '{print $1}'))
    # ahah=($(cat ../02/l.txt | awk '{print $1}'))
    # for p in ${ahah[@]}
    # do
    #     for file in ${all_filepath[@]}
    #     do
    #     cd $p
    #         rm -r ${file%%/*} 
    #         # rm -r ${file##*/}
    #         # echo path
    #         # echo $(ls)
    #         echo ${file##*/}
    #     done
    # done


}