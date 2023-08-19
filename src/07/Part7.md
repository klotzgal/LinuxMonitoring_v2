## Part 7. **Prometheus** и **Grafana**



**== Задание ==**

##### Установить и настроить **Prometheus** и **Grafana** на виртуальную машину
##### Получить доступ к веб интерфейсам **Prometheus** и **Grafana** с локальной машины

1. Установил NGINX и дополнительные пакеты, 
- sudo apt install nginx
- sudo apt-get install build-essential
- sudo apt-get install -y adduser libfontconfig1
2. Скачал Grafana на свой компьютер через ВПН, перекинул на виртуалку и распаковал архив.
- sudo dpkg -i grafana-enterprise_9.4.7_amd64.deb
3. Выполнил комманды, предложенные при установке
- sudo /bin/systemctl daemon-reload
- sudo /bin/systemctl enable grafana-server
4. Запустил сервер Grafana
- sudo /bin/systemctl start grafana-server
!["Grafana"](../../misc/images/screens/7.1.png)
5. Grafana запущена использует порт 3000, который нужно соединить с портом на локальной машине.
!["Grafana"](../../misc/images/screens/7.2.png)
!["Grafana"](../../misc/images/screens/7.3.png)
6. Открыл в браузере http://http://localhost:30000/
!["Grafana"](../../misc/images/screens/gr.png)
7. Установил Prometheus
- sudo apt install prometheus
!["Prometheus"](../../misc/images/screens/7.4.png)
8. Prometheus слушает порт 9090, который также необходимо пробросить на хост.
!["Prometheus"](../../misc/images/screens/7.5.png)
9. Открыл в браузере http://http://localhost:19090/
!["Prometheus"](../../misc/images/screens/pr.png)


##### Добавить на дашборд **Grafana** отображение ЦПУ, доступной оперативной памяти, свободное место и кол-во операций ввода/вывода на жестком диске

1. Добавил:
    - CPU
    !["Dashboard"](../../misc/images/screens/7.6.png)
    - RAM
    !["Dashboard"](../../misc/images/screens/7.7.png)
    - Free space
    !["Dashboard"](../../misc/images/screens/7.8.png)
    - IOPS (кол-во операций ввода/вывода на жестком диске)
    !["Dashboard"](../../misc/images/screens/7.9.png)
    - Также дополнительно добавил процент занятого места на диске
    !["Dashboard"](../../misc/images/screens/7.10.png)





##### Запустить ваш bash-скрипт из [Части 2](#part-2-засорение-файловой-системы)
##### Посмотреть на нагрузку жесткого диска (место на диске и операции чтения/записи)
1. После запуска
    !["Script"](../../misc/images/screens/7.11.png)
2. После отчистки
    !["Script"](../../misc/images/screens/7.12.png)

##### Установить утилиту **stress** и запустить команду `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`
##### Посмотреть на нагрузку жесткого диска, оперативной памяти и ЦПУ
После запуска утилиты stress
    !["stress"](../../misc/images/screens/7.13.png)