#!/bin/bash

random_ip() {
    echo $(($RANDOM % 255)).$(($RANDOM % 255)).$(($RANDOM % 255)).$(($RANDOM % 255))
}

random_response() {
    local status_code=(200 400 401 403 404 500 502 503)
        if [ $1 != "GET" ]; then
            status_code=(${status_code[@]} 501)
            if [ $1 != "DELETE" ]; then
                status_code=(${status_code[@]} 201)
            fi
        fi
    echo ${status_code[$(($RANDOM % ${#status_code[@]}))]}
}

random_method() {
    local method=(GET POST PUT PATCH DELETE)
    echo ${method[$(($RANDOM % ${#method[@]}))]}
}

random_location() {
    local loc=(/ /status /page1 /page2 /page3 /api/v1/login /api/v1/account)
    echo ${loc[$(($RANDOM % ${#loc[@]}))]}
}

random_agent() {
    local agents=("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Firefox/90.0"
"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36"
"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 OPR/77.0.4054.277"
"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15"
"Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; rv:11.0) like Gecko"
"Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; rv:11.0) like Gecko"
"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
"python-requests/2.26.0")
    echo ${agents[$(($RANDOM % ${#agents[@]}))]}
}
