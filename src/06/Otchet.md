
## Part 6. **GoAccess**

1. Установил GoAccess 
    - sudo apt install goaccess
2. Создал свой конфиг файл goaccess.conf, скопировав /etc/goaccess/goaccess.conf
3. Раскомментировал сточки:
    - time-format %H:%M:%S
    - date-format %d/%b/%Y
    - log-format %h %^[%d:%t %^] "%r" %s %b "%R" "%u"
4. Написал main.sh на подобии скрипта из 5 части, чтобы удобней было вводить флаги


С помощью утилиты GoAccess получить ту же информацию, что и в [Части 5](#part-5-мониторинг)

Открыть веб интерфейс утилиты на локальной машине.


