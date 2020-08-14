Ansible role: Harden linux (simplified)
---

Данная роль служит для обеспечения базовых настроек хоста. В ходе выполнения роли будут сделаны следующие действия:

* Обновлены все пакеты
* Установлены пакеты, содержащиеся в переменной `harden_linux_required_packages`

> По умолчанию содержит следующие пакеты:
- sshguard
- unattended-upgrades
- sudo
- git
- netcat
- nc
- nano
- curl
- bash-completion
- bash-completion-extras
- gcc
- python-devel
- python3-devel

* В случае выполнения на виртуальной машине, будет установлен пакет `open-vm-tools`
* Добавлен служебный пользователь AWX

> Переменные, относящиеся к параметрам пользователя AWX
 - `harden_linux_deploy_user_name`: Обязательное поле
 - `harden_linux_deploy_user_password`: Обязательное поле
 - `harden_linux_deploy_user_sshkey`: Обязательное поле
 - `harden_linux_deploy_user_uid`: Опциональное поле, значение по умолчанию `9999`
 - `harden_linux_deploy_user_shell`: Опциональное поле, значение по умолчанию `/bin/bash`

* Добавлены опции сервера SSH, отражённые в переменной `harden_linux_sshd_settings`

>
> Переменная `harden_linux_sshd_settings` имеет вид RegEx паттерна поиска и значения замены. Например:
> ```
> harden_linux_sshd_settings:
>   "^PermitRootLogin": "PermitRootLogin no"
>```
> В данном примере ищется строка, начинающаяся на `PermitRootLogin` и заменяется на `PermitRootLogin no`
>
> по умолчанию переменная содержит значения для запрета подключения юзеру root, запрет авторизации по паролю.

* Устанавливается параметр LC_CTYPE в значение en_DK.utf8 для избежания проблем с кодировкой и языком.
* Применяются настройки sysctl, отключающие IPv6 и повышающие общую безопасность системы (переменная harden_linux_sysctl_settings)
* В случае выполнения на Debian-based хосте, применяются настройки UFW, ограничивающие входящие подключения, отключается автоматическая генерация правил для IPv6.
* Добавление списка исключений для SSHGuard (Переменная `harden_linux_sshguard_whitelist`)

#### Изменение переменных влечёт за собой полную замену их значений!
То есть, в случае необходимости добавить пакет в список для установки, необходимо указать ВСЕ пакеты, которые требуется установить, в том числе, пакеты, устанавливаемые по умолчанию.



#### Авторство
Эта роль является упрощённой и адаптированной для RHEL версией роли [githubixx
/
ansible-role-harden-linux](https://github.com/githubixx/ansible-role-harden-linux).
