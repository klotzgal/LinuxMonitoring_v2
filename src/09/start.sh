#!/bin/bash

if [ $(whoami) != "root" ]; then
    echo "Запускать этот скрипт следует с sudo,"
    echo "либо конфигурация NGINX и Prometheus должна быть настроена заранее."
    read -p "Вы уверены, что хотите продолжить от имени $(whoami)?: (Y/N) " res
    if [ "$res" == "Y" ] || [ "$res" == "y" ] || [ "$res" == "yes" ]
    then
    . ./gen_html.sh 
    fi
else
    cp nginx.conf /etc/nginx/nginx.conf 
    nginx -s reload
    cp prometheus.yml /etc/prometheus/prometheus.yml
    systemctl restart prometheus.service
    . ./gen_html.sh 
fi


