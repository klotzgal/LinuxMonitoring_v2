## Part 8. Готовый дашборд

Собственно, зачем составлять собственный дашборд, если, как говорится, "всё уже украдено до нас"?
Почему бы не взять готовый дашборд, на котором есть все нужные метрики?

1. Скачал Node explorer
- wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
- tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz
2. Создал Node Exporter Server
- cd node_exporter-1.2.2.linux-amd64/
- `sudo touch /etc/systemd/system/node_exporter.service | sudo vim /etc/systemd/system/node_exporter.service`
!["Node_explorer"](../../misc/images/screens/8.6.png)
- sudo /bin/systemctl daemon-reload
- sudo systemctl restart node_exporter
- 

**== Задание ==**

##### Установить готовый дашборд *Node Exporter Quickstart and Dashboard* с официального сайта **Grafana Labs**

1. Нашел дашборд на сайте и скопировал ID
!["Grafana Labs"](../../misc/images/screens/8.1.png)
2. Вкладка импорт
!["Grafana Labs"](../../misc/images/screens/8.2.png)
3. Вставил ID, нажал load. Импортировал дашборд.
!["Grafana Labs"](../../misc/images/screens/8.3.png)

##### Провести те же тесты, что и в [Части 7](#part-7-prometheus-и-grafana)
1. Запуск скрипта из 2 части
!["Test"](../../misc/images/screens/8.test1.png)
2. Отчистка скрипта
!["Test"](../../misc/images/screens/8.test2.png)
3. stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s
!["Test"](../../misc/images/screens/8.test3.png)

##### Запустить ещё одну виртуальную машину, находящуюся в одной сети с текущей
1. Создал новую машину и добавил к обоим машинам адаптер на внутреннюю сеть
!["New VM"](../../misc/images/screens/8.4.png)
2. Настроил IP адреса, чтобы машины были в одной сети
!["New VM"](../../misc/images/screens/8.5.png)
3. Проверил пинг
!["New VM"](../../misc/images/screens/8.6.png)






##### Запустить тест нагрузки сети с помощью утилиты **iperf3**

##### Посмотреть на нагрузку сетевого интерфейса


## Part 9. Дополнительно. Свой *node_exporter*

Анализировать систему с помощью специальных утилит полезно и удобно, но Джону всегда хотелось понять, как же они работают.

**== Задание ==**

Написать bash-скрипт или программу на Си, которая собирает информацию по базовым метрикам системы (ЦПУ, оперативная память, жесткий диск (объем)).
Скрипт или программа должна формировать html страничку по формату **Prometheus**, которую будет отдавать **nginx**. \
Саму страничку обновлять можно как внутри bash-скрипта или программы (в цикле), так и при помощи утилиты cron, но не чаще, чем раз в 3 секунды.

##### Поменять конфигурационный файл **Prometheus**, чтобы он собирал информацию с созданной вами странички.

##### Провести те же тесты, что и в [Части 7](#part-7-prometheus-и-grafana)


