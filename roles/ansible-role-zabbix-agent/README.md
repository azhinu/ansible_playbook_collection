Ansible Role: Deploy Zabbix agent
---

Данная роль размещает Zabbit agent на указанных хостах. В случае если указанный хост -- FreePBX, будет добавлен конфиг для мониторинга Asterisk.

Роль использует следующие переменные:

- `zabbix_server_active`: Указывает параметр ServerActive. Значение по умолчанию `no`
- `zabbix_client_port`: Порт, используемый для подключения к Zabbix agent, по умолчанию `10050`
- `zabbix_server_ip`: Адрес Zabbix сервера, по умолчанию `192.168.232.30`
- `add_firewall_rule`: При значении True в фаерволл будет добавлено правило, разрешающее подключаться к Zabbix agent.
