#!/bin/bash
. ./random_generators.sh


init_new_log() {
    str_count=$(($RANDOM % 900 + 100))
    time_step=$(date -d "@$((86400 / $str_count ))" "+%s")
}

one_day_log() {
    init_new_log
    log=${1////_}
    echo -n "" > $log.log
    for (( i=0; i < $str_count;i++ )) do
        t=$(($i * $time_step))
        day_time=$(date -d "@$t" "+%H:%M:%S %z")
        log_time="[$1:$day_time]"
        create_string "$log_time" >> $log.log
    done
}

create_string() {
    method=$(random_method)
    echo "$(random_ip) -- $1 \"$method $(random_location) HTTP/1.1\"\
 $(random_response $method) $(($RANDOM % 5000)) \"-\" \"$(random_agent)\""
}

main() {
    first_day=$(date "+/%b/%Y")
    for (( d=1;d < 6; d++ )) do
        day=0$d$first_day
        one_day_log "$day"
    done
}

main

#? 2** Успешные ответы
#* 200 Запрос выполнен успешно
#* 201 Запрос выполнен успешно, в результате чего был создан новый ресурс
#? 4** Ошибки клиента
#* 400 Сервер не может или не будет обрабатывать запрос клиента
#* 401 Неавторизованный(не прошедший проверку) пользователь
#* 403 Нет прав доступа к контенту
#* 404 Сервер не может найти запрошенный ресурс
#? 5** Ошибки сервера
#* 500 Неизвестная ошибка сервера
#* 501 Метод запроса не потдерживается и не может быть обработан
#* 502 Сервер-шлюз в результате передачи запроса получил недопустимый ответ
#* 503 Сервер не готов обработать запрос (отключен или перегружен)


















