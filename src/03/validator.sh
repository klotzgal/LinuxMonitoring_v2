#!/bin/bash

valid() {
# count of arg
res=0
if [ $# -ne 1 ]; then
    echo "Аргументов должно быть ровно 1."
    res=1
fi
# 1 arg
if !(echo "$1" | grep -E -q "^[1-3]$") then
    echo "Способ отчистки системы от скипта из 2 части:"
    echo "1. По лог файлу"
    echo "2. По дате и времени создания"
    echo "3. По маске имени"
    res=1
fi

return $res
}
