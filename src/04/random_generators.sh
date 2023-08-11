#!/bin/bash

random_ip() {
    echo $(($RANDOM % 255)).$(($RANDOM % 255)).$(($RANDOM % 255)).$(($RANDOM % 255))
}

random_response() {
    local status_code=(200 201 400 401 403 404 500 501 502 503)
    echo ${status_code[$(($RANDOM % ${#status_code[@]}))]}
}

random_request() {
    local method=(GET POST PUT PATCH DELETE)
    echo ${method[$(($RANDOM % ${#method[@]}))]}
}