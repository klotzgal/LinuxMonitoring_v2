#!/bin/bash

valid() {
# count of arg
if [ $# -ne 6 ]; then
    echo "Аргументов должно быть ровно 6"
fi
# 1 arg
if !(ls -la $1 &> /dev/null) then
    echo "Папка не открывается("
    exit 1
fi
# 2 arg
if !(echo "$2" | grep -E -q "^[0-9]+$") then 
    echo "Вторым аргументом должно быть положительное количество вложеных папок"
    exit 1
fi

# if [ $2 -lt 1 ]; then
#     echo "Маловато папок("
#     exit 1
# fi 

# 3 arg
if !(echo "$3" | grep -E -q "^[a-z]+$") then
    echo "Третий аргумент должен задавать символы, из которых состоит название папок"
    exit 1
fi

if [ ${#3} -gt 7 ]; then
    echo "Слишком много символов в 3 аргументе"
    exit 1
fi
# 4 arg
if !(echo "$4" | grep -E -q "^[0-9]+$") then 
    echo "Четвертым аргументом должно быть положительное количество файлов в каждой папке"
    exit 1
fi
# 5 arg
if !(echo "$5" | grep -E -q "^[a-z]{1,7}.[a-z]{1,3}$") then
    echo "Пятый аргумент аргумент должен содержать не более 7 символов названия файлов, точку и не более 3 символов расширения файлов" 
fi
# 6 arg
if (!(echo "$6" | grep -E -q "^[0-9]+$") || [ $6 -gt 100 ];)
then 
    echo "Шестым аргументом должно быть положительный размер файлов, не превышающий 100"
    exit 1
fi
}
