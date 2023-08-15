#!/bin/bash
. ./validator.sh

conf="goaccess.conf"
log="../04/*.log"

# Список всех панелей, которые будут проигнорированны
# all_panels=$(grep -e "ignore-panel" goaccess.conf | awk '{print $2}') #| sed 's/#//' | sed 's/i/--i/')


parse_1() {
    flags="--sort-panel=STATUS_CODES,BY_DATA,ASC"
}

parse_2() {
    flags="--sort-panel=HOSTS,BY_DATA,ASC"
}

parse_3() {
    flags="--ignore-status=200 --ignore-status=201"
}

parse_4() {
    parse_3
    flags="$flags --sort-panel=HOSTS,BY_DATA,ASC"
}

valid $1 $2
if [ $? -eq 0 ]; then
    parse_$1 
    read -p "Преобразовать отчет в HTML формат?: (Y/N) " res
    if [ "$res" == "Y" ] || [ "$res" == "y" ] || [ "$res" == "yes" ]
    then
        HTML="-o report$1.html"
    fi
    goaccess  -p $conf -f $log $flags $HTML # $all_panels
fi

# all_panels=${all_panels// /}
# echo $all_panels