Ansible Playbook: Add User
---

Данный плейбук приводит состояние пользователя к указанным параметрам.

##### Возможные параметры:

`username`:  Имя пользователя (Обязательный параметр)

`uid`: UID пользователя

`password`: Пароль пользователя в виде SHA512.
>Для генерации можно использовать следующие способы:
>
> ```
> mkpasswd --method=SHA-512
>```
>```
> python -c 'import crypt,getpass; print(crypt.crypt(getpass.getpass(), crypt.mksalt(crypt.METHOD_SHA512)))'
>```
>
> В случае, если поле не задано, авторизация пройдёт без пароля, а логине будет предложено задать пароль.


`update_password`: — Может принимать значения `always` и `on_create`, по умолчанию используется `on_create`.

> В случае использования значения `always` без указания пароля, пароль будет удалён, а при следующем логине пользователю будет предложено задать его.

`groups`: Список групп, к которым принадлежит пользователь через запятую.

`comment`: Комментарий к пользователю.

`use_sudo`: Может принимать значения `True/False` в случае значения `True`, пользователю будет добавлена группа `sudo` или `wheel`, в зависимости от OS, установленной на хосте. Значение по умолчанию `False`.

`ssh_key`: Позволяет задать ключ для доступа к серверу по SSH.

`user_state`: — Может принимать значения `present` и `lock`. В случае значения `present`, пользователь создаётся, в случае значения `lock` пользователь блокируется. (Обязательный параметр)

#### Примеры Inventory
``` yaml
users:
- username: tester
  password: |
    $6$EG9ucdhKIg1Wt$ydSSe6I9qaDAD7uCILIkCz/weanh2nCq8VlawLowZA2GTum.cwc6MQ315jNREMuotOpPYTsfr5NmeQB6NOOCF1
  use_sudo: true
  ssh_key: |
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwxnIc896RN0F51o6dVFko3EXjoiUnl5NipYvpmq8rdru54dPWFwh6b+EztGyO6CEmQ6A1BGrSiUC19hR9eORUqHp4ybsgVD4zZCDRy4zV1g4sCUnP5nLA3+zlIPpi1PUwRWBajaS1HaMETM/GP4nOmv4Yg0l98ReOWli/n5twMYqbZCJnJIqTKVGBGvL4jfWpmCEnB2i2bFCqkMWltOcYJD9Voc9n3s6FUWgCOvN4qN3y6kuMGby8IkMCeyqSRX73r6KtegyYbzF0Ic4HVg/n6D8IViNk/ZXt/JmPLHCl1LTkvUWCkvtf12QWELwogIZ6Z486nQJKgPJ8JyADTr/XqdwGWQ0K552UOGjYmXMbUz5SGxte8Dr03bAoPoRHDJl7YaqaUXL9/tTQ+2k+VNDd4L8CbAkurXzDH6Oc3P3q/WzYu0bnB2g3XeZvF8uhNzLWXmE0FZIcS0/vbxIN+adJo1143iR0dabkeHhg3cEW0KHMwvpLfFO9Kaqn0/eHZls=
  user_state: present

- username: tester2
  use_sudo: true
  ssh_key: |
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwxnIc896RN0F51o6dVFko3EXjoiUnl5NipYvpmq8rdru54dPWFwh6b+EztGyO6CEmQ6A1BGrSiUC19hR9eORUqHp4ybsgVD4zZCDRy4zV1g4sCUnP5nLA3+zlIPpi1PUwRWBajaS1HaMETM/GP4nOmv4Yg0l98ReOWli/n5twMYqbZCJnJIqTKVGBGvL4jfWpmCEnB2i2bFCqkMWltOcYJD9Voc9n3s6FUWgCOvN4qN3y6kuMGby8IkMCeyqSRX73r6KtegyYbzF0Ic4HVg/n6D8IViNk/ZXt/JmPLHCl1LTkvUWCkvtf12QWELwogIZ6Z486nQJKgPJ8JyADTr/XqdwGWQ0K552UOGjYmXMbUz5SGxte8Dr03bAoPoRHDJl7YaqaUXL9/tTQ+2k+VNDd4L8CbAkurXzDH6Oc3P3q/WzYu0bnB2g3XeZvF8uhNzLWXmE0FZIcS0/vbxIN+adJo1143iR0dabkeHhg3cEW0KHMwvpLfFO9Kaqn0/eHZls=
  user_state: present

- username: tester3
  user_state: lock
```
